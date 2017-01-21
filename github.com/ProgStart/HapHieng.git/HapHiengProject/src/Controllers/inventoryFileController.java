package Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class inventoryFileController {
	
	@RequestMapping(value = "/InventoryFile", method = RequestMethod.GET)
	public String formBackingObject(){
		
		
		return "InventoryFile";
	}

}
