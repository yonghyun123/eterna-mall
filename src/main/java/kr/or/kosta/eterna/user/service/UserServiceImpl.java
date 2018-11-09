package kr.or.kosta.eterna.user.service;

import java.util.List;

import kr.or.kosta.eterna.user.dao.UserDao;
import kr.or.kosta.eterna.user.domain.User;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
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
	public List<User> listCoupon(String userId) throws Exception {
		return userDao.listCoupon(userId);
	}

	@Override
	public int priceAmount(String userId) throws Exception {
		return userDao.priceAmount(userId);
	}

	@Override
	public int searchUpTier(String userId) throws Exception {
		return userDao.searchUpTier(userId);
	}

	@Override
	public int couponLength(String userId) throws Exception {
		return userDao.couponLength(userId);
	}
}
