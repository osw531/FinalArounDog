package com.aroundog.model.domain;


public class LostComments {
	private int lostcomments_id;
	private int lostboard_id;
	private Member member;
	private String secret;
	private String content;
	private String regdate;
	private int team;
	private int rank;
	private int depth;
	
	
	public int getLostcomments_id() {
		return lostcomments_id;
	}
	public void setLostcomments_id(int lostcomments_id) {
		this.lostcomments_id = lostcomments_id;
	}
	public int getLostboard_id() {
		return lostboard_id;
	}
	public void setLostboard_id(int lostboard_id) {
		this.lostboard_id = lostboard_id;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
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
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
}
