package Implem;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

public class PDFImplem extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, Document document, PdfWriter writer, HttpServletRequest arg3,
			HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		
		Paragraph header = new Paragraph(new Chunk("Generate Pdf USing Spring Mvc",FontFactory.getFont(FontFactory.HELVETICA, 30)));
		
	    document.add(header);
		
	}

}
