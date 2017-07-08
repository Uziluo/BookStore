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
 * 忘记密码的处理程序 
 * 第一步 验证验证码和用户名
 * @author Gress
 *
 */
@WebServlet("/forgetpwd1")
public class ForgetPwd1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String txtVcode= request.getParameter("txtVcode");
		String img = (String) request.getSession().getAttribute("imgCode");
		User user = new UserService().selectUserByName(name);
		//将找回密码的用户存储在session中  ,用于第二步Ajax异步验证电话号码是否正确
		request.getSession().setAttribute("fuser", user);
		if (txtVcode.equals(img)) {
			//验证完成，进入短信验证
			request.getRequestDispatcher("/WEB-INF/jsps/forgetPassword1.jsp").forward(request, response);
		} else {
			//验证码失败，重新返回验证
			//request.getRequestDispatcher("/WEB-INF/jsps/forgetPassword.jsp").forward(request, response);
			request.getRequestDispatcher("/WEB-INF/jsps/forgetPassword1.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
