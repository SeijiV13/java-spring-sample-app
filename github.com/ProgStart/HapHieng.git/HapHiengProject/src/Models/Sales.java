package Models;

import java.util.Date;

public class Sales {
   String sr_no = null;
   String reference_no = null;
   String date = null;
   String customer_code = null;
   String terms = null;
   String po = null;
   double amount = 0;
   double balance = 0;
   String ctr_ref = null;
   
   
public String getSr_no() {
	return sr_no;
}
public void setSr_no(String sr_no) {
	this.sr_no = sr_no;
}
public String getReference_no() {
	return reference_no;
}
public void setReference_no(String reference_no) {
	this.reference_no = reference_no;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getCustomer_code() {
	return customer_code;
}
public void setCustomer_code(String customer_code) {
	this.customer_code = customer_code;
}
public String getTerms() {
	return terms;
}
public void setTerms(String terms) {
	this.terms = terms;
}
public String getPo() {
	return po;
}
public void setPo(String po) {
	this.po = po;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public double getBalance() {
	return balance;
}
public void setBalance(double balance) {
	this.balance = balance;
}
public String getCtr_ref() {
	return ctr_ref;
}
public void setCtr_ref(String ctr_ref) {
	this.ctr_ref = ctr_ref;
}
   
   
		 
}
