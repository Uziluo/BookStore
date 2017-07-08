package com.briup.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.briup.Bean.Product;

public interface ProductMapper {

	/** 查询所有的产品
	 * @return
	 */
	public List<Product> selectAllProduct ();
	
	/**
	 * 根据产品的Id查产品
	 * @param id  
	 * @return
	 */
	public Product selectProductById(int id);
	
	/**
	 * 产品名字的模糊查询  --搜索栏
	 * @param name
	 * @return
	 */
	public List<Product> selectProductBylikeName(String name);
	
	/**
	 * 根据二级分类查询所i有的产品
	 * @param did
	 * @return
	 */
	public List<Product> selectProByDID(int did);
	
	/**
	 * 根据一级的分类查询所有产品
	 * @param cid
	 * @return
	 */
	public List<Product> selectProByCID(int cid);
	
	
	/** 
	 * 根据id 查询书籍的二级分类 的id 和名字
	 * @param id
	 * @return selectCAT_DETAILbyID
	 */
	public HashMap<Object, Object> selectCAT_DETAILbyID (int id);
	
	
}
