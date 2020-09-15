package com.jocata.boot.service;

import java.util.List;

import com.jocata.boot.entity.Product;

public interface ProductService {
	public Product saveProduct(Product product);
	public Product getProductById(Long productId);
	public List<Product> getProductsByUserId(Long userId);
	public List<Product> getProductsByUserName(String userName);
}
