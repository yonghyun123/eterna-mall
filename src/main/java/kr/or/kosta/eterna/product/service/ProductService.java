package kr.or.kosta.eterna.product.service;

import java.util.List;

import kr.or.kosta.eterna.product.domain.Product;

public interface ProductService {
	/* 전체 상품 검색 */
	public List<Product> listAll() throws Exception;
	/* 해당 상품 검색 */
	public Product read(String productId) throws Exception;
}
