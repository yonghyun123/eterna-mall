package kr.or.kosta.eterna.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.buy.dao.BuyDao;
import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.coupon.dao.CouponDao;
import kr.or.kosta.eterna.qna.dao.QnADao;
import kr.or.kosta.eterna.user.dao.UserDao;
import kr.or.kosta.eterna.user.domain.User;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	private CouponDao couponDao;
	private BuyDao buyDao;
	private QnADao qnaDao;
	
	public QnADao getQnaDao() {
		return qnaDao;
	}

	public void setQnaDao(QnADao qnaDao) {
		this.qnaDao = qnaDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	public CouponDao getCouponDao() {
		return couponDao;
	}

	public void setCouponDao(CouponDao couponDao) {
		this.couponDao = couponDao;
	}

	public BuyDao getBuyDao() {
		return buyDao;
	}

	public void setBuyDao(BuyDao buyDao) {
		this.buyDao = buyDao;
	}


	@Override
	public void create(User user) throws Exception {
		userDao.create(user);
	}

	@Override
	public User read(String id) throws Exception {
		return userDao.read(id);
	}

	@Override
	public void update(User user) throws Exception {
		userDao.update(user);
		
	}

	@Override
	public void delete(String userId, String userPasswd) throws Exception {
		userDao.delete(userId, userPasswd);
		
	}

	@Override
	public List<User> listAll() throws Exception {
		return userDao.listAll();
	}

	@Override
	public User certify(String userId, String userPasswd) throws Exception {
		return userDao.certify(userId, userPasswd);
	}
	
	@Override
	/* 적립금과 회원등급(grade), 사용한 쿠폰 삭제 업데이트 (용현수정) */
	public void pointUpdate(User user) throws Exception{
		int originPoint;
		int newPoint;
		int originGrade;
		int newGrade;
		
		if(user.getUserId() != null && !user.getUserId().equals("undefined")){
			User originUser = userDao.read(user.getUserId());
			originPoint = Integer.parseInt(originUser.getUserPoint());
			newPoint = Integer.parseInt(user.getUserPoint());
			originGrade = Integer.parseInt(originUser.getUserGrade());
			newGrade = Integer.parseInt(user.getUserGrade());
			user.setUserPoint(Integer.toString(originPoint + newPoint));
			user.setUserGrade(Integer.toString(originGrade + newGrade));
		}
		 
		userDao.pointUpdate(user);
		if(!user.getCouponId().equals("undefined")){
			userDao.deleteCoupon(user);	
		}
	}
	
	@Override
	public List<User> listCoupon(String userId) throws Exception {
		return userDao.listCoupon(userId);
	}

	@Override
	public int userPriceAmount(String userId) throws Exception {
		return userDao.userPriceAmount(userId);
	}

	@Override
	public int searchUpTier(String userId) throws Exception {
		return userDao.searchUpTier(userId);
	}

	@Override
	public int couponLength(String userId) throws Exception {
		return userDao.couponLength(userId);
	}

	@Override
	public Map<String, Object> myPage(String userId) throws Exception {
		Map<String, Object> map = new HashMap<>();
		User user = userDao.read(userId);
		int amount = userDao.userPriceAmount(userId);
		int grade = userDao.searchUpTier(userId);
		int couponLength = couponDao.couponLength(userId);
		List<Buy> orderAllList = buyDao.listAllByUser(userId);
		List<Buy> orderProductsLength = buyDao.numPurchase(userId);
		map.put("user", user);
		map.put("amount", amount);
		map.put("grade", grade);
		map.put("couponLength", couponLength);
		map.put("orderAllList", orderAllList);
		map.put("orderProductsLength", orderProductsLength);
		qnaDao.readQnA(userId);
		return map;
	}
}