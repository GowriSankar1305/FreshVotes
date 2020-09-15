package com.jocata.boot.service;

import com.jocata.boot.entity.User;

public interface UserService {
	public User saveUser(User user);
	public User getUserById(Long id);
	public boolean isUserExists(String emailId);
	public boolean isUserExistsByUname(String uname);
	public User getUserByUserName(String userName);
}
