package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.Member;

public interface MemberDAO {
	public Member loginCheck(Member member);
	public List selectAll();
	public Member select(int member_id);
	public int insert(Member member);
	public int update(Member member);
	public int updateUser(Member member);
	public int delete(int member_id);
	public Member selectByName(String name);
	public Member idCheck(String id);
}
