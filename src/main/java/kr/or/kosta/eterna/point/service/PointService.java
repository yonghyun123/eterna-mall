package kr.or.kosta.eterna.point.service;

import java.util.List;

import kr.or.kosta.eterna.point.domain.Point;

/**
 * 적립금 관리를 위한 service
 * @author 이철우
 *
 */
public interface PointService {
//	유저별 적립금 내역 조회
	public List<Point> userPointList(String userId) throws Exception;
}
