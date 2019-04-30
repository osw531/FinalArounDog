package com.aroundog.model.service;

import java.util.List;

public interface LostCommentsService {
	public List select(int lostboard_id);
	public void delete(int lostboard_id);
}
