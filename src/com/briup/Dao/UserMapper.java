package com.briup.Dao;

import com.briup.Bean.User;

public interface UserMapper {

	public void insertUser(User user);
	public long selectMaxId ();
	public User selectUserByName(String name);
	public void updateByAllInfo (User user);
	
	public void updatePSWbyName(User user);
}
