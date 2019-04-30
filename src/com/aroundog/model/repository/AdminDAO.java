package com.aroundog.model.repository;

import com.aroundog.model.domain.Admin;

public interface AdminDAO {
	public Admin loginCheck(Admin admin);
}
