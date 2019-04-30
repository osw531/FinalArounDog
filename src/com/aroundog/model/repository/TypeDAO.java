package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.Admin;
import com.aroundog.model.domain.Type;


public interface TypeDAO {
	public List selectAll();
	public Type select(int type_id);
	
	
}
