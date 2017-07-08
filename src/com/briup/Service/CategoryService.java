package com.briup.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.briup.Bean.Category;
import com.briup.Dao.CategoryMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

/**
 * 产品的种类 和分类的服务 ，与数据库进行交互的地方
 * @author Gress
 *
 */
public class CategoryService {

	private static SqlSession session;
	private static CategoryMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(CategoryMapper.class);
	}
	
	/**
	 * @return  返回一个集合，包含种类，每个种类里面含分类集合，每个分类集合含有产品集合
	 */
	public List<Category> selectAll (){
		
		List<Category> list = mapper.selectAll();
		return list;
	}
	
	/*public static void main(String[] args) {
		CategoryService cService  = new CategoryService();
		List<Category> list = cService.selectAll();
	}*/
	
}
