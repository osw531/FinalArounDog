package com.aroundog.model.domain;

import org.springframework.web.multipart.MultipartFile;

public class Adoptdog {
	private int adoptdog_id;
	private int vaccin_id;
	private int neut_id;
	private int location_id;
	private Type type;
	private String age;
	private String feature;
	private String gender;
	//파일 업로드 관련
	private String img;
	private MultipartFile myFile;
	
	public int getAdoptdog_id() {
		return adoptdog_id;
	}
	public void setAdoptdog_id(int adoptdog_id) {
		this.adoptdog_id = adoptdog_id;
	}
	public int getVaccin_id() {
		return vaccin_id;
	}
	public void setVaccin_id(int vaccin_id) {
		this.vaccin_id = vaccin_id;
	}
	public int getNeut_id() {
		return neut_id;
	}
	public void setNeut_id(int neut_id) {
		this.neut_id = neut_id;
	}
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public MultipartFile getMyFile() {
		return myFile;
	}
	public void setMyFile(MultipartFile myFile) {
		this.myFile = myFile;
	}
	
	
	
	
}