package com.briup.Bean;
/*
 * 用户
 */

import java.io.Serializable;
import java.util.Set;

public class User  implements Serializable{
	private static final long serialVersionUID = 1L;
	private long id;
	//用户名
	private String name;
	//密码
	private String password;
	//邮箱
	private String zip;
	//地址
	private String address;
	//电话
	private String phone;
	//邮箱
	private String email;
	//订单
	private Set<Order> orders;
	//所有的留言
	private Set<Evaluate> evaluates;
	//接受货物的地址
	private Set<Receiver> receivers;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public Set<Evaluate> getEvaluates() {
		return evaluates;
	}
	public void setEvaluates(Set<Evaluate> evaluates) {
		this.evaluates = evaluates;
	}
	public Set<Receiver> getReceivers() {
		return receivers;
	}
	public void setReceivers(Set<Receiver> receivers) {
		this.receivers = receivers;
	}
	public User() {
	}
	public User(long id, String name, String password, String zip, String address, String phone, String email) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.zip = zip;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", zip=" + zip + ", address=" + address
				+ ", phone=" + phone + ", email=" + email + ", orders=" + orders + ", evaluates=" + evaluates
				+ ", receivers=" + receivers + "]";
	}
	
	
	
}
