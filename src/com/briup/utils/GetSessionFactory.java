package com.briup.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GetSessionFactory {
	
	private static SqlSessionFactory session;
	
	public static SqlSessionFactory getSqlSessionFactory(){
		if (session==null) {
			InputStream iStream  = null;
			try {
			iStream =  Resources.getResourceAsStream("mybatis-config.xml");
			session  = new SqlSessionFactoryBuilder().build(iStream);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e.getCause());
			}finally {
				if (iStream!=null) try { iStream.close(); } catch (IOException e) { }
			}
		}
		return session;
	}
	

	public static SqlSession openSession(){
		return openSession(false);
	}
	public static SqlSession openSession(boolean autoCommit){
		return getSqlSessionFactory().openSession(autoCommit);
	}
	
}
