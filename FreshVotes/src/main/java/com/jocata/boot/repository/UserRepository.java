package com.jocata.boot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jocata.boot.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	public User findByUserName(String userName);
}
