package com.aroundog.model.domain;

public class LostBoardImg {
   private int lostboardimg_id;
   private LostBoard lostboard;
   private String img;
   private int lostboard_id;
   

   public int getLostboard_id() {
      return lostboard_id;
   }

   public void setLostboard_id(int lostboard_id) {
      this.lostboard_id = lostboard_id;
   }

   public int getLostboardimg_id() {
      return lostboardimg_id;
   }

   public void setLostboardimg_id(int lostboardimg_id) {
      this.lostboardimg_id = lostboardimg_id;
   }

   public LostBoard getLostboard() {
      return lostboard;
   }

   public void setLostboard(LostBoard lostboard) {
      this.lostboard = lostboard;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

}