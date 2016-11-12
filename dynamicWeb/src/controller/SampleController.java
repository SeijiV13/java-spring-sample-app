package controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class SampleController extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		
		String name = request.getParameter("name");
        String age = request.getParameter("age");		
	    System.out.println(name);
	    System.out.print(age); 
	   
	
	}
}
