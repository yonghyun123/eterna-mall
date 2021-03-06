package kr.or.kosta.eterna.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.or.kosta.eterna.qna.service.QnAService;
import kr.or.kosta.eterna.qna.service.QnAServiceImpl;

/**
 * 장바구니 물품 유무 여부 체크 필터
 * 
 * @author 조희진
 */
public class CartCheckFilter implements Filter {

	private String cookieName;
	private String products; 
	private String recentViews;
	private CartService cartService;
	private QnAService qnaService;
	private int countCart = 0;
	private int countAnswer = 0;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		cartService = (CartService) factory.getBean(CartServiceImpl.class);
		qnaService = (QnAService) factory.getBean(QnAServiceImpl.class);
		Cookie[] cookies = ((HttpServletRequest) request).getCookies();
		boolean isLogin = false;
		boolean hasProduct = false;
		boolean hasView = false;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("loginId")) {
					cookieName = cookie.getValue();
					isLogin = true;
					break;
				}
			}
			
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("products")) {
				products = cookie.getValue();
				hasProduct = true;
					break;
				}
			}
			
			for(Cookie cookie : cookies) {
				if (cookie.getName().equals("recentView")) {
					recentViews = cookie.getValue();
					hasView = true;
						break;
					}
			}
			
		}
		if (isLogin) {
			try {
				countCart = cartService.countOfCart(cookieName);
				countAnswer = qnaService.countAnswer(cookieName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(hasProduct){
			String [] product =products.split("@"); 
			countCart = product.length -1;
			countAnswer = 0;
		}else {
			countCart = 0;
			countAnswer = 0;
		}
		List<String[]>recentViewList = new ArrayList<String[]>();
		if(hasView) {
			String[] recentviewArray = recentViews.split("@");
			String[] recentviewDetail = null;
			
			/*Map<String, String>recentView = new HashMap<String, String>();
			*/
		
			for(int i=1; i<recentviewArray.length; i++ ) {
				recentviewDetail = recentviewArray[i].split("#");
				recentViewList.add(recentviewDetail);
			}
		}
		request.setAttribute("cartCount", countCart);
		request.setAttribute("answerCount", countAnswer);
		request.setAttribute("recentViewList", recentViewList);
		request.setAttribute("uri", ((HttpServletRequest) request).getRequestURI());
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}

}