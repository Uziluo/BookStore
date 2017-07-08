package testgogo;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.briup.Bean.Category;
import com.briup.Bean.CategoryDetail;
import com.briup.Bean.Receiver;
import com.briup.Bean.User;
import com.briup.Dao.CategoryMapper;
import com.briup.Dao.ReceiverMapper;
import com.briup.Dao.UserMapper;
import com.briup.utils.GetSessionFactory;
import com.briup.utils.MyBatisSqlSessionFactory;
public class TestReceeive {
	private static SqlSession session;
	private static ReceiverMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(ReceiverMapper.class);
	}
	
	@Test
	public void insert(){
		Receiver receiver = new Receiver(0, "zhang", "江西", "222", null, new User(2, null, null, null, null, null, null)); 
		mapper.insertOne(receiver);
		session.commit();
	}
	
	@Test
	public void selectMAxID(){
	
		int maxID = mapper.selectMaxID();
		System.out.println(maxID);
	}
	
	
	
	
	
}
