package com.briup.Service;

import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import com.briup.Bean.Publish;
import com.briup.Dao.PublishMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class PublishService {

	private static SqlSession session ;
	private static PublishMapper mapper;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper =  session.getMapper(PublishMapper.class);
	}
	
	public Set<Publish> selectAllPulish (){
		Set<Publish> pulishs = mapper.selectAllPulish();
		return pulishs;
	}
	
}
