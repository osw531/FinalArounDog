package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.Adopt;
import com.aroundog.model.domain.Adoptdog;

public interface AdoptdogService {
	public List selectAll();
	public Adoptdog select(int adoptdog_id);
	public void update(Adoptdog adoptdog);
	public void delete(int adoptdog_id);
}