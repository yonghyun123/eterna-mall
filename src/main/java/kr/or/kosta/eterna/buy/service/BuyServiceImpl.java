package kr.or.kosta.eterna.buy.service;

import java.util.List;

import kr.or.kosta.eterna.buy.dao.BuyDao;
import kr.or.kosta.eterna.buy.domain.Buy;

public class BuyServiceImpl implements BuyService {
	
	private BuyDao buyDao;
	
	public BuyDao getBuyDao() {
		return buyDao;
	}

	public void setBuyDao(BuyDao buyDao) {
		this.buyDao = buyDao;
	}

	@Override
	public void create(Buy buy) throws Exception {
		buyDao.createInfo(buy);
		
		// count 받아서 for 문 돌려야 함!!!!!
		
		
		buyDao.createManage(buy);
		
	}

	@Override
	public List<Buy> listAll(String userId) throws Exception {
		return buyDao.listAll(userId);
	}

	@Override
	public List<Buy> recentAddress(String userId) throws Exception {
		return buyDao.recentAddress(userId);
	}


}
