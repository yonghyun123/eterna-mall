package kr.or.kosta.eterna.productImage.dao;
import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.product.domain.Product;
import kr.or.kosta.eterna.productImage.domain.ProductImage;


/**
 * Product 인터페이스 선언
 * @author 권현우
 *
 */
public interface ProductImageDao {
	/**제품이미지등록*/
	public void regist(ProductImage productImage) throws Exception;
	/**제품이미지수정*/
	public void update(ProductImage productImage) throws Exception;
	/**제품이미지삭제*/
	public void delete(Map<String, Object>map) throws Exception;
	/**이미지전체조회*/
	public List<ProductImage> imageAll(String productId) throws Exception;
}
