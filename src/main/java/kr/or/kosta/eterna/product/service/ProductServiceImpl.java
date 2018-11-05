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
	
	@Override
	public List<Product> listAll() throws Exception {
		return productDao.listAll();
	}
	
}
