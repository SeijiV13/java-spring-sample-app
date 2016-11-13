package Mappers;

import Models.User;

public interface UserMapper {
	
	public User loginUser(String email);
    public void signupUser(User user);
	 
}
