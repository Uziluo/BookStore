package com.briup.Web.Servlet.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.Bean.ShopCart;

/**
 * 订单查询界面
 *  	如果没有cart对象就需要清除 session保存的对象
 * @author Gress
 *
 */
@WebServlet("/toshopcart")
public class ToShopCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShopCart cart = (ShopCart) session.getAttribute("cart");
		if (cart == null) {
			cart = new ShopCart();
			session.removeAttribute("cart");
			session.removeAttribute("orders");
		}
		request.getRequestDispatcher("WEB-INF/jsps/shopCart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
