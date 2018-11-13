package kr.or.kosta.eterna.point.dao;
import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.coupon.domain.Coupon;
import kr.or.kosta.eterna.point.domain.Point;
import kr.or.kosta.eterna.product.domain.Product;


/**
 * Coupon 인터페이스 선언
 * @author 이철우
 *
 */
public interface PointDao {
//	유저별 적립금 내역 조회
	public List<Point> userPointList(String userId) throws Exception;
}
