package com.briup.Dao;

import java.util.List;

import com.briup.Bean.Category;

public interface CategoryMapper {

	public List<Category> selectAll();
	
	public Category selectbyID (int id );
	
	public  List<Category> selectAllCategory();
}
