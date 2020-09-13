package com.jocata.boot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jocata.boot.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

}
