package Implem;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import Mappers.UserMapper;
import Models.User;

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
  
     public ArrayList<String> retrieveAllUsers(){ 
    	 
         ArrayList<String> users = userMapper.retrieveAllUsers();
         return users;
     }
     
     public void modifyEntriesofUser(String user, int se_active, int sre_active, int pe_active, int pre_active,  int iqae_active, int ide_active, int gscr_active, int cfce_active, int ptse_active ){
    	 userMapper.modifyEntriesofUser(user, se_active, sre_active, pe_active, pre_active, iqae_active, ide_active, gscr_active, cfce_active, ptse_active);
     }
     
     public void modifyFilesofUser(String user, int if_active, int cf_active, int sf_active, int af_active, int cbf_active){
    	 userMapper.modifyFilesofUser(user, if_active, cf_active, sf_active, af_active, cbf_active);
     }
   
     public void modifyReportsofUser(String user, int sr_active, int srr_active, int pr_active, int prr_active, int iiot_active, int cl_active, int sl_active, int al_active){
    	 userMapper.modifyReportsofUser(user, sr_active, srr_active, pr_active, prr_active, iiot_active, cl_active, sl_active, al_active);
    
     }
     public void modifyProductListofUser(String user, int pli_active, int pll_active, int ei_active, int el_active, int enp_active, int i_active, int lpbc_active, int dis_active, int qai_active){
        userMapper.modifyProductListofUser(user, pli_active, pll_active, ei_active, el_active, enp_active, i_active, lpbc_active, dis_active, qai_active);
     } 
     
     
     
     public User retrieveUserEntriesAccess(String user){
    	 User retrievedUser = userMapper.retrieveUserEntriesAccess(user);
    	 
    	 return retrievedUser;
     }
     
     public User retrieveUserFilesAccess(String user){
    	 User retrievedUser = userMapper.retrieveUserFilesAccess(user);
    	 return retrievedUser;
     }
     
     public User retrieveUserReportsAccess(String user){
    	 User retrievedUser = userMapper.retrieveUserReportsAccess(user);
    	 return retrievedUser;
     }
     
     public User retrieveUserProductListAccess(String user){
    	 User retrievedUser = userMapper.retrieveUserProductListAccess(user);
    	 return retrievedUser;
     }
     
     public User retrieveUserToolsAccess(String user){
    	 User retrievedUser = userMapper.retrieveUserToolsAccess(user);
    	 return retrievedUser;
     }
     
     
}
