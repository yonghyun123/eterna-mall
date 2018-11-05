package kr.or.kosta.eterna.product.service;

import java.util.List;

import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.product.domain.Product;

public class ProductServiceImpl implements ProductService{

	private ProductDao productDao;
	
	public ProductDao getProductDao(){
		return productDao;
	}
	
	public void setProductDao(ProductDao productDao){
		this.productDao = productDao;
	}
	
	/* 전체 상품 검색 */
	@Override
	public List<Product> listAll() throws Exception {
		return productDao.listAll();
	}

	/* 해당 상품 검색 */
	@Override
	public Product read(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDao.read(productId);
	}
	
}
