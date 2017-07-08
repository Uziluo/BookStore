package com.briup.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.briup.Bean.Product;
import com.briup.Dao.ProductMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class ProductService {

	private static SqlSession session;
	private static ProductMapper mapper;
	static {
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(ProductMapper.class);
	}
	
	
	/**
	 * @return	查询所有的书籍
	 */
	public List<Product> selectAllProduct(){
		List<Product> list = mapper.selectAllProduct();
		return list;
	}
	
	/**
	 * @param productId  书籍的ID值
	 * @return	返回书籍这个对象
	 */
	public Product selectProductById(int productId){
		 Product product = mapper.selectProductById(productId);
		return product;
	}
	
	/**
	 * @param cid
	 * @return
	 */
	public List<Product> selectProByCID(int cid){
		List<Product> list = mapper.selectProByCID(cid) ;
		return list;
	}
	
	/**
	 * @param did
	 * @return
	 */
	public List<Product> selectProByDID(int did){
		List<Product> list = mapper.selectProByDID(did)  ;
		return list;
	}
	
	/**
	 * @param name
	 * @return
	 */
	public List<Product> selectProductBylikeName(String name){
		List<Product> list = mapper.selectProductBylikeName(name)  ;
		return list;
	}
	
	
	public HashMap<Object, Object> selectCAT_DETAILbyID(){
		HashMap<Object, Object> list = mapper.selectCAT_DETAILbyID(7);
		
		return list;
	}
}
