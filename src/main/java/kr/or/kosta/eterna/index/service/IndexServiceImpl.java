package kr.or.kosta.eterna.index.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.product.domain.Product;

public class IndexServiceImpl implements IndexService {

	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public List<Product> brandNewList(String categoryId) throws Exception {
		List<Product> list = productDao.brandNewList(categoryId);
		return list;
	}

	@Override
	public List<Product> popularProductList() throws Exception {
		List<Product> list = productDao.popularProductList();
		return list;
	}
	
	@Override
	public List<Product> popularProductListByRcmd(String categoryId) throws Exception {
		List<Product> list = productDao.popularProductListByRcmd(categoryId);
		return list;
	}


}
