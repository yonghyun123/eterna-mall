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
import org.apache.log4j.Logger;


/**
 * 사용자 로그인 여부 체크 필터
 */
public class LoginCheckFilter implements Filter {
	
	private Logger logger = Logger.getLogger(LoginCheckFilter.class);
	
	private String loginPage;
	private String cookieName;

    @Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	logger.debug("LoginCheckFiler 실행..");
		boolean isLogin = false;
		Cookie[] cookies = ((HttpServletRequest)request).getCookies();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("loginId")) {
					isLogin = true;
					cookieName = cookie.getValue();
					logger.debug("로그인 중!");
					break;
				}
			}
		}
		
		if(isLogin) {
			request.setAttribute("loginId", cookieName);
		} 
		request.setAttribute("uri", ((HttpServletRequest)request).getRequestURI());
		chain.doFilter(request, response);
	}
    
    @Override
	public void destroy() {}

}