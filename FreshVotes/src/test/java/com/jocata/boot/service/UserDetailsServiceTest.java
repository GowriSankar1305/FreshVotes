package com.jocata.boot.service;

import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class UserDetailsServiceTest {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceTest.class);
	
	@Test
	public void generateEncryptedPassword()	{
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String rawPassword = "123";
		String encryptedPwd = passEncoder.encode(rawPassword);
		logger.info("::encryptedPwd--> {}",encryptedPwd);
		assertThat(rawPassword,not(encryptedPwd));
	}
}
