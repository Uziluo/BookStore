package com.briup.Web.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.Bean.User;
import com.briup.Service.UserService;

/**
 * 
 * 用于注册判断是否用户名重复
 * @author Gress
 *
 */
@WebServlet("/ajaxusername")
public class AjaxUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService uService = new UserService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		User user = uService.selectUserByName(username);
		System.out.println(username);
		PrintWriter out = response.getWriter();
		if (user==null) {
			//不存在
			out.write("false");
		} else {
			//存在 ,
			out.write("true");
		}
		out.flush();
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
