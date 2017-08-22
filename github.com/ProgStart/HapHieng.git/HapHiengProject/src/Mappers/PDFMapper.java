package Mappers;

import java.util.ArrayList;

import Models.SalesReport;

public interface PDFMapper {
	public ArrayList<SalesReport> getDailySales(String startDate, String endDate);
}
