package kr.or.kosta.eterna.product.dao;
import java.util.List;
import kr.or.kosta.eterna.product.domain.Product;


/**
 * Product 인터페이스 선언
 * @author 권현우
 *
 */
public interface ProductDao {
	/**제품등록*/
	public void regist(Product product) throws Exception;
	/**제품검색*/
	public Product read(String productId) throws Exception;
	/**제품수정*/
	public void update(Product product) throws Exception;
	/**제품삭제*/
	public void delete(String productId) throws Exception;
	/**전체조회*/
	public List<Product> listAll() throws Exception;
	/**제품등록 중복체크*/
	public  boolean duplicateCheck(String product) throws Exception;
}
