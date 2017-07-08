package com.briup.Web.Servlet.product;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.briup.Bean.OrderLine;
import com.briup.Bean.Product;
import com.briup.Bean.ShopCart;
import com.briup.Service.ProductService;

/**处理订单管理的Servlet  只在tolist中进行加入购物车和viewBook中添加多数的书
 * @author Gress
 *
 */
@WebServlet("/doorder")
public class DoOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService pService = new ProductService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShopCart cart= (ShopCart) session.getAttribute("cart");
		String pid = request.getParameter("pid");
		String num = request.getParameter("num");
		System.out.println(pid+"--"+num);
		//将cart对象存入session中，在取出，如果第一次使用就将
		if (cart==null) { cart = new ShopCart(); } 
		if (pid != null) {
			Product product = pService.selectProductById(Integer.parseInt(pid));
			try {
				if (num!=null) {
					cart.addMoreProduct(product,Long.parseLong(num));
				} else {
					cart.addProduct(product); 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			session.setAttribute("cart", cart);
			session.setAttribute("orders", cart.getArrayListOrderLines());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
