package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.Adopt;
import com.aroundog.model.domain.Adoptdog;

public interface AdoptdogDAO {
	public int insert(Adoptdog adoptdog);
	public List selectAll();
	public Adoptdog select(int adoptdog_id);
	public int update(Adoptdog adoptdog);
	public int delete(int adoptdog_id);
}