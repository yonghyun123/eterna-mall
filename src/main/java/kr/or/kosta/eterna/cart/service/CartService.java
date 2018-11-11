package kr.or.kosta.eterna.cart.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.cart.domain.Cart;

/** Cart의 비즈니스 메소드 선언
 * 복잡한 트랜잭션 처리나 예외처리 등 
 * @author 조희진
 *
 */
public interface CartService {
	
	/* 장바구니에 물건 담을 시 장바구니에 추가 */
	public void create(Cart cart) throws Exception;
	
	/* 장바구니에 담긴 물건 중 살 물건 */
	public void toBuycreate(Cart cart) throws Exception;
	
	/* 장바구니에 담긴 물건 중 살 물건 리스트 조회 */
	public List<Cart> toBuylistAll(String userId) throws Exception;

	/* 장바구니에 담긴 물건 중 물건 삭제 */
	public void toBuyDelete(String userId) throws Exception;
	
	/* 장바구니에 담긴 물건 중 물건 삭제 */
	public void toBuyDelete(String userId, List<Cart> productList) throws Exception;

	/* 장바구니에 동일한 상품이 담겼는지 체크할 때 productId를 통한 검색 */
	public Cart read(String userId, String productId) throws Exception;
	
	/* 장바구니 수량 수정 */
	public void update(Cart cart) throws Exception;

	/* 장바구니 내의 물건 삭제 */
	public void delete(String userId, String productId) throws Exception;
	
	/* 회원별 장바구니 리스트 조회 */
	public List<Cart> listAll(String userId) throws Exception;
	
	/* 상세페이지 즉시 구매시 cart 형식의 데이터 (yonghyun)*/
	public Map<String, String> order(String productId) throws Exception;
	
	/* 카트에 담긴 데이터 조회 (yonghyun) */
	public List<Cart> readOrderCart(String userId) throws Exception;
	
	/* 유저별 가지고 있는 장바구니 물품 갯수 */
	public int countOfCart(String userId) throws Exception;
}
