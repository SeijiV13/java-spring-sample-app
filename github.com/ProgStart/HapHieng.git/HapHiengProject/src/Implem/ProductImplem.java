package Implem;

import org.springframework.security.web.PortMapper;

import Mappers.ProductMapper;

public class ProductImplem {
    
	
	private ProductMapper productMapper;
	
	public void setProductMapper(ProductMapper productMapper){
		this.productMapper = productMapper;
	}
}
 