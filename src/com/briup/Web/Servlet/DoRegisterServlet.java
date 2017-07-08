package com.briup.Web.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.Bean.User;
import com.briup.Service.UserService;

/**
 *   注册 逻辑处理
 * @author Gress
 *
 */
@WebServlet("/doregister")
public class DoRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static UserService uService = new UserService();   
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		String password =request.getParameter("password");
		String zip =request.getParameter("zip");
		String address =request.getParameter("address");
		String phone =request.getParameter("telephone");
		String email =request.getParameter("email");
		//check =1 是选择同意了注册协议
		//String check =request.getParameter("check");
		User u =new User(0,name, password, zip, address, phone, email);
		boolean flag = uService.insertUser(u);
		if (flag) {
			request.getSession().setAttribute("name", name);
			response.sendRedirect("tologin");
		} else {
			request.getRequestDispatcher("/WEB-INF/jsps/register.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
