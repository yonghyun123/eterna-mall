package kr.or.kosta.eterna.productImage.service;

import java.util.List;

import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.productImage.domain.ProductImage;

public interface ProductImageService {

	public List<ProductImage> imageAll(String productId) throws Exception;
}
