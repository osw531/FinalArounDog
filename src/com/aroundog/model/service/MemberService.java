package com.aroundog.model.service;

import java.util.List;
import com.aroundog.model.domain.Member;


public interface MemberService {
	public Member loginCheck(Member member);
	public List selectAll();
	public Member select(int member_id);
	public void insert(Member member);
	public void update(Member member);
	public void updateUser(Member member);
	public void delete(int member_id);
	public Member selectByName(String name);
	public Member idCheck(String id);
	
}
