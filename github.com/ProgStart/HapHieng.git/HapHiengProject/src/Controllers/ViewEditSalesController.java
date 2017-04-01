package Controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import Implem.CustomerImplem;
import Models.Customer;
import Models.Sales;

@Controller
public class ViewEditSalesController {
    @Autowired
    CustomerImplem customerImplem;
	@RequestMapping(value="/ViewEditSales", method = RequestMethod.GET)
	public ModelAndView formBackingObject(HttpServletRequest request){
		HttpSession session = request.getSession();
        ModelAndView viewEditSales = new ModelAndView("ViewEditSales");
        
        ArrayList<Customer> customers = customerImplem.getAllCustomers();
        ArrayList<Sales> sales = customerImplem.getAllCustomerSales();
        session.setAttribute("customers", customers);
        session.setAttribute("sales", sales);
        return viewEditSales;
	} 
	
	@RequestMapping(value="/ViewEditSalesSubmit", method = RequestMethod.POST)
	public String onSearch(HttpServletRequest request){
		HttpSession session = request.getSession();
        String customer_code = request.getParameter("customer");
        String reference_no = request.getParameter("refno");
        
        //filter sales table
        ArrayList<Sales> sales = customerImplem.getFilteredCustomerSales(customer_code, reference_no);
   
        ArrayList<Customer> customers = customerImplem.getAllCustomers();
        session.setAttribute("customers", customers);
        session.setAttribute("sales", sales);
        return "ViewEditSales";
	} 
	
}
