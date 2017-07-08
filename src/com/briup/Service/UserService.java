package com.briup.Service;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.briup.Bean.User;
import com.briup.Dao.UserMapper;
import com.briup.utils.MyBatisSqlSessionFactory;

public class UserService {

	private static SqlSession session ;
	private static UserMapper mapper;
	/**
	 *  临时接收selectUserByName返回的User对象 参数
	 */
	private static User user = null;
	static{
		session = MyBatisSqlSessionFactory.openSession();
		mapper = session.getMapper(UserMapper.class);
	}
	
	/** 
	 * @param user
	 * @return  false插入失败  ， true插入成功
	 */
	public boolean insertUser(User user2){
		user = selectUserByName(user2.getName());
		if (user==null&&!"".equals(user2.getName())) {
			user2.setId(selectMaxId()+1);
			mapper.insertUser(user2);
			session.commit();
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 判断是否登陆成功
	 * @param name  前台的用户名
	 * @param password	前台的用户名
	 * @return  false 失败 ,true登陆成功
	 */
	public boolean isLogin(String name,String password){
		 user = selectUserByName(name);
		 if (user!=null&&password.equals(user.getPassword())) {
				return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 这个是根据ID去修改信息
	 * @param user1 传除ID以外，其他需要更新的信息的一个对象
	 */
	public void updateUser(User user1){
		mapper.updateByAllInfo(user1);
		session.commit();
	}
	
	
	//用于增加用户的时候插入id值
		private long selectMaxId(){
			long max =mapper.selectMaxId();
			return max;
		}
		
		public User selectUserByName(String name){
			UserMapper mapper = session.getMapper(UserMapper.class);
			user = mapper.selectUserByName(name);
			return user;
		}
	
		
		public void updatePSWbyName2(User user){
			mapper.updatePSWbyName(user);
			System.out.println("更新完成");
			session.commit();
		}
		
		public static void main(String[] args) {
			UserService userService = new UserService();
			User user = userService.selectUserByName("ggr");
			user.setPassword("11221");
			userService.updatePSWbyName2(user);
			
		}
		
}
