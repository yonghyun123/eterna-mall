package kr.or.kosta.eterna.cart.dao;

import java.util.List;

import kr.or.kosta.eterna.cart.domain.Cart;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 조희진
 *
 */
public interface CartDao {
	
	/* 장바구니에 물건 담을 시 장바구니에 추가 */
	public void create(Cart cart) throws Exception;
	
	/* 장바구니에 동일한 상품이 담겼는지 체크할 때 productId를 통한 검색 */
	public Cart read(String userId, String productId) throws Exception;
	
	/* 장바구니 수량 수정 */
	public void update(Cart cart) throws Exception;

	/* 장바구니 내의 물건 삭제 */
	public void delete(String userId, String productId) throws Exception;
	
	/* 회원별 장바구니 리스트 조회 */
	public List<Cart> listAll(String userId) throws Exception;
	
}
