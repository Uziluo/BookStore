package com.briup.Web.Servlet.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.Bean.User;

@WebServlet("/doshop")
public class DoShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name"); //收货人
		String address = request.getParameter("address"); //收货地址
		String phone = request.getParameter("phone");  //收货人电话
		String pids = request.getParameter("pids");	//订单项的拼接id eg:
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
