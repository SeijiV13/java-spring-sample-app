package Mappers;

import java.util.ArrayList;

import Models.InOutTransaction;
import Models.SalesReport;

public interface PDFMapper {
	public ArrayList<SalesReport> getDailySales(String startDate, String endDate);
	public ArrayList<InOutTransaction> getDailySaleItems(String startDate, String endDate);
}
