package com.briup.Bean;

import java.io.Serializable;
import java.util.Set;
/**订单
 * 数据库的字段
 * ID ：
 * NUM： 生成的订单编号
 * START_DATE :生成订单的时间
 * SUM_PRICE ：订单中所有订单项的总价
 * PAYWAY_ID ：支付方式的ID
 * STATUS :订单所处状态 1，待付款，2完成，3评价
 * USER_ID ：订单所处用户ID
 * RECEIVER_ID :订单的收货地址id
 * @author Gress
 *
 */
public class Order implements Serializable{
	private static final long serialVersionUID = 1L;
	private long id;
	//生成的订单编号
	private String num;
	//订单生成的时间
	private String start_date;
	//所有产品的总价
	private double sum_price;
	//支付方式
	private Payway payway;
	//订单的状态:1，待付款，2完成，3评价
	private String status;
	//订单所属的用户
	private User user;
	//接受人详细信息
	private Receiver receiver;
	private Set<OrderLine> orderlines;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public double getSum_price() {
		return sum_price;
	}
	public void setSum_price(double sum_price) {
		this.sum_price = sum_price;
	}
	public Payway getPayway() {
		return payway;
	}
	public void setPayway(Payway payway) {
		this.payway = payway;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Receiver getReceiver() {
		return receiver;
	}
	public void setReceiver(Receiver receiver) {
		this.receiver = receiver;
	}
	public Set<OrderLine> getOrderlines() {
		return orderlines;
	}
	public void setOrderlines(Set<OrderLine> orderlines) {
		this.orderlines = orderlines;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	
}
