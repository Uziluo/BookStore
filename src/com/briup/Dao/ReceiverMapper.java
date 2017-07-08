package com.briup.Dao;

import com.briup.Bean.Receiver;

public interface ReceiverMapper {

	/**
	 * 插入一条地址数据
	 * @param receiver
	 */
	public void insertOne(Receiver receiver);
	
	/**
	 * @return 返回最大的ID值
	 */
	public int selectMaxID();
}
