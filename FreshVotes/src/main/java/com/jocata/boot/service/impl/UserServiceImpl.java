package com.jocata.boot.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jocata.boot.entity.User;
import com.jocata.boot.repository.RoleRepository;
import com.jocata.boot.repository.UserRepository;
import com.jocata.boot.service.UserService;
import com.jocata.boot.utils.Roles;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private RoleRepository roleRepo;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Override
	public User saveUser(User user) {
		user.setIsEnabled(true);
		user.setRole(roleRepo.findByRoleName(Roles.ROLE_PREFIX+Roles.USER));
		user.setPassword(passEncoder.encode(user.getPassword()));
		return userRepo.save(user);
	}

	@Override
	public User getUserById(Long id) {
		return userRepo.findByUserId(id);
	}

	@Override
	public boolean isUserExists(String emailId) {
		User user = userRepo.findByEmailAddress(emailId);
		logger.info("::isUserExists--->> {}",user);
		return (user != null) ? true : false;
	}

	@Override
	public boolean isUserExistsByUname(String uname) {
		return userRepo.findByUserName(uname) != null ? true : false;
	}

	@Override
	public User getUserByUserName(String userName) {
		return userRepo.findByUserName(userName);
	}
}
