package testgogo;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.briup.Bean.Category;
import com.briup.Bean.CategoryDetail;
import com.briup.Bean.User;
import com.briup.Dao.CategoryMapper;
import com.briup.Dao.UserMapper;
import com.briup.utils.GetSessionFactory;
import com.briup.utils.MyBatisSqlSessionFactory;
public class TestUser {
	private static SqlSession session;
	static{
		session = MyBatisSqlSessionFactory.openSession();
	}
	
	@Test
	public void selectAll(){
		SqlSession session = MyBatisSqlSessionFactory.openSession();
		System.out.println(111);
		CategoryMapper mapper = session.getMapper(CategoryMapper.class);
		List<Category> list = mapper.selectAll();
		System.out.println(list);
	}
	
	@Test
	public void selectbyID() {

		CategoryMapper mapper = session.getMapper(CategoryMapper.class);
		Category category = mapper.selectbyID(0);
		System.out.println(category);
		Set<CategoryDetail> set = category.getCate_detail();
		Iterator<CategoryDetail> iterator = set.iterator();
		while (iterator.hasNext()) {
			System.out.println(iterator.next());
		}
	}
	
	@Test
	public void user1(){
		UserMapper mapper = session.getMapper(UserMapper.class);
		long selectMaxId = mapper.selectMaxId();
		System.out.println(selectMaxId);
	}
	@Test
	public void user2(){
		UserMapper mapper = session.getMapper(UserMapper.class);
		User u = new User(2, "1", "1", "2", "2", "3", "2");
		mapper.insertUser(u);
		session.commit();
	}
	@Test
	public void user3(){
		UserMapper mapper = session.getMapper(UserMapper.class);
		User user = mapper.selectUserByName("ggr");
		System.out.println(user);
	}
	
	
	
}
