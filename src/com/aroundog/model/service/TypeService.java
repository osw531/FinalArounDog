package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.Type;

public interface TypeService {
	public List selectAll();
	public Type select(int type_id);
}
