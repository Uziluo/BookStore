package com.briup.Bean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ShopCart implements IShopCart {
	//Map key 对应产品id  ，value值是订单项
	private Map<Long,OrderLine> orderlines = new HashMap<Long,OrderLine>();
	
	public void addProduct(Product product) throws Exception{
		System.out.println("进入ShopCart的add()方法！");
		long number = 1;
		long id = product.getId();
		if(orderlines.containsKey(id)) {
			OrderLine orderline = (OrderLine) orderlines.get(id);
			number = orderline.getAmount()+1L;
			orderline.setAmount(number);
		}else {
			OrderLine orderline = new OrderLine();
			orderline.setAmount(new Long(number));
			orderline.setProduct(product);
			orderlines.put(id, orderline);
		}
	}

	public void addMoreProduct(Product product,Long num){
		long id = product.getId();
		if (orderlines.containsKey(id)) {
			OrderLine orderLine = orderlines.get(id);
			//long amount = orderLine.getAmount()+num;
			long amount = num;
			orderLine.setAmount(amount);
		} else {
			OrderLine orderline = new OrderLine();
			orderline.setAmount(num);
			orderline.setProduct(product);
			orderlines.put(id, orderline);
		}
	}
	
	public void removeProduct(Long productid) throws Exception{
		System.out.println("进入ShopCart的removeProduct()方法！");
		//map集合移除订单项
		orderlines.remove(productid);
	}

	public void removeAllProducts() throws Exception{
		System.out.println("进入ShopCart的removeAllProducts()方法！");
		//把map集合全部清空
		orderlines.clear();
	}

	public void updateProduct(Long productid, Long number) throws Exception{
		System.out.println("进入ShopCart的updateProduct()方法！");
		OrderLine orderline = orderlines.get(productid);
		orderline.setAmount(number);
	}

	public BigDecimal getTotalPrice() throws Exception{
		System.out.println("进入ShopCart的getTotalPrice()方法！");
		BigDecimal totalPrice = new BigDecimal(0);
		Iterator<OrderLine> iter = getOrderlines();
		//判断下一个值是否有值iter.hasNext()
		while(iter.hasNext()) {
			//获取值
			OrderLine o = (OrderLine) iter.next();
			Product p = o.getProduct();
			BigDecimal sum = new BigDecimal(p.getPrice()*o.getAmount());
			totalPrice = totalPrice.add(sum);    
		}
		return totalPrice;
	}
	//获取迭代器，对map集合的遍历方式
	public Iterator<OrderLine> getOrderlines() throws Exception{
		System.out.println("进入ShopCart的getOrderlines()方法！");
		//orderlines.values()得到所有的value值--》Set集合
		return orderlines.values().iterator();
	}
	
	/**
	 *  将一系列的订单项存了一个list集合
	 * @return
	 * @throws Exception
	 */
	public List<OrderLine> getArrayListOrderLines() throws Exception{
		
		Iterator<OrderLine> orderlines2 = getOrderlines();
		ArrayList<OrderLine> list = new ArrayList<OrderLine>();
		while (orderlines2.hasNext()) {
			OrderLine orderLine = orderlines2.next();
			list.add(orderLine);
		}
		return list;
	}
	
	public List<OrderLine> getbyArray(long[] a){
		List<OrderLine> list= new ArrayList<>();
		for (long id : a) {
			OrderLine orderLine = orderlines.get(id);
			list.add(orderLine);
		}
		return list;
	}
	
	/**
	 * 根据ID 获取订单项
	 * @param id
	 * @return
	 */
	public OrderLine getbyID(long id ){
		OrderLine orderLine = orderlines.get(id);
		return orderlines.get(id);
	}

	@Override
	public String toString() {
		return "ShopCart [orderlines=" + orderlines + "]";
	}
	
	
}
