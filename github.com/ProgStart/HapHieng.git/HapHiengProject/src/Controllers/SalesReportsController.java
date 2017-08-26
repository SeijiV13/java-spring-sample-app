package Controllers;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import Implem.PDFImplem;
import Models.InOutTransaction;
import Models.SalesReport;

@Controller
public class SalesReportsController {
	@Autowired
	static PDFImplem pdfImplem;
	
    @Autowired
    public SalesReportsController(PDFImplem pdfImplem) {
    	SalesReportsController.pdfImplem = pdfImplem;
    }
	
	@RequestMapping(value="/SalesReports", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		
		
		ModelAndView salesReports = new ModelAndView("SalesReports");
		
		return salesReports;
	}

	@RequestMapping(value="/testDailySales")
	@ResponseBody 
    public String postTransaction() throws JSONException {
		JSONObject home = new JSONObject();
	
		ArrayList<SalesReport> obj = pdfImplem.getDailySales("2017-04-22", "2017-04-29");
		System.out.println("============OBJSIZE "+obj.size()+"===============");
		for(int x = 0; x < obj.size(); x++){
			home.append("test"+x, obj.get(0).getReference_no());
		}
		
    	return home.toString();
    }
	
    @WebServlet("/GetDailySales")
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
        
        String filterBy = request.getParameter("filterBy");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        String[] htmlcss = {};
        if(filterBy.equals("netincome")){
        	htmlcss = generateDailySalesbyNet(startDate, endDate);
        } else if(filterBy.equals("customer")){
        	htmlcss = generateDailySalesbyCustomer(startDate, endDate);
        } else if(filterBy.equals("items")){
        	htmlcss = generateDailySalesbyItems(startDate, endDate);
        }  else {
        	htmlcss = generateDailySales(startDate, endDate);
        }

