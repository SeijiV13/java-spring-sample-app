package Implem;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import Mappers.UserMapper;

public class UserImplem {

	private UserMapper userMapper;
	
     public void setUserMapper(UserMapper userMapper){
    	 this.userMapper = userMapper;
     }
     
     //Added By SAV 2016/11/26
     public void changePassword(String password, String user){
    	 //ENCRYPT NEW PASSWORD
    	 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	 userMapper.changePassword(passwordEncoder.encode(password), user);
     }
     
     public boolean checkPasswordValidity(String username, String oldpassword){
    	 
    	 //PASSWORD HASHING
    	 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	 //GET CURRENT PASSWORD FOR VALIDATION
    	 String queriedOldPassword = userMapper.checkOldPasswordValidity(username);	    
    	 //CHECK IF MATCH
    	 boolean match = passwordEncoder.matches(oldpassword, queriedOldPassword);
  
    	 return match;
     }
}
