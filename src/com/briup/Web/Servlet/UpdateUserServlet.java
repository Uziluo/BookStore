package com.briup.Web.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.briup.Bean.User;
import com.briup.Service.UserService;

/**
 * 在个人信息页面进行用户数据的更新
 * 	1.只有旧密码正确才能完成更新，否则不进行更新
 *  2.当旧密码正确，新密码为空的时候选择不更新密码，只更新其他内容
 * @author Gress
 *
 */
@WebServlet("/updateuserinfo")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService uService = new UserService();   
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		String oldpassword =request.getParameter("oldpassword");
		String newpassword =request.getParameter("newpassword");
		String zip =request.getParameter("zip");
		String address =request.getParameter("address");
		String phone =request.getParameter("telephone");
		String email =request.getParameter("email");
		User user =(User) request.getSession().getAttribute("user");
		String pw  = ((User) request.getSession().getAttribute("user")).getPassword();
		
		if (oldpassword.equals(pw)) {
			User u = null;
			if ("".equals(newpassword.trim())) {
				 u = new User(user.getId(), name, oldpassword, zip, address, phone, email);
			} else {
				 u = new User(user.getId(), name, newpassword, zip, address, phone, email);
			}
			uService.updateUser(u);
			request.getSession().setAttribute("user", u);
			response.sendRedirect("index");
		} else {
			response.sendRedirect("touserinfo");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
