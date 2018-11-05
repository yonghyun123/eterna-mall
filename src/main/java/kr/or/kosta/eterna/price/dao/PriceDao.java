package kr.or.kosta.eterna.price.dao;
import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.fileInfo.domain.FileInfo;
import kr.or.kosta.eterna.price.domain.Price;
import kr.or.kosta.eterna.product.domain.Product;


/**
 * Product 인터페이스 선언
 * @author 권현우
 *
 */
public interface PriceDao {
	/**제품가격등록*/
	public void registProductPrice(Price price) throws Exception;
	/**제품가격수정*/
	public void updateProductPrice(Price price) throws Exception;
	/**단일 제품 가격조회*/
	public Price readProductPrice(String productId) throws Exception;
	/**제품가격삭제*/
	public void deleteProductPrice(String productId) throws Exception;
	/**제품가격전체조회*/
	public List<Price> priceListAll() throws Exception;
}
