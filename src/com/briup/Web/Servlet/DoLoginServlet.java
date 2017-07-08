package com.briup.Web.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.Service.UserService;

/**
 * 登陆判断处理 servlet
 * @author Gress
 *
 */
@WebServlet("/dologin")
public class DoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService uService = new UserService(); 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		boolean flag = uService.isLogin(name, password);
		if (flag) {
			//登陆成功去主页
			//替补掉注册时增加的name，下次显示登陆以最近更新的为准
			request.getSession().setAttribute("name", name);
			//保存登陆user对象在session中
			request.getSession().setAttribute("user", uService.selectUserByName(name));
			response.sendRedirect("index");
		} else {
			//登陆错误
			response.sendRedirect("tologin");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
