package com.jocata.boot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jocata.boot.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long>{
	@Query("from Product where id=?1")
	public Product findByProductId(@Param("id") Long id);
	public List<Product> findByUserId(Long userId);
	public List<Product> findByUserUserName(String userName);
}
