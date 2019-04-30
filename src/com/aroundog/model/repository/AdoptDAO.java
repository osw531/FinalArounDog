package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.Adopt;

public interface AdoptDAO {
	public int insert(Adopt adopt);
	public List selectAll();
	public Adopt select(int adopt_id);
	public int update(Adopt adopt);
}