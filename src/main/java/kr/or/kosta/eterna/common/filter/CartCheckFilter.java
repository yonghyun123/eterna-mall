package kr.or.kosta.eterna.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import kr.or.kosta.eterna.cart.service.CartService;
import kr.or.kosta.eterna.cart.service.CartServiceImpl;
import kr.or.kosta.eterna.common.factory.XMLObjectFactory;

/**
 * 장바구니 물품 유무 여부 체크 필터
 * 
 * @author 조희진
 */
public class CartCheckFilter implements Filter {

	private String cookieName;
	private CartService cartService;
	private int count = 0;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService) factory.getBean(CartServiceImpl.class);
		Cookie[] cookies = ((HttpServletRequest) request).getCookies();
		boolean isLogin = false;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("loginId")) {
					cookieName = cookie.getValue();
					isLogin = true;
					break;
				}
			}
		}
		if (isLogin) {
			try {
				count = cartService.countOfCart(cookieName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			count = 0;
		}
		request.setAttribute("cartCount", count);
		request.setAttribute("uri", ((HttpServletRequest) request).getRequestURI());
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}

}