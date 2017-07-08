package com.briup.Web.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.Bean.User;

/**
 * 在找回密码的第二步，验证用户输入的电话号码是否正确
 * 返回值 	1. session可能已经过期，即session中没有user对象 需要重新进行第一步操作
 * 			2. 电话正确
 * 			3。 电话错误
 * @author Gress
 *
 */
@WebServlet("/AjaxForgetPhone")
public class AjaxForgetPhone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("fuser");
		PrintWriter out = response.getWriter();
		String phone = request.getParameter("phone");
		if (user == null) {
			//1 表示当前session可能已经过期
			out.write("1");
		} else {
			if (user.getPhone().equals(phone)) {
				// 2  . 表示电话正确
				out.write("2");
			} else {
				// 3. 表示电话错误
				out.write("3");
			}
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
