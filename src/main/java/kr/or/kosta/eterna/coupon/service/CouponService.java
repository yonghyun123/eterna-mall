package kr.or.kosta.eterna.coupon.service;

import java.util.List;

import kr.or.kosta.eterna.coupon.domain.Coupon;

public interface CouponService {
//	유저별 쿠폰 조회
	public List<Coupon> userCouponList(String userId) throws Exception;
	
//	id를 이용한 쿠폰 개수 조회
	public int couponLength(String userId) throws Exception;
}
