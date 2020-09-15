package com.jocata.boot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jocata.boot.entity.Product;
import com.jocata.boot.repository.ProductRepository;
import com.jocata.boot.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepo;
	
	@Override
	public Product saveProduct(Product product) {
		return productRepo.save(product);
	}

	@Override
	public Product getProductById(Long productId) {
		return productRepo.findByProductId(productId);
	}

	@Override
	public List<Product> getProductsByUserId(Long userId) {
		return productRepo.findByUserId(userId);
	}

	@Override
	public List<Product> getProductsByUserName(String userName) {
		return productRepo.findByUserUserName(userName);
	}

}
