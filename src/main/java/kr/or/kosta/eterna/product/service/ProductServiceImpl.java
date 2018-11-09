package kr.or.kosta.eterna.product.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.product.domain.Product;

public class ProductServiceImpl implements ProductService {

	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
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

	@Override
	public int countPerSex(String sex) throws Exception {
		return productDao.countPerSex(sex);
	}

	@Override
	public int countPerAge(String age) throws Exception {
		return productDao.countPerAge(age);
	}

	@Override
	public List<Product> listBySex(String productSex) throws Exception {
		return productDao.listBySex(productSex);
	}

	@Override
	public int countAll() throws Exception {
		return productDao.countAll();
	}

	@Override
	public List<Product> listByConditions(Map<String, Object> map) throws Exception {
		return productDao.listByConditions(map);
	}

	@Override
	public int countByConditions(Map<String, Object> map) throws Exception {
		return productDao.countByConditions(map);
	}

	@Override
	public boolean duplicateCheck(String product) throws Exception {
		return productDao.duplicateCheck(product);
	}
}
