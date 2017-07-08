package com.briup.Web.Servlet.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.Bean.Product;
import com.briup.Service.ProductService;

/**
 * 前去登录 url
 * 用于跳转去登陆界面
 * @author Gress
 *
 */
@WebServlet("/tolist")
public class ToList extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static ProductService productService = new ProductService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 根据大分类ID 在list.jsp来展示所有书籍
		 String cid =  request.getParameter("cid");
		// 根据小分类ID 在list.jsp来展示所有书籍
		 String did = request.getParameter("did");
		// 根据名字查询， 在list.jsp来展示所有书籍
		 String pname = request.getParameter("pname");
		 List<Product> products = null;
			if (cid != null) {
				products = productService.selectProByCID(Integer.parseInt(cid));
			} else if (did != null) {
				products = productService.selectProByDID(Integer.parseInt(did));
			} else if (pname != null) {
				products = productService.selectProductBylikeName(pname);
			} else {
				products = productService.selectAllProduct();
			}
			HttpSession session = request.getSession();
			session.setAttribute("cproducts2", products);
			request.setAttribute("cproducts", products);
		
			request.getRequestDispatcher("/WEB-INF/jsps/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
