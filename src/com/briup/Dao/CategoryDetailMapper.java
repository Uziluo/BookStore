package com.briup.Dao;

import java.util.Set;

import com.briup.Bean.CategoryDetail;

public interface CategoryDetailMapper {

	public Set<CategoryDetail>selectAllcategoryDetail();
	
	public CategoryDetail selectcategorybyID( long id);
}
