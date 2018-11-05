package kr.or.kosta.eterna.product.service;

import java.util.List;

import kr.or.kosta.eterna.product.domain.Product;

public interface ProductService {

	public List<Product> listAll() throws Exception;
}
