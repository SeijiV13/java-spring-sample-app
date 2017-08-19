package Controllers;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
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
		createPdf(DEST);

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
	
    public void createPdf(String file) throws IOException, DocumentException {
    	String STYLE = "body { text-align: center; }";
    	String sb = "<html><body><b>TEST</b></body></html>";
        // step 1
        Document document = new Document(PageSize.LETTER);
        // step 2
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));
        // step 3
        document.open();
        // step 4 
        CSSResolver cssResolver = new StyleAttrCSSResolver();
        //CssFile cssFile = XMLWorkerHelper.getCSS(new ByteArrayInputStream(CSS.getBytes()));
        CssFile cssFile = XMLWorkerHelper.getCSS(new FileInputStream(STYLE));
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
        p.parse(new ByteArrayInputStream(sb.toString().getBytes()));
        //p.parse(new FileInputStream(HTML),Charset.forName("cp1252"));
 
        // step 5
        document.close();
    }
}