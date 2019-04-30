package com.aroundog.model.domain;

public class FreeComment {
	private int freecomment_id;
	private FreeBoard freeBoard;
	private Member member;
	private String content;
	private String regdate;
	private int team;
	private int depth;
	private int freeboard_id;
	private int member_id;
	public int getFreeComment_id() {
		return freecomment_id;
	}
	public void setFreeComment_id(int freecomment_id) {
		this.freecomment_id = freecomment_id;
	}
	public FreeBoard getFreeBoard() {
		return freeBoard;
	}
	public void setFreeBoard(FreeBoard freeBoard) {
		this.freeBoard = freeBoard;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getTeam() {
		return team;
	}
	public void setTeam(int team) {
		this.team = team;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getFreeboard_id() {
		return freeboard_id;
	}
	public void setFreeboard_id(int freeboard_id) {
		this.freeboard_id = freeboard_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
	
}
