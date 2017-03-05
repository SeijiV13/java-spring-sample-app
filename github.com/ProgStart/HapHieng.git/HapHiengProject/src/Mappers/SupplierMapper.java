package Mappers;

import java.util.ArrayList;
import Models.Supplier;

public interface SupplierMapper {
   
	public ArrayList<Supplier> getAllSuppliers();
	public ArrayList<Supplier> getFilteredSuppliers(String supplier_code, String description);
}
