package Models;

import java.util.Date;

public class Purchases {
	String reference_no = null;
	Date date = null;
	String supplier_code = null;
	String terms = null;
	double amount = 0;
	
	
	public String getReference_no() {
		return reference_no;
	}
	public void setReference_no(String reference_no) {
		this.reference_no = reference_no;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public String getSupplier_code() {
		return supplier_code;
	}
	public void setSupplier_code(String supplier_code) {
		this.supplier_code = supplier_code;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	

}
