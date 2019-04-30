package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.Adoptboard;

public interface AdoptboardDAO {
	public List selectAll();
	public Adoptboard select(int adoptboard_id);
	public int insert(Adoptboard adoptboard);
	public int update(Adoptboard adoptboard);
	public int delete(int adoptboard_id);
	
}