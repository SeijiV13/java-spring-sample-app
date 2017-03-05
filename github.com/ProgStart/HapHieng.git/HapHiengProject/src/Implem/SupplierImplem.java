package Implem;

import java.util.ArrayList;
import Models.Supplier;

import org.springframework.beans.factory.annotation.Autowired;

import Mappers.SupplierMapper;

public class SupplierImplem {
   
	@Autowired
	private SupplierMapper supplierMapper;
	
	public void setSupplierMapper(SupplierMapper supplierMapper){
		this.supplierMapper = supplierMapper;
	}
	
	public ArrayList<Supplier> getAllSuppliers(){
		
		return supplierMapper.getAllSuppliers();
	}
	
	public ArrayList<Supplier> getFilteredSuppliers(String supplier_code, String description){
		return supplierMapper.getFilteredSuppliers("%"+supplier_code+"%", "%"+description+"%");
	}
	
}