package com.aroundog.model.domain;

import org.springframework.web.multipart.MultipartFile;

public class LostBoard {
   private int lostboard_id;
   private String title;
   private String content;
   private String regdate;
   private String startdate;
   private String enddate;
   private int hit;
   private double lati;
   private double longi;
   private Type type;
   private MultipartFile[] myFile;
   private String img;
   private Member member;
   private int member_id;

   public int getMember_id() {
      return member_id;
   }

   public void setMember_id(int member_id) {
      this.member_id = member_id;
   }

   public int getLostboard_id() {
      return lostboard_id;
   }

   public void setLostboard_id(int lostboard_id) {
      this.lostboard_id = lostboard_id;
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

   public String getStartdate() {
      return startdate;
   }

   public void setStartdate(String startdate) {
      this.startdate = startdate;
   }

   public String getEnddate() {
      return enddate;
   }

   public void setEnddate(String enddate) {
      this.enddate = enddate;
   }

   public int getHit() {
      return hit;
   }

   public void setHit(int hit) {
      this.hit = hit;
   }

   public double getLati() {
      return lati;
   }

   public void setLati(double lati) {
      this.lati = lati;
   }

   public double getLongi() {
      return longi;
   }

   public void setLongi(double longi) {
      this.longi = longi;
   }

   public Type getType() {
      return type;
   }

   public void setType(Type type) {
      this.type = type;
   }

   public MultipartFile[] getMyFile() {
      return myFile;
   }

   public void setMyFile(MultipartFile[] myFile) {
      this.myFile = myFile;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

   public Member getMember() {
      return member;
   }

   public void setMember(Member member) {
      this.member = member;
   }
}