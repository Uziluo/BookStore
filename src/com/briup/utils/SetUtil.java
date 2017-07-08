package com.briup.utils;

import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;

import com.briup.Bean.Product;

/**
 * 只需将 产品的集合通过构造器传进，然后根据不同方法进行判断是按什么排序来写 ，这里全部返回的是TreeSet 集合
 * 
 * @author Gress
 *
 */
public class SetUtil {

	private List<Product> getlist;

	public SetUtil(List<Product> getlist) {
		this.getlist = getlist;
	}

	/**
	 * 根据id 从小到大排序
	 * 
	 * @return
	 */
	public TreeSet<Product> getbyID() {

		TreeSet<Product> set = new TreeSet<Product>(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				if (o1.getId() > o2.getId()) {
					return 1;
				} else {
					return -1;
				}
			}
		});
		for (Product product : getlist) {
			set.add(product);
		}
		return set;
	}

	/**
	 * 根据销量从多到少排序
	 * 
	 * @return
	 */
	public TreeSet<Product> getbysale_num() {

		TreeSet<Product> set = new TreeSet<Product>(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				if (o1.getSale_num() > o2.getSale_num()) {
					return -1;
				} else {
					return 1;
				}
			}
		});
		for (Product product : getlist) {
			set.add(product);
		}
		return set;
	}

	/**
	 * 根据 价格由低到高排序
	 * 
	 * @return
	 */
	public TreeSet<Product> getbyprice() {

		TreeSet<Product> set = new TreeSet<Product>(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				if (o1.getPrice() > o2.getPrice()) {
					return 1;
				} else {
					return -1;
				}
			}
		});
		for (Product product : getlist) {
			set.add(product);
		}
		return set;
	}

	/**
	 * 根据产品生产日期排序 Publish_date
	 * 
	 * @return
	 */
	public TreeSet<Product> getbypublish_date() {

		TreeSet<Product> set = new TreeSet<Product>(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				int result = o1.getPublish_date().compareTo(o2.getPublish_date());
				if (result > 0) {
					return -1;
				} else {
					return 1;
				}
			}
		});
		for (Product product : getlist) {
			set.add(product);
		}
		return set;
	}

	/**
	 * 根据产品上架时间排序 Start_date
	 * 
	 * @return
	 */
	public TreeSet<Product> getbystart_date() {

		TreeSet<Product> set = new TreeSet<Product>(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				int result = o1.getStart_date().compareTo(o2.getStart_date());
				if (result > 0) {
					return -1;
				} else {
					return 1;
				}
			}
		});
		for (Product product : getlist) {
			set.add(product);
		}
		return set;
	}

	/*
	 * public static void main(String[] args) { String a="203-10-12"; String
	 * b="2003-10-21"; int result=a.compareTo(b);
	 * 
	 * if (result==0) System.out.print("a=b");
	 * 
	 * else if (result < 0 ) System.out.print("a<b");
	 * 
	 * else System.out.print("a>b"); }
	 */

}
