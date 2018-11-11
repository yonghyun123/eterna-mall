package kr.or.kosta.eterna.product.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.product.domain.Product;

public interface ProductService {
	/* 전체 상품 검색 */
	public List<Product> listAll() throws Exception;

	/* 해당 상품 검색 */
	public Product read(String productId) throws Exception;

	/* 성별 별 제품 개수 */
	public int countPerSex(String sex) throws Exception;

	/* 연령대 별 제품 개수 */
	public int countPerAge(String age) throws Exception;

	/* 성별 별 제품 조회 */
	public List<Product> listBySex(String productSex) throws Exception;

	/* 전체 제품 개수 */
	public int countAll() throws Exception;

	/* 검색 조건을 적용한 제품 조회 */
	public List<Product> listByConditions(Map<String, Object> map) throws Exception;

	/* 검색 조건을 적용한 제품 개수 */
	public int countByConditions(Map<String, Object> map) throws Exception;

	/** 제품등록 중복체크 */
	public boolean duplicateCheck(String product) throws Exception;
	
    /* 인기상품 전체 리스트(판매량순/select선택시 필요)*/
	public List<Product> listBySales() throws Exception;
	/* 신상품 전체 리스트(select선택시 필요)*/
	public List<Product> listByRegdate() throws Exception;
	/* 평점별 전체 리스트(select선택시 필요)*/
	public List<Product> listByScore() throws Exception;

}
