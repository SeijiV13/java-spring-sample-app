package Models;

public class Product {
    String item_code = null;
	String category = null;
	String description = null;
	double  gross_price = 0;
	double net_price = 0;
	int quantity = 0;
	int quantity_on_po = 0;
    String location = null;
    int quantity_pack_big = 0;
    int quantity_pack_small = 0;
    String remarks  = null;
    String image = null;
    String product_line = null;
    
    
    
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getGross_price() {
		return gross_price;
	}
	public void setGross_price(double gross_price) {
		this.gross_price = gross_price;
	}
	public double getNet_price() {
		return net_price;
	}
	public void setNet_price(double net_price) {
		this.net_price = net_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getQuantity_on_po() {
		return quantity_on_po;
	}
	public void setQuantity_on_po(int quantity_on_po) {
		this.quantity_on_po = quantity_on_po;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getQuantity_pack_big() {
		return quantity_pack_big;
	}
	public void setQuantity_pack_big(int quantity_pack_big) {
		this.quantity_pack_big = quantity_pack_big;
	}
	public int getQuantity_pack_small() {
		return quantity_pack_small;
	}
	public void setQuantity_pack_small(int quantity_pack_small) {
		this.quantity_pack_small = quantity_pack_small;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getProduct_line() {
		return product_line;
	}
	public void setProduct_line(String product_line) {
		this.product_line = product_line;
	}
    

	
	
	
}