        String fileName = "DAILY_SALES" + "_" + System.currentTimeMillis() +".pdf";
        response.setContentType("application/pdf");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "max-age=0");
        response.setHeader("Content-disposition", "attachment; " +
                "filename="+ fileName);

        try {
        	// GENERATE PDF
        	new SalesReportsController(pdfImplem);
            pdfImplem.createPdf(temperotyFilePath+"\\"+fileName, htmlcss);
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

        private ByteArrayOutputStream 
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

    private static String[] generateDailySalesbyCustomer(String startDate, String endDate) {
    	ArrayList<SalesReport> sr = pdfImplem.getDailySales(startDate, endDate);
    	
    	StringBuilder html = new StringBuilder();
    	html.append("<html>");
    	html.append("<body>");
    	html.append("        <section id=\"haphieng-details\">");
    	html.append("            <h1>" + "Hap Hieng Marketing Corporation" + "</h1>    ");
    	html.append("            <p>VAT Reg. TIN - 240-610-923-000</p>");
    	html.append("            <p>" + "9 Juliana Street, Potrero, Malabon City - Tels.: 361-3382 / 366-8079" + "</p>");
    	html.append("        </section>");
    	html.append("		<br></br>");
    	html.append("		<br></br>");
    	html.append("        <h2>All Daily Sales by Customer</h2>");
    	html.append("		<p style=\"text-align: right; font-size: 11.5px\">From "+ startDate +" to "+ endDate +"</p>");
    	html.append("		<br></br>");
    	html.append("		<hr></hr>");

    	html.append("		<p></p>");

    	double amountTotal = 0;
    	double balanceTotal = 0;
    	DecimalFormat formatter = new DecimalFormat("#,##0.00");
    	
    	String currentCust = sr.get(0).getCustomer_code();
    	
    	html.append("		<h3>" + currentCust + "</h3>");
    	html.append("		<table style=\"width:100%\">");
    	html.append("		<thead>");
    	html.append("			<tr>");
    	html.append("				<th><strong>DATE</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>REFERENCE NO.</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>CURRENCY</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>AMOUNT</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>BALANCE</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>COUNTER#</strong></th>");
    	html.append("			</tr>");
    	html.append("		</thead>");
    	html.append("		<tbody>");    	
    	
    	for(int x = 0; x < sr.size(); x++){
    		if(currentCust.equals(sr.get(x).getCustomer_code())){
    			SalesReport srObj = sr.get(x);
    			
    			String date = srObj.getDate();
    			String ref_no = srObj.getReference_no();
    			String customer = srObj.getCustomer_code();
    			String currency = srObj.getCurrency();
    			String amount = formatter.format(srObj.getAmount());
    			String balance = formatter.format(srObj.getBalance());
    		    
    	    	html.append("			<tr>");
    	    	html.append("				<td>" + date + "</td>");
    	    	html.append("				<td class=\"text-center\">" + ref_no + "</td>");
    	    	html.append("				<td class=\"text-center\">" + currency + "</td>");
    	    	html.append("				<td class=\"text-right\">" + amount + "</td>");
    	    	html.append("				<td class=\"text-right\">" + balance + "</td>");
    	    	html.append("				<td class=\"text-right\">" + "" + "</td>");
    	    	html.append("			</tr>");
    	    	
    	    	amountTotal += srObj.getAmount();
    	    	balanceTotal += srObj.getBalance();
    		} else {
    	    	html.append("			<tr>");		
    	    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	    	html.append("				<td style=\"background-color: #FFFFFF\">TOTAL AMOUNT</td>");
    	    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(amountTotal) + "</td>");
    	    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(balanceTotal) + "</td>");
    	    	html.append("			</tr>");

    	    	html.append("		</tbody>");
    	    	html.append("		</table>");
    			currentCust = sr.get(x).getCustomer_code();
    			html.append("		<h3>" + currentCust + "</h3>");
    	    	html.append("		<table style=\"width:100%\">");
    	    	html.append("		<thead>");
    	    	html.append("			<tr>");
    	    	html.append("				<th><strong>DATE</strong></th>");
    	    	html.append("				<th class=\"text-center\"><strong>REFERENCE NO.</strong></th>");
    	    	html.append("				<th class=\"text-center\"><strong>CURRENCY</strong></th>");
    	    	html.append("				<th class=\"text-right\"><strong>AMOUNT</strong></th>");
    	    	html.append("				<th class=\"text-right\"><strong>BALANCE</strong></th>");
    	    	html.append("				<th class=\"text-right\"><strong>COUNTER#</strong></th>");
    	    	html.append("			</tr>");
    	    	html.append("		</thead>");
    	    	html.append("		<tbody>");
    	    	
    			SalesReport srObj = sr.get(x);
    			
    			String date = srObj.getDate();
    			String ref_no = srObj.getReference_no();
    			String customer = srObj.getCustomer_code();
    			String currency = srObj.getCurrency();
    			String amount = formatter.format(srObj.getAmount());
    			String balance = formatter.format(srObj.getBalance());
    		    
    	    	html.append("			<tr>");
    	    	html.append("				<td>" + date + "</td>");
    	    	html.append("				<td class=\"text-center\">" + ref_no + "</td>");
    	    	html.append("				<td class=\"text-center\">" + currency + "</td>");
    	    	html.append("				<td class=\"text-right\">" + amount + "</td>");
    	    	html.append("				<td class=\"text-right\">" + balance + "</td>");
    	    	html.append("				<td class=\"text-right\">" + "" + "</td>");
    	    	html.append("			</tr>");
    	    	
    	    	amountTotal = srObj.getAmount();
    	    	balanceTotal = srObj.getBalance();
    		}
    		
    	}
    			
    	html.append("			<tr>");		
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">TOTAL AMOUNT</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(amountTotal) + "</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(balanceTotal) + "</td>");
    	html.append("			</tr>");

    	html.append("		</tbody>");
    	html.append("		</table>");
	
    	html.append("</body>");
    	html.append("</html>");
    	
    	System.out.println(html.toString());
    	
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
    	css.append("h3 {");
    	css.append("    font-weight: bold;");
    	css.append("    color: #0000FF;");
    	css.append("	font-size: 13px;");
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
    
    private static String[] generateDailySales(String startDate, String endDate) {
    	ArrayList<SalesReport> sr = pdfImplem.getDailySales(startDate, endDate);
    	
    	StringBuilder html = new StringBuilder();
    	html.append("<html>");
    	html.append("<body>");
    	html.append("        <section id=\"haphieng-details\">");
    	html.append("            <h1>" + "Hap Hieng Marketing Corporation" + "</h1>    ");
    	html.append("            <p>VAT Reg. TIN - 240-610-923-000</p>");
    	html.append("            <p>" + "9 Juliana Street, Potrero, Malabon City - Tels.: 361-3382 / 366-8079" + "</p>");
    	html.append("        </section>");
    	html.append("		<br></br>");
    	html.append("		<br></br>");
    	html.append("        <h2>All Daily Sales</h2>");
    	html.append("		<p style=\"text-align: right; font-size: 11.5px\">From "+ startDate +" to "+ endDate +"</p>");
    	html.append("		<br></br>");
    	html.append("		<hr></hr>");

    	html.append("		<p></p>");

    	html.append("		<table style=\"width:100%\">");
    	html.append("		<thead>");
    	html.append("			<tr>");
    	html.append("				<th><strong>DATE</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>REFERENCE NO.</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>CUSTOMER</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>CURRENCY</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>AMOUNT</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>BALANCE</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>COUNTER#</strong></th>");
    	html.append("			</tr>");
    	html.append("		</thead>");
    	html.append("		<tbody>");
    	
    	double amountTotal = 0;
    	double balanceTotal = 0;
    	DecimalFormat formatter = new DecimalFormat("#,##0.00");
		for(int i=0; i<sr.size(); i++) {
			SalesReport srObj = sr.get(i);
			
			String date = srObj.getDate();
			String ref_no = srObj.getReference_no();
			String customer = srObj.getCustomer_code();
			String currency = srObj.getCurrency();
			String amount = formatter.format(srObj.getAmount());
			String balance = formatter.format(srObj.getBalance());
		    
	    	html.append("			<tr>");
	    	html.append("				<td>" + date + "</td>");
	    	html.append("				<td class=\"text-center\">" + ref_no + "</td>");
	    	html.append("				<td class=\"text-center\">" + customer + "</td>");
	    	html.append("				<td class=\"text-center\">" + currency + "</td>");
	    	html.append("				<td class=\"text-right\">" + amount + "</td>");
	    	html.append("				<td class=\"text-right\">" + balance + "</td>");
	    	html.append("				<td class=\"text-right\">" + "" + "</td>");
	    	html.append("			</tr>");
	    	
	    	amountTotal += srObj.getAmount();
	    	balanceTotal += srObj.getBalance();
		}
		
    	html.append("			<tr>");		
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">TOTAL AMOUNT</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(amountTotal) + "</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(balanceTotal) + "</td>");

    	html.append("			</tr>");

    	html.append("		</tbody>");
    	html.append("		</table>");
	
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

    private static String[] generateDailySalesbyNet(String startDate, String endDate) {
    	ArrayList<SalesReport> sr = pdfImplem.getDailySales(startDate, endDate);
    	
    	StringBuilder html = new StringBuilder();
    	html.append("<html>");
    	html.append("<body>");
    	html.append("        <section id=\"haphieng-details\">");
    	html.append("            <h1>" + "Hap Hieng Marketing Corporation" + "</h1>    ");
    	html.append("            <p>VAT Reg. TIN - 240-610-923-000</p>");
    	html.append("            <p>" + "9 Juliana Street, Potrero, Malabon City - Tels.: 361-3382 / 366-8079" + "</p>");
    	html.append("        </section>");
    	html.append("		<br></br>");
    	html.append("		<br></br>");
    	html.append("        <h2>All Daily Sales with Net Income</h2>");
    	html.append("		<p style=\"text-align: right; font-size: 11.5px\">From "+ startDate +" to "+ endDate +"</p>");
    	html.append("		<br></br>");
    	html.append("		<hr></hr>");

    	html.append("		<p></p>");

    	html.append("		<table style=\"width:100%\">");
    	html.append("		<thead>");
    	html.append("			<tr>");
    	html.append("				<th><strong>DATE</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>REFERENCE NO.</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>CUSTOMER</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>CURRENCY</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>AMOUNT</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>BALANCE</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>COUNTER#</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>NET INCOME</strong></th>");
    	html.append("			</tr>");
    	html.append("		</thead>");
    	html.append("		<tbody>");
    	
    	double amountTotal = 0;
    	double balanceTotal = 0;
    	double netTotal = 0;
    	DecimalFormat formatter = new DecimalFormat("#,##0.00");
		for(int i=0; i<sr.size(); i++) {
			SalesReport srObj = sr.get(i);
			
			String date = srObj.getDate();
			String ref_no = srObj.getReference_no();
			String customer = srObj.getCustomer_code();
			String currency = srObj.getCurrency();
			String amount = formatter.format(srObj.getAmount());
			String balance = formatter.format(srObj.getBalance());
			String net_income = formatter.format(srObj.getNet_income());
		    
	    	html.append("			<tr>");
	    	html.append("				<td>" + date + "</td>");
	    	html.append("				<td class=\"text-center\">" + ref_no + "</td>");
	    	html.append("				<td class=\"text-center\">" + customer + "</td>");
	    	html.append("				<td class=\"text-center\">" + currency + "</td>");
	    	html.append("				<td class=\"text-right\">" + amount + "</td>");
	    	html.append("				<td class=\"text-right\">" + balance + "</td>");
	    	html.append("				<td class=\"text-right\">" + "" + "</td>");
	    	html.append("				<td class=\"text-right\">" + net_income + "</td>");
	    	html.append("			</tr>");
	    	
	    	amountTotal += srObj.getAmount();
	    	balanceTotal += srObj.getBalance();
	    	netTotal += srObj.getNet_income();
		}
		
    	html.append("			<tr>");		
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">TOTAL AMOUNT</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(amountTotal) + "</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(balanceTotal) + "</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(netTotal) + "</td>");
    	
    	html.append("			</tr>");

    	html.append("		</tbody>");
    	html.append("		</table>");
	
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
    
    private static String[] generateDailySalesbyItems(String startDate, String endDate) {
    	ArrayList<InOutTransaction> sr = pdfImplem.getDailySaleItems(startDate, endDate);
    	
    	StringBuilder html = new StringBuilder();
    	html.append("<html>");
    	html.append("<body>");
    	html.append("        <section id=\"haphieng-details\">");
    	html.append("            <h1>" + "Hap Hieng Marketing Corporation" + "</h1>    ");
    	html.append("            <p>VAT Reg. TIN - 240-610-923-000</p>");
    	html.append("            <p>" + "9 Juliana Street, Potrero, Malabon City - Tels.: 361-3382 / 366-8079" + "</p>");
    	html.append("        </section>");
    	html.append("		<br></br>");
    	html.append("		<br></br>");
    	html.append("        <h2>All Daily Sales with Items</h2>");
    	html.append("		<p style=\"text-align: right; font-size: 11.5px\">From "+ startDate +" to "+ endDate +"</p>");
    	html.append("		<br></br>");
    	html.append("		<hr></hr>");

    	html.append("		<p></p>");

    	html.append("		<table style=\"width:100%\">");
    	html.append("		<thead>");
    	html.append("			<tr>");
    	html.append("				<th><strong>DATE</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>REFERENCE NO.</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>CUSTOMER</strong></th>");
    	html.append("				<th class=\"text-center\"><strong>ITEM CODE</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>QUANTITY</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>PRICE</strong></th>");
    	html.append("				<th class=\"text-right\"><strong>AMOUNT#</strong></th>");
    	html.append("			</tr>");
    	html.append("		</thead>");
    	html.append("		<tbody>");
    	
    	double amountTotal = 0;
    	DecimalFormat formatter = new DecimalFormat("#,##0.00");
		for(int i=0; i<sr.size(); i++) {
			InOutTransaction srObj = sr.get(i);
			
			String date = srObj.getDate();
			String ref_no = srObj.getReference_no();
			String customer = srObj.getClient();
			String item_code = srObj.getItem_code();
			int quantity = srObj.getQuantity_out();
			String price = formatter.format(srObj.getPrice());
			String amount = formatter.format(quantity*Double.parseDouble(price));
		    
	    	html.append("			<tr>");
	    	html.append("				<td>" + date + "</td>");
	    	html.append("				<td class=\"text-center\">" + ref_no + "</td>");
	    	html.append("				<td class=\"text-center\">" + customer + "</td>");
	    	html.append("				<td class=\"text-center\">" + item_code + "</td>");
	    	html.append("				<td class=\"text-right\">" + quantity + "</td>");
	    	html.append("				<td class=\"text-right\">" + price + "</td>");
	    	html.append("				<td class=\"text-right\">" + amount + "</td>");
	    	html.append("			</tr>");
	    	
	    	amountTotal += Double.parseDouble(amount);
		}
		
    	html.append("			<tr>");		
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">TOTAL AMOUNT</td>");
    	html.append("				<td style=\"background-color: #FFFFFF\"></td>");
    	html.append("				<td style=\"background-color: #FFFFFF\">" + formatter.format(amountTotal) + "</td>");
 	
    	html.append("			</tr>");

    	html.append("		</tbody>");
    	html.append("		</table>");
	
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
}
