package testgogo;

import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.briup.Bean.Publish;
import com.briup.Dao.PublishMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class TestPublish {

	private static SqlSession session;
	private static PublishMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(PublishMapper.class);
	}
	
	@Test
	public void selectAll(){
		Set<Publish> set = mapper.selectAllPulish();
		System.out.println(set);
	}
}
