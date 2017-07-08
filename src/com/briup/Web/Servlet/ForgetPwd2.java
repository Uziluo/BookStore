package com.briup.Web.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 处理第二步，短信验证
 * @author Gress
 *
 */
@WebServlet("/forgetpwd2")
public class ForgetPwd2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		System.out.println("短信验证吗："+code);
		if (code.length()==4) {
			//短信验证成功 ，这里只需要验证短信码是四位就行
			request.getRequestDispatcher("/WEB-INF/jsps/forgetPassword2.jsp").forward(request, response);
		} else {
			//短信验证失败
			request.getRequestDispatcher("/WEB-INF/jsps/forgetPassword1.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
