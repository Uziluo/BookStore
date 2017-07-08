package com.briup.Web.Servlet.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.Bean.OrderLine;
import com.briup.Bean.ShopCart;

/**
 * 
 * 购物车结算跳转
 * @author Gress
 *
 */
@WebServlet("/toconfirm")
public class ToConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pids = request.getParameter("pids");
		String[] ids = pids.split("-");
		//获取购物车
		HttpSession session = request.getSession();
		ShopCart cart= (ShopCart) session.getAttribute("cart");
		if (cart==null) { cart = new ShopCart(); }
		//获取购物清单 ,使用list 去装订单项
		List<OrderLine> list = new ArrayList<OrderLine>();
		long num = 0;
		double TotalPrice = 0;
		for (int i = 1; i < ids.length; i++) {
				OrderLine  orderLine = cart.getbyID(Long.parseLong(ids[i]));
				list.add(orderLine);
				num = num+orderLine.getAmount();
				TotalPrice =  TotalPrice + orderLine.getSingle_price();
				
		}
		//订单行
		request.setAttribute("ConfirmOrderlines", list);
		//产品总数
		request.setAttribute("num", num);
		//产品总价
		request.setAttribute("TotalPrice", TotalPrice);
		
		System.out.println("confirm"+list);
		request.getRequestDispatcher("WEB-INF/jsps/confirm.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
