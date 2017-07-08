package com.briup.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.briup.Bean.PriceRank;
import com.briup.Dao.PriceRankMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class PeiceRankService {

	private static SqlSession session;
	private static PriceRankMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(PriceRankMapper.class);
	}
	
	public List<PriceRank> selectAllRank(){
		List<PriceRank> list = mapper.selectAll();
			return list;
	}
	
	
}
