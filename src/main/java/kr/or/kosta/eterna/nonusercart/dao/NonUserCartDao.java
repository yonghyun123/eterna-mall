package kr.or.kosta.eterna.nonusercart.dao;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.cart.domain.Cart;

/**
 * 비회원 장바구니를 위한 Dao
 * @author 권현우
 *
 */
public interface NonUserCartDao {
		
	/* 장바구니에 담긴 물건 중 살 물건 */
	public void toBuycreate(Cart cart) throws Exception;
	
	/* 장바구니에 담긴 물건 중 살 물건 리스트 조회 */
	public List<Cart> toBuylistAll(String userId) throws Exception;
	
	/* 장바구니에 담긴 물건 중 물건 삭제 */
	public void toBuyDelete(String userId) throws Exception;
	
	/* 장바구니에 동일한 상품이 담겼는지 체크할 때 productId를 통한 검색 */
	public Cart read(String userId, String productId) throws Exception;
	
	/* 장바구니 수량 수정 */
	public void update(Cart cart) throws Exception;

	/* 장바구니 내의 물건 삭제 */
	public void delete(String userId, String productId) throws Exception;
	
	/* 회원별 장바구니 리스트 조회 */
	public List<Cart> listAll(List<String> productValue) throws Exception;
	
	/* 즉시 구매시 카트 형식으로 데이터를 보냄(yonghyun) */
	public Map<String, String> order(String productId) throws Exception;
}
