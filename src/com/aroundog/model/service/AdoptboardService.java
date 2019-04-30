package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.Adoptboard;

public interface AdoptboardService {
	
	public void insert(Adoptboard adoptboard);
	public List selectAll();
	public Adoptboard select(int adoptboard_id);
	public void update(Adoptboard adoptboard);
	public void delete(int adoptboard_id);
}