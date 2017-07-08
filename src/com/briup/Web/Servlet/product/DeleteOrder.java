package com.briup.Web.Servlet.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.Bean.ShopCart;



@WebServlet("/deleteorder")
public class DeleteOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String parameter = request.getParameter("id");
		Long id   =Long.parseLong(parameter);
		//	session.setAttribute("cart", cart);
		HttpSession session = request.getSession();
		ShopCart cart= (ShopCart) session.getAttribute("cart");
		try {
			cart.removeProduct(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			session.setAttribute("cart", cart);
			session.setAttribute("orders", cart.getArrayListOrderLines());
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("toshopcart");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
