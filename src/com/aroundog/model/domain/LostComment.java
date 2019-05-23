package com.aroundog.model.domain;

public class LostComment {
   private int lostcomment_id;
   private LostBoard lostBoard;
   private Member member;
   private String content;
   private String regdate;
   private int team;
   private int depth;
   private int lostboard_id;
   private int member_id;

   public int getLostcomment_id() {
      return lostcomment_id;
   }

   public void setLostcomment_id(int lostcomment_id) {
      this.lostcomment_id = lostcomment_id;
   }

   public LostBoard getLostBoard() {
      return lostBoard;
   }

   public void setLostBoard(LostBoard lostBoard) {
      this.lostBoard = lostBoard;
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

   public int getLostboard_id() {
      return lostboard_id;
   }

   public void setLostboard_id(int lostboard_id) {
      this.lostboard_id = lostboard_id;
   }

   public int getMember_id() {
      return member_id;
   }

   public void setMember_id(int member_id) {
      this.member_id = member_id;
   }

}