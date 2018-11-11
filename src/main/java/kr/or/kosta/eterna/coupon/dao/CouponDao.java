package kr.or.kosta.eterna.coupon.dao;
import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.coupon.domain.Coupon;
import kr.or.kosta.eterna.product.domain.Product;


/**
 * Coupon 인터페이스 선언
 * @author 이철우
 *
 */
public interface CouponDao {
//	유저별 쿠폰 조회
	public List<Coupon> userCouponList(String userId) throws Exception;
	
//	id를 이용한 쿠폰 개수 조회
	public int couponLength(String userId) throws Exception;
}
