package kr.or.kosta.eterna.cart.service;

import java.util.List;
import java.util.Map;

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
	public void toBuyDelete(String userId, List<Cart> productList) throws Exception {
		cartDao.toBuyDelete(userId);
		for (Cart cart : productList) {
			delete(userId, cart.getProductId());
		}
	}
	
	@Override
	public void toBuyDelete(String userId) throws Exception {
		cartDao.toBuyDelete(userId);

	}
	@Override
	public List<Cart> readOrderCart(String userId) throws Exception{
		return cartDao.readOrderCart(userId);
	}

	@Override
	public int countOfCart(String userId) throws Exception {
		return cartDao.countOfCart(userId);
	}

	@Override
	public Cart nonReadCart(String productId) throws Exception {
		return cartDao.nonReadCart(productId);
	}
}
