package com.aroundog.model.repository;

import java.util.List;

public interface LostCommentsDAO {
	public List select(int lostboard_id);
	public int delete(int lostboard_id);
}
