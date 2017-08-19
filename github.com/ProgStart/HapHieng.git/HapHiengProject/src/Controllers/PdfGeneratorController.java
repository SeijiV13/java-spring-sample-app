package Controllers;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

@Controller
public class PdfGeneratorController {

	@RequestMapping(value = "/GeneratePdf", method = RequestMethod.GET)
	ModelAndView generatePdf(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView modelAndView = new ModelAndView("pdfView");
		return modelAndView;
	}
	
	@RequestMapping(value="/getpdf")
	public ResponseEntity<byte[]> getPDF(@RequestBody String json) throws FileNotFoundException, IOException, DocumentException {		
		String DEST = "C://tmp//report.pdf";
		File file = new File(DEST);
		file.getParentFile().mkdirs();
		//createPdf(DEST);

	    // retrieve contents of "C:/tmp/report.pdf" that were written in showHelp
	    byte[] contents = IOUtils.toByteArray(new FileInputStream(DEST));

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.parseMediaType("application/pdf"));
	    String filename = "output.pdf";
	    headers.setContentDispositionFormData(filename, filename);
	    headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	    ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
	    return response;
	}
	
    public static void createPdf(String file, String[] components) throws IOException, DocumentException {
        // step 1
        Document document = new Document(PageSize.LETTER);
        // step 2
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));
        // step 3
        document.open();
        // step 4 
        CSSResolver cssResolver = new StyleAttrCSSResolver();
        CssFile cssFile = XMLWorkerHelper.getCSS(new ByteArrayInputStream(components[1].getBytes()));
        //CssFile cssFile = XMLWorkerHelper.getCSS(new FileInputStream(STYLE));
        cssResolver.addCss(cssFile);
 
        // HTML
        HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
 
        // Pipelines
        PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
        HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
        CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
 
        // XML Worker
        XMLWorker worker = new XMLWorker(css, true);
        XMLParser p = new XMLParser(worker);
        p.parse(new ByteArrayInputStream(components[0].getBytes()));
        //p.parse(new FileInputStream(HTML),Charset.forName("cp1252"));
 
        // step 5
        document.close();
    }
    
    public static String[] generateReceipt(String details, String items) throws JSONException{
        JSONObject detailsObj = new JSONObject(details);
        JSONArray itemsArr = new JSONArray(items);
    	
        String receiptName = detailsObj.getString("receiptName");
		String customer = detailsObj.getString("customer");
		String terms = detailsObj.getString("terms");
		double totalAmt = detailsObj.getDouble("totalAmt");
		String dateIn = detailsObj.getString("date");
		String refNo = detailsObj.getString("refno");
		String currency = detailsObj.getString("currency");
		String wcrc = detailsObj.getString("wcrc");
		String senderAddress = detailsObj.getString("senderAddress");
		String receiverAddress = detailsObj.getString("receiverAddress");
		
    	StringBuilder html = new StringBuilder();
    	html.append("<html>");
    	html.append("<body>");
    	html.append("        <section id=\"haphieng-details\">");
    	html.append("            <h1>" + receiptName + "</h1>    ");
    	html.append("            <p>" + senderAddress + "</p>");
    	html.append("        </section>");
    	html.append("		<br></br>");
    	html.append("		<br></br>");
    	html.append("        <h2>Delivery Receipt</h2>");
    	html.append("		<p></p>");
    	html.append("		<br></br>");
    	html.append("		<hr></hr>");
    	html.append("		<table style=\"width:100%\">");
    	html.append("			<tbody>");
    	html.append("				<tr>");
    	html.append("					<td class=\"header\" style=\"width:50%; background-color: #FFFFFF\">Delivered to: <u>" + customer + "</u></td>");
    	html.append("					<td class=\"header\" style=\"width:50%; background-color: #FFFFFF\">Date: <u>" + dateIn + "</u></td>");
    	html.append("				</tr>");
    	html.append("				<tr>");
    	html.append("					<td class=\"header\" style=\"width:50%; background-color: #FFFFFF\">Address: <u>" + receiverAddress + "</u></td>");
    	html.append("					<td class=\"header\" style=\"width:50%; background-color: #FFFFFF\">Terms: <u>" + terms + "</u></td>");
    	html.append("				</tr>");
    	html.append("				<tr>");
    	html.append("					<td class=\"header\" style=\"width:50%; background-color: #FFFFFF\">&nbsp;</td>");
    	html.append("					<td class=\"header\" style=\"width:50%; background-color: #FFFFFF\">&nbsp;</td>");
    	html.append("				</tr>");
    	html.append("			</tbody>");
    	html.append("		</table>");
    	html.append("		<p></p>");
    	html.append("");
    	html.append("		<table style=\"width:100%\">");
    	html.append("		<thead>");
    	html.append("			<tr>");
    	html.append("				<th><strong>ITEM NAME</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>ITEM PRICE</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>ITEM QUANTITY</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>ITEM TOTAL</strong></th>");
    	html.append("			</tr>");
    	html.append("		</thead>");
    	html.append("		<tbody>");
    	
		for(int i=0; i<itemsArr.length(); i++) {
		    JSONObject jsonObject = itemsArr.getJSONObject(i);
		    String agent = jsonObject.getString("Agent");
		    int qty = jsonObject.getInt("Qty");
		    double price = jsonObject.getDouble("Price");
		    double amount = jsonObject.getDouble("Amount");
		    String itemCode = jsonObject.getString("Item code");
		    String description = jsonObject.getString("Description");
		    
	    	html.append("			<tr>");
	    	html.append("				<td>" + description + "</td>");
	    	html.append("				<td class=\"text-center\">" + price + "</td>");
	    	html.append("				<td class=\"text-center\">" + qty + "</td>");
	    	html.append("				<td class=\"text-right\">" + amount + "</td>");
	    	html.append("			</tr>");
		}
		
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF; text-align: right\"><strong>SUB-TOTAL</strong></td>");
    	html.append("				<td class=\"highrow text-right\">" + totalAmt + "</td>");
    	html.append("			</tr>");
    	html.append("			<tr>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF; text-align: right\"><strong>ADDITIONAL FEES</strong></td>");
    	html.append("				<td class=\"emptyrow text-right\">0</td>");
    	html.append("			</tr>");
    	html.append("			<tr>");
    	html.append("				<td style=\"background-color: #FFFFFF\"><i class=\"fa fa-barcode iconbig\"></i></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF; text-align: right\"><strong>TOTAL</strong></td>");
    	html.append("				<td class=\"emptyrow text-right\">" + totalAmt + "</td>");
    	html.append("			</tr>");
    	html.append("		</tbody>");
    	html.append("		</table>");
    	html.append(" ");
    	html.append("        <label id=\"some-text\">*Received the above merchandise in good order and condition.</label>");
    	html.append("");
    	html.append("        <p>");
    	html.append("            <label>No.</label>");
    	html.append("            <label> <u>" + refNo + "</u></label>");
    	html.append("        </p>");
    	html.append("		<br></br>");
    	html.append("		");
    	html.append("        <p class=\"signature\">");
    	html.append("            <label>By: </label> ____________________________________");
    	html.append("            <br></br>");
    	html.append("            <label>Printed name over signature</label>");
    	html.append("        </p>");
    	html.append("</body>");
    	html.append("</html>");
    	
    	StringBuilder css = new StringBuilder();
    	css.append("body {");
    	css.append("    font-family: Arial, Helvetica, sans-serif;");
    	css.append("    padding: 10px 20px 50px 20px;");
    	css.append("    width: 1000px;");
    	css.append("    border: 1px solid #333;");
    	css.append("    font-size: 12px;");
    	css.append("}");
    	css.append("#haphieng-details {");
    	css.append("    text-align: center;");
    	css.append("}");
    	css.append("h1 {");
    	css.append("    text-transform: uppercase;");
    	css.append("    font-weight: bold;");
    	css.append("    color: #000000;");
    	css.append("	font-size: 20px;");
    	css.append("}");
    	css.append("h2 {");
    	css.append("    text-transform: uppercase;");
    	css.append("    font-weight: bold;");
    	css.append("    color: #000000;");
    	css.append("	font-size: 15px;");
    	css.append("}");
    	css.append("p {");
    	css.append("    font-size: 12px;");
    	css.append("} ");
    	css.append("table {");
    	css.append("	width:100%;");
    	css.append("    margin-bottom: 0.4pt;");
    	css.append("    margin-top: 5;");
    	css.append("    margin-left: 5;");
    	css.append("    margin-right: 5;");
    	css.append("    text-indent: 5;");
    	css.append("	font-size: 12px;");
    	css.append("}");
    	css.append("tr {");
    	css.append("    vertical-align: inherit;");
    	css.append("}");
    	css.append("table > tr {");
    	css.append("    vertical-align: middle;");
    	css.append("}");
    	css.append("td {");
    	css.append("	background-color:#F7F7F7;");
    	css.append("	font-size:10px;");
    	css.append("    padding: 1px;");
    	css.append("    text-align: inherit;");
    	css.append("    vertical-align: inherit;");
    	css.append("    padding-top: 5px;");
    	css.append("    padding-right: 5px;");
    	css.append("    padding-bottom: 5px;");
    	css.append("    padding-left: 5px;");
    	css.append("}");
    	css.append("td.header {");
    	css.append("	background-color:#FFFFFF;");
    	css.append("	font-size:10px;");
    	css.append("    padding: 1px;");
    	css.append("    text-align: inherit;");
    	css.append("    vertical-align: inherit;");
    	css.append("    padding-top: 5px;");
    	css.append("    padding-right: 5px;");
    	css.append("    padding-bottom: 5px;");
    	css.append("    padding-left: 5px;");
    	css.append("}");
    	css.append("th {");
    	css.append("	background-color: #000000;");
    	css.append("	font-size:12px;");
    	css.append("	text-align: left;");
    	css.append("	color:#FFFFFF;");
    	css.append("    display: table-cell;");
    	css.append("    font-weight: bold;");
    	css.append("    padding: 1px;");
    	css.append("    vertical-align: inherit;");
    	css.append("    padding-top: 5px;");
    	css.append("    padding-right: 5px;");
    	css.append("    padding-bottom: 5px;");
    	css.append("    padding-left: 5px;");
    	css.append("}");
    	css.append(".signature {");
    	css.append("    float: right;");
    	css.append("    clear: both;");
    	css.append("    padding-bottom: 50px;");
    	css.append("    text-align: center;");
    	css.append("}");
    	
    	String[] htmlcss = new String[2];
    	htmlcss[0] = html.toString();
    	htmlcss[1] = css.toString();
    	return htmlcss;
    }
    
    @WebServlet("/GetStandardReceipt")
    public static class ReportServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        public ReportServlet() {
            super();
        }
        
        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {

        final ServletContext servletContext = request.getSession()
                .getServletContext();
        final File tempDirectory = (File) servletContext
                .getAttribute("javax.servlet.context.tempdir");
        final String temperotyFilePath = tempDirectory.getAbsolutePath();
        
        String details = request.getParameter("details");
        String items = request.getParameter("items");
        String[] htmlcss = null;
		try {
			htmlcss = generateReceipt(details, items);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        String fileName = "STANDARD_RECEIPT_"+System.currentTimeMillis()+".pdf";
        response.setContentType("application/pdf");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "max-age=0");
        response.setHeader("Content-disposition", "attachment; " +
                "filename="+ fileName);

        try {
        	// GENERATE PDF
            createPdf(temperotyFilePath+"\\"+fileName, htmlcss);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            baos = convertPDFToByteArrayOutputStream(
                    temperotyFilePath+"\\"+fileName);
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        }

        protected void doPost(HttpServletRequest request,HttpServletResponse 
                response) throws ServletException, IOException {        
        }

        private static ByteArrayOutputStream 
            convertPDFToByteArrayOutputStream(String fileName) {

            InputStream inputStream = null;
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            try {

                inputStream = new FileInputStream(fileName);

                byte[] buffer = new byte[1024];
                baos = new ByteArrayOutputStream();

                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    baos.write(buffer, 0, bytesRead);
                }

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            return baos;
        }
    }
}