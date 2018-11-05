package kr.or.kosta.eterna.qna.service;

import java.util.List;

import kr.or.kosta.eterna.qna.dao.QnADao;
import kr.or.kosta.eterna.qna.domain.QnA;

public class QnAServiceImpl implements QnAService {
	
	private QnADao qnaDao;
	

	public QnADao getQnaDao() {
		return qnaDao;
	}

	public void setQnaDao(QnADao qnaDao) {
		this.qnaDao = qnaDao;
	}

	@Override
	public void create(QnA qna) throws Exception {
		qnaDao.create(qna);
	}

	@Override
	public void createComment(QnA qna) throws Exception {
		qnaDao.createComment(qna);
	}

	@Override
	public void update(QnA qna, String id) throws Exception {
		qnaDao.update(qna, id);
	}

	@Override
	public List<QnA> listItem(String productId) throws Exception {
		return qnaDao.listItem(productId);
	}

	@Override
	public List<QnA> myList(String userId) throws Exception {
		return qnaDao.myList(userId);
	}

	@Override
	public List<QnA> listAll() throws Exception {
		return qnaDao.listAll();
	}
	
/*	
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
	}*/
	

}
