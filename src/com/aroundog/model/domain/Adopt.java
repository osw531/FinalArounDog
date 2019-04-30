package com.aroundog.model.domain;

public class Adopt {
	private int adopt_id;
	private String phone;
	private String email;
	private String content;
	private String regdate;
	private String envir;
	private Adoptboard adoptboard;
	private int adoptboard_id;
	
	private Member member;
	private String checking;
	
	
	public int getAdopt_id() {
		return adopt_id;
	}
	public void setAdopt_id(int adopt_id) {
		this.adopt_id = adopt_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getEnvir() {
		return envir;
	}
	public void setEnvir(String envir) {
		this.envir = envir;
	}
	public Adoptboard getAdoptboard() {
		return adoptboard;
	}
	public void setAdoptboard(Adoptboard adoptboard) {
		this.adoptboard = adoptboard;
	}
	public int getAdoptboard_id() {
		return adoptboard_id;
	}
	public void setAdoptboard_id(int adoptboard_id) {
		this.adoptboard_id = adoptboard_id;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getChecking() {
		return checking;
	}
	public void setChecking(String checking) {
		this.checking = checking;
	}
	
	
	
	
}