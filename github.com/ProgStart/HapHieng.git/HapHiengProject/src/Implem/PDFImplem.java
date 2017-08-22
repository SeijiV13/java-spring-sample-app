package Implem;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

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

import Mappers.PDFMapper;
import Models.Customer;
import Models.SalesReport;

public class PDFImplem {
	private PDFMapper pdfMapper;
	/*@Override
	protected void buildPdfDocument(Map<String, Object> arg0, Document document, PdfWriter writer, HttpServletRequest arg3,
			HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		
		Paragraph header = new Paragraph(new Chunk("Generate Pdf USing Spring Mvc",FontFactory.getFont(FontFactory.HELVETICA, 30)));
		
	    document.add(header);
		
	}*/
	
    public PDFMapper getPdfMapper() {
		return pdfMapper;
	}

	public void setPdfMapper(PDFMapper pdfMapper) {
		this.pdfMapper = pdfMapper;
	}

	public ArrayList<SalesReport> getDailySales(String startDate, String endDate) {
		return pdfMapper.getDailySales(startDate, endDate);
	}
	/* HOW TO CREATE PDF:
	 * 	1st Param: fileName
	 *  2nd Param: component[0] = HTML code, component[1] = CSS code;
	 *  AUTOWIRE this implem and call createPdf(..) method only. (may be casted to static in some cases)
	 */
	public void createPdf(String file, String[] components) throws IOException, DocumentException {
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
}
