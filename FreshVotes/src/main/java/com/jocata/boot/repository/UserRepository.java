package com.jocata.boot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jocata.boot.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	public User findByUserName(String userName);
	@Query("from User where id =?1")
	public User findByUserId(@Param("id") Long id);
	public User findByEmailAddress(String emailAddress);
}
