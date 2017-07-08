package com.briup.Web.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.Bean.User;
import com.briup.Service.UserService;

/**
 * 处理第二步，短信验证
 * @author Gress
 *
 */
@WebServlet("/forgetpwd3")
public class ForgetPwd3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newpsw = request.getParameter("newpsw");
		System.out.println("newpsw："+newpsw);
		//准备需要装载的user
		User user = (User) request.getSession().getAttribute("fuser");
		user.setPassword(newpsw);
		System.out.println(user);
		//调用Service
		new UserService().updatePSWbyName2(user);
		request.getRequestDispatcher("/WEB-INF/jsps/forgetPassword3.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
