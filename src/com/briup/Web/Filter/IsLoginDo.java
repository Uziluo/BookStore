package com.briup.Web.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.Bean.User;

/**
 * 进行只有登陆以后才能进行操作的拦截IsLoginDo
 * @author Gress
 *
 */
@WebFilter(urlPatterns={"/doorder","/touserinfo","/toshopcart","/toconfirm"})
public class IsLoginDo implements Filter {
	private static HttpSession session = null;

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//System.out.println("进行只有登陆以后才能进行操作的拦截IsLoginDo");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp  = (HttpServletResponse) response;
		session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user==null) {
			//req.getRequestDispatcher("/tologin").forward(req, response);
			resp.sendRedirect("tologin");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
