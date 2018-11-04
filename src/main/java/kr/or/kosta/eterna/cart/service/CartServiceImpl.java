package kr.or.kosta.eterna.cart.service;

import java.util.List;

import kr.or.kosta.eterna.cart.dao.CartDao;
import kr.or.kosta.eterna.cart.domain.Cart;

public class CartServiceImpl implements CartService {
	
	private CartDao cartDao;
	
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
	public List<Cart> listAll(String userId) throws Exception {
		return cartDao.listAll(userId);
	}


}
