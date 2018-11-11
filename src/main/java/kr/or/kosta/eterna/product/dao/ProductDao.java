package kr.or.kosta.eterna.product.dao;
import java.util.List;
import java.util.Map;

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
	/* 성별 별 제품 개수*/
    public int countPerSex(String sex) throws Exception;
    /* 연령대 별 제품 개수*/
    public int countPerAge(String age) throws Exception;
    /* 성별 별 제품 조회*/
    public List<Product> listBySex(String productSex) throws Exception;
    /* 전체 제품 개수*/
    public int countAll() throws Exception;
    /* 검색 조건을 적용한 제품 조회*/
    public List<Product> listByConditions(Map<String, Object> map) throws Exception;
    /* 검색 조건을 적용한 제품 개수*/
    public int countByConditions(Map<String, Object> map) throws Exception;
    /* 재고 부족한 상품 개수 */
    public int outOfStock() throws Exception;
    /**신상품 리스트*/
    public List<Product> brandNewList(String categoryId) throws Exception;
    /**인기상품 리스트*/
    public List<Product> popularProductList() throws Exception;
    
    
}
