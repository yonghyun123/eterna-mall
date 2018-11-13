package kr.or.kosta.eterna.userRcmd.service;


import kr.or.kosta.eterna.user.dao.UserRcmdDao;
import kr.or.kosta.eterna.user.domain.UserRcmd;

public class UserRcmdServiceImpl implements UserRcmdService {
	
	private UserRcmdDao userRcmdDao;

	
	public UserRcmdDao getUserRcmdDao() {
		return userRcmdDao;
	}

	public void setUserRcmdDao(UserRcmdDao userRcmdDao) {
		this.userRcmdDao = userRcmdDao;
	}

	@Override
	public void create(UserRcmd userrcmd) throws Exception {
		userRcmdDao.create(userrcmd);
	}

	@Override
	public UserRcmd read(String userId) throws Exception {
		return userRcmdDao.read(userId);
	}

	@Override
	public void update(UserRcmd userrcmd) throws Exception {
		userRcmdDao.update(userrcmd);
	}

	@Override
	public void delete(String userId) throws Exception {
		userRcmdDao.delete(userId);
	}

}