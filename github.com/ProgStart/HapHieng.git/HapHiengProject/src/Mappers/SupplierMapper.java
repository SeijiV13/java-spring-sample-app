package Mappers;

import java.util.ArrayList;
import Models.Supplier;

public interface SupplierMapper {
   
	public ArrayList<Supplier> getAllSuppliers();
	public ArrayList<Supplier> getFilteredSuppliers(String supplier_code, String description);
	public void editSupplierDetails(String supplier_code, String description, String address, String address2, String telephone, String fax, String email, String terms, String initial_balance, String remaining);
}
