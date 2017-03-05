package Models;

public class Supplier {
   String supplier_code = null;
   String description = null;
   String address = null;
   String address2 = null;
   String telephone = null;
   String fax = null;
   String email = null;
   String terms = null;
   double initial_balance = 0;
   double remaining =  0;
   
   
public double getInitial_balance() {
	return initial_balance;
}
public void setInitial_balance(double initial_balance) {
	this.initial_balance = initial_balance;
}
public double getRemaining() {
	return remaining;
}
public void setRemaining(double remaining) {
	this.remaining = remaining;
}
public String getSupplier_code() {
	return supplier_code;
}
public void setSupplier_code(String suplier_code) {
	this.supplier_code = suplier_code;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}
public String getTelephone() {
	return telephone;
}
public void setTelephone(String telephone) {
	this.telephone = telephone;
}
public String getFax() {
	return fax;
}
public void setFax(String fax) {
	this.fax = fax;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getTerms() {
	return terms;
}
public void setTerms(String terms) {
	this.terms = terms;
}

}
