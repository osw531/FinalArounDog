package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.Adopt;

public interface AdoptService {
	public void insert(Adopt adopt);
	public List selectAll();
	public Adopt select(int adopt_id);
	public void update(Adopt adopt);
}