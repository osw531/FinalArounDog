package com.aroundog.model.domain;

public class Adoptboard {
	private int adoptboard_id;
	private Adoptdog adoptdog;
	private String title;
	private String content;
	private String regdate;
	
	
	public int getAdoptboard_id() {
		return adoptboard_id;
	}
	public void setAdoptboard_id(int adoptboard_id) {
		this.adoptboard_id = adoptboard_id;
	}
	public Adoptdog getAdoptdog() {
		return adoptdog;
	}
	public void setAdoptdog(Adoptdog adoptdog) {
		this.adoptdog = adoptdog;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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

}