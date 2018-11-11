package kr.or.kosta.eterna.index.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.product.domain.Product;

public interface IndexService {
    /**신상품 리스트*/
    public List<Product> brandNewList(String categoryId) throws Exception;
    /**인기상품 리스트*/
    public List<Product> popularProductList() throws Exception;
	
}
