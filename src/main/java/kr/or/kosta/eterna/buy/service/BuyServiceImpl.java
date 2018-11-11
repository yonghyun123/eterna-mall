package kr.or.kosta.eterna.buy.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.buy.dao.BuyDao;
import kr.or.kosta.eterna.buy.domain.Buy;
import kr.or.kosta.eterna.cart.domain.Cart;

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
      buyDao.createManage(buy);
   }
   
   @Override
   public void create(Buy buy, List<Cart> productList) throws Exception{
	   buyDao.createInfo(buy);
	   for (Cart cart : productList) {
		   buyDao.createManage(cart);
	   }
   }

   @Override
   public List<Buy> listAllByUser(String userId) throws Exception {
      return buyDao.listAllByUser(userId);
   }
   
   @Override
   public List<Buy> listAll() throws Exception {
      return buyDao.listAll();
   }
   
   @Override
   public List<Buy> recentAddress(String userId) throws Exception {
      return buyDao.recentAddress(userId);
   }
   
   @Override
   public List<Buy> numPurchase(String userId) throws Exception {
      return buyDao.numPurchase(userId);
   }

   @Override
   public List<Buy> listPerMonth(String categoryId) throws Exception {
      return buyDao.listPerMonth(categoryId);
   }

   @Override
   public List<Buy> listAmount() throws Exception {
      return buyDao.listAmount();
   }

@Override
public List<Buy> showOrderDetailUser(String id) throws Exception {
	return buyDao.showOrderDetailUser(id);
}


}