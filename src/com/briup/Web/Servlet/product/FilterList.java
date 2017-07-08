package com.briup.Web.Servlet.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.management.MXBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.Bean.Product;
import com.briup.utils.SetUtil;

@WebServlet("/filterlist")
public class FilterList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String price = request.getParameter("price"); 
		String publishid = request.getParameter("publishid");
		List<Product> products = null;  //获取session中的书籍
		List<Product> newproducts = new ArrayList<Product>(); //用于存储新的书
		HttpSession session = request.getSession();
		Object object = session.getAttribute("cproducts2");
		if (object!=null) {
			products =  (List<Product>) object;
			if ("".equals(price)&&!"".equals(publishid)) {
				//只选择出版社
				for (Product product : products) {
					if (product.getPublishid()==Integer.parseInt(publishid)) {
						newproducts.add(product);
					}
				}
			} else if(!"".equals(price)&&"".equals(publishid)) {
				//只选择价格
					String[] split = price.split("-");
					int minprice = Integer.parseInt(split[0]);
					int maxprice = Integer.parseInt(split[1]);
				for (Product product : products) {
					if (product.getPrice()>=minprice&&product.getPrice()<=maxprice) {
						newproducts.add(product);
					}
				}
			}else if(!"".equals(price)&&!"".equals(publishid)) {
				//选择价格 和出版社
					String[] split = price.split("-");
					int minprice = Integer.parseInt(split[0]);
					int maxprice = Integer.parseInt(split[1]);
					for (Product product : products) {
					if (product.getPrice()>=minprice&&product.getPrice()<=maxprice&&product.getPublishid()==Integer.parseInt(publishid)) {
						newproducts.add(product);
					}
				}
			}
		}
		request.setAttribute("cproducts", newproducts);
		
		String orderby = request.getParameter("orderby");
		if (orderby!=null) {
			if (orderby.equals("id")) {
				request.setAttribute("cproducts", new SetUtil(newproducts).getbyID());
			}else if (orderby.equals("sale_num")) {
				request.setAttribute("cproducts", new SetUtil(newproducts).getbysale_num());
			}else if (orderby.equals("price")) {
				request.setAttribute("cproducts", new SetUtil(newproducts).getbyprice());
			}else if (orderby.equals("start_date")) {
				request.setAttribute("cproducts", new SetUtil(newproducts).getbystart_date());
			}
		}
		
		request.getRequestDispatcher("WEB-INF/jsps/model/modellist.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
