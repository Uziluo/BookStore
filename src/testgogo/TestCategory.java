package testgogo;

import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.junit.Test;

import com.briup.Bean.Category;
import com.briup.Bean.CategoryDetail;
import com.briup.Dao.CategoryMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class TestCategory {

	private static SqlSession session;
	private static CategoryMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(CategoryMapper.class);
	}
	
	
	
	@Test
	public void selectbyID() {
		Category category = mapper.selectbyID(0);
		System.out.println(category);
		Set<CategoryDetail> set = category.getCate_detail();
		Iterator<CategoryDetail> iterator = set.iterator();
		while (iterator.hasNext()) {
			System.out.println(iterator.next());
		}
	}
	
	
	@Test
		public void selectAll(){
		List<Category> list = mapper.selectAll();
		System.out.println(list);
		for (Category category : list) {
			System.out.println(category);
		}
	}
	
	@Test
	public void selectAllCategory(){

		List<Category> list = mapper.selectAllCategory();
		System.out.println(list);
		for (Category category : list) {
			System.out.println(category);
		}
	
	}
}
