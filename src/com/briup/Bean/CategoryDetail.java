package com.briup.Bean;

import java.io.Serializable;
import java.util.Set;

/*
 *书种类的细化
 */
public class CategoryDetail  implements Serializable{
	private static final long serialVersionUID = 1L;
	private long id;
	//所属种类的id
	private long CATEGORY_ID ;
	//所属的种类
	private Category category;
	//书籍细化的名字
	private String name;
	//产品
	private Set<Product> products;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "CategoryDetail [id=" + id + ", CATEGORY_ID=" + CATEGORY_ID + ", category=" + category + ", name=" + name
				+ ", products=" + products + "]";
	}
	public long getCATEGORY_ID() {
		return CATEGORY_ID;
	}
	public void setCATEGORY_ID(long cATEGORY_ID) {
		CATEGORY_ID = cATEGORY_ID;
	}
	
}
