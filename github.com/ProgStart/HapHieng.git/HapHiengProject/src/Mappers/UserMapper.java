package Mappers;

import Models.User;

public interface UserMapper {
	
	public void changePassword(String password, String user);
	public String checkOldPasswordValidity(String username);
}
