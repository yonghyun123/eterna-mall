package kr.or.kosta.eterna.coupon.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.coupon.dao.CouponDao;
import kr.or.kosta.eterna.coupon.domain.Coupon;
import kr.or.kosta.eterna.product.dao.ProductDao;
import kr.or.kosta.eterna.product.domain.Product;

public class CouponServiceImpl implements CouponService {

	private CouponDao couponDao;

	public CouponDao getCouponDao() {
		return couponDao;
	}

	public void setCouponDao(CouponDao couponDao) {
		this.couponDao = couponDao;
	}

	@Override
	public List<Coupon> userCouponList(String userId) throws Exception {
		// TODO Auto-generated method stub
		return couponDao.userCouponList(userId);
	}

	@Override
	public int couponLength(String userId) throws Exception {
		return couponDao.couponLength(userId);
	}
}
