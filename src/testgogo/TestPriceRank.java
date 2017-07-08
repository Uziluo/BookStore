package testgogo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.briup.Bean.PriceRank;
import com.briup.Dao.PriceRankMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class TestPriceRank {
	private static SqlSession session;
	private static PriceRankMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(PriceRankMapper.class);
	}

	@Test
	public void SelectAll(){
		List<PriceRank> list = mapper.selectAll();
		System.out.println(list);
	}
}
