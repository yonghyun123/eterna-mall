package kr.or.kosta.eterna.nonusercart.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.eterna.cart.dao.CartDao;
import kr.or.kosta.eterna.cart.domain.Cart;
import kr.or.kosta.eterna.nonusercart.dao.NonUserCartDao;
import kr.or.kosta.eterna.product.domain.Product;

public class NonUserCartServiceImpl implements NonUserCartService {
	
	private CartDao cartDao;
	private NonUserCartDao nonusercartDao;
	
	public NonUserCartDao getNonusercartDao() {
		return nonusercartDao;
	}

	public void setNonusercartDao(NonUserCartDao nonusercartDao) {
		this.nonusercartDao = nonusercartDao;
	}

	public CartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public void create(Cart cart) throws Exception {
		cartDao.create(cart);
		
	}

	@Override
	public Cart read(String userId, String productId) throws Exception {
		return cartDao.read(userId, productId);
	}

	@Override
	public void update(Cart cart) throws Exception {
		cartDao.update(cart);
		
	}

	@Override
	public void delete(String userId, String productId) throws Exception {
		cartDao.delete(userId, productId);
		
	}

	@Override
	public List<Cart> listAll(List<String> productValue) throws Exception {
		return nonusercartDao.listAll(productValue);
	}

	@Override
	public Map<String, String> order(String productId) throws Exception {
		// TODO Auto-generated method stub
		return cartDao.order(productId);
	}

	@Override
	public void toBuycreate(Cart cart) throws Exception {
		cartDao.toBuycreate(cart);
		
	}

	@Override
	public List<Cart> toBuylistAll(String userId) throws Exception {
		return cartDao.toBuylistAll(userId);
	}

	@Override
	public void toBuyDelete(String userId ) throws Exception {
		cartDao.toBuyDelete(userId);
		
	}


}
