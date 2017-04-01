package Implem;

import java.util.ArrayList;

import Models.Purchases;
import Models.Supplier;
import Models.SupplierPriceList;

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
	
	public void editSupplierDetails(String supplier_code, String description, String address, String address2, String telephone, String fax, String email, String terms, String initial_balance, String remaining){
		supplierMapper.editSupplierDetails(supplier_code, description, address, address2, telephone, fax, email, terms, initial_balance, remaining);
	}
	
	public ArrayList<Purchases> getAllSupplierPurchases(){
		return supplierMapper.getAllSupplierPurchases();
	}
	
	public ArrayList<Purchases> getFilteredSupplierPurchases(String supplier_code, String reference_no){
		return supplierMapper.getFilteredSupplierPurchases("%"+supplier_code+"%", "%"+reference_no+"%");
	}
	
	public ArrayList<Purchases> getAllSupplierPurchasesReturns(){
		return supplierMapper.getAllSupplierPurchasesReturns();
	}
	
	public ArrayList<Purchases> getFilteredSupplierPurchasesReturns(String supplier_code, String reference_no){
		return supplierMapper.getFilteredSupplierPurchasesReturns("%"+supplier_code+"%", "%"+reference_no+"%");
	}
	
	public ArrayList<SupplierPriceList> getSupplierPriceList(){
		return supplierMapper.getSupplierPriceList();
	}
   public void addNewSupplier(String supplier_code, String description, String address, String address2, String telephone, String fax, String email, String terms, String initial_balance, String remaining){
	   supplierMapper.addNewSupplier(supplier_code, description, address, address2, telephone, fax, email, terms, initial_balance, remaining);
   }
	
}
