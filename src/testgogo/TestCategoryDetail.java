package testgogo;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.briup.Bean.CategoryDetail;
import com.briup.Dao.CategoryDetailMapper;
import com.briup.Dao.CategoryMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class TestCategoryDetail {

	private static SqlSession session;
	private static CategoryDetailMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(CategoryDetailMapper.class);
	}
	@Test
	public void selectAll(){
		Set<CategoryDetail> list = mapper.selectAllcategoryDetail();
		System.out.println(list);
		for (CategoryDetail detail : list) {
			System.err.println(detail);
		}
	}
}
