package Mappers;

import java.util.ArrayList;

import Models.Purchases;
import Models.Supplier;
import Models.SupplierPriceList;

public interface SupplierMapper {
   
	public ArrayList<Supplier> getAllSuppliers();
	public ArrayList<Supplier> getFilteredSuppliers(String supplier_code, String description);
	public void editSupplierDetails(String supplier_code, String description, String address, String address2, String telephone, String fax, String email, String terms, String initial_balance, String remaining);
	public ArrayList<Purchases> getAllSupplierPurchases();
	public ArrayList<Purchases> getFilteredSupplierPurchases(String supplier_code, String reference_no);
	public ArrayList<Purchases> getAllSupplierPurchasesReturns();
	public ArrayList<Purchases> getFilteredSupplierPurchasesReturns(String supplier_code, String reference_no);
	public ArrayList<SupplierPriceList> getSupplierPriceList();
	public void addNewSupplier(String supplier_code, String description, String address, String address2, String telephone, String fax, String email, String terms, String initial_balance, String remaining);
}
