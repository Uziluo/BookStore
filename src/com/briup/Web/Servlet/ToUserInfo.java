package com.briup.Web.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 被拦截器拦截，必须登陆后才能访问的一个servlet，
 * 用于前去个人信息界面
 */
@WebServlet("/touserinfo")
public class ToUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("WEB-INF/jsps/userinfo.jsp");
		request.getRequestDispatcher("WEB-INF/jsps/userinfo.jsp").forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
