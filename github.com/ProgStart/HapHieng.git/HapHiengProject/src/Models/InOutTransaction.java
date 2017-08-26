package Models;

public class InOutTransaction {
    String item_code = null;
    String date = null;
    String reference_no = null;
    String client = null;
    double price = 0;
    String currency = null;
    int quantity_in = 0;
    int quantity_out = 0;
    int quantity_adjustment = 0;
    double balance = 0;
    String agent = null;
    String good = null;
    public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	String warehouse = null;
    
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getReference_no() {
		return reference_no;
	}
	public void setReference_no(String reference_no) {
		this.reference_no = reference_no;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public int getQuantity_in() {
		return quantity_in;
	}
	public void setQuantity_in(int quantity_in) {
		this.quantity_in = quantity_in;
	}
	public int getQuantity_out() {
		return quantity_out;
	}
	public void setQuantity_out(int quantity_out) {
		this.quantity_out = quantity_out;
	}
	public int getQuantity_adjustment() {
		return quantity_adjustment;
	}
	public void setQuantity_adjustment(int quantity_adjustment) {
		this.quantity_adjustment = quantity_adjustment;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
    
    
    
    
}
