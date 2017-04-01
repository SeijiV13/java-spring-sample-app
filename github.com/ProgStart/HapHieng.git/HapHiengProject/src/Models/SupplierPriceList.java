package Models;

import java.util.Date;

public class SupplierPriceList {
	
	String item_code = null;
	String supplier_code = null;
	double cost = 0;
	Date new_date = null;
	double new_cost = 0;
	
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getSupplier_code() {
		return supplier_code;
	}
	public void setSupplier_code(String supplier_code) {
		this.supplier_code = supplier_code;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	
	public Date getNew_date() {
		return new_date;
	}
	public void setNew_date(Date new_date) {
		this.new_date = new_date;
	}
	public double getNew_cost() {
		return new_cost;
	}
	public void setNew_cost(double new_cost) {
		this.new_cost = new_cost;
	}
	
	

}
