package kr.or.kosta.eterna.point.service;

import java.util.List;

import kr.or.kosta.eterna.point.dao.PointDao;
import kr.or.kosta.eterna.point.domain.Point;

public class PointServiceImpl implements PointService {

	private PointDao pointDao;

	public PointDao getPointDao() {
		return pointDao;
	}

	public void setPointDao(PointDao pointDao) {
		this.pointDao = pointDao;
	}

	@Override
	public List<Point> userPointList(String userId) throws Exception {
		return pointDao.userPointList(userId);
	}
}
