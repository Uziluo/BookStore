package com.briup.Service;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import com.briup.Bean.Category;
import com.briup.Bean.CategoryDetail;
import com.briup.Dao.CategoryDetailMapper;
import com.briup.Dao.CategoryMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

/**
 * 产品的种类 和分类的服务 ，与数据库进行交互的地方
 * @author Gress
 *
 */
public class CategoryDetailService implements CategoryDetailMapper{

	private static SqlSession session;
	private static CategoryDetailMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(CategoryDetailMapper.class);
	}
	
	
	@Override
	public Set<CategoryDetail> selectAllcategoryDetail() {
		
		return mapper.selectAllcategoryDetail();
	}
	
	@Override
	public CategoryDetail selectcategorybyID(long id) {
		
		return mapper.selectcategorybyID(id);
	}
	
	
}
