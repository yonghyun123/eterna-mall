package kr.or.kosta.eterna.productImage.service;

import java.util.List;

import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.productImage.dao.ProductImageDao;
import kr.or.kosta.eterna.productImage.domain.ProductImage;

public class ProductImageServiceImpl implements ProductImageService {
	private ProductImageDao productImageDao;
	
	public ProductImageDao getProductImageDao(){
		return productImageDao;
	}
	
	public void setProductImageDao(ProductImageDao productImageDao){
		this.productImageDao = productImageDao;
	}
	@Override
	public List<ProductImage> imageAll(String productId) throws Exception {
		return productImageDao.imageAll(productId);
	}

}
