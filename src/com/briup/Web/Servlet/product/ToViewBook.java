package com.briup.Web.Servlet.product;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.Bean.Product;
import com.briup.Service.CategoryDetailService;
import com.briup.Service.ProductService;

@WebServlet("/toviewbook")
public class ToViewBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService = new ProductService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int  productId  =Integer.parseInt( request.getParameter("id"));
		Product product = productService.selectProductById(productId);
		HashMap<Object, Object>  CAT_DET = productService.selectCAT_DETAILbyID();
		
		request.setAttribute("product", product);
		request.setAttribute("DETAIL", new CategoryDetailService().selectcategorybyID(product.getCAT_DETAIL_ID()));
		request.getRequestDispatcher("WEB-INF/jsps/viewBook.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	

}
