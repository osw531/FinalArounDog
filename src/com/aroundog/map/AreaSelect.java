package com.aroundog.map;

public class AreaSelect {
   public double getLati(String area) {
      double lati = 0;
      if(area.equals("서울")){
         lati = 37.566576;
      }else if(area.equals("경기도")){
         lati =37.288728;
      }else if(area.equals("인천")){
         lati = 37.456137;
      }else if(area.equals("강원도")){
         lati = 37.886080;
      }else if(area.equals("부산")){
         lati = 35.179802;
      }else if(area.equals("광주")){
         lati = 37.421120;
      }else if(area.equals("대전")){
         lati = 36.350569;
      }
      return lati;
   }
   public double getLongi(String area) {
      double longi = 0;
      if(area.equals("서울")){
         longi = 126.978353;
      }else if(area.equals("경기도")){
         longi =127.053840;
      }else if(area.equals("인천")){
         longi = 126.705884;
      }else if(area.equals("강원도")){
         longi = 127.729533;
      }else if(area.equals("부산")){
         longi = 129.074994;
      }else if(area.equals("광주")){
         longi = 127.257186;
      }else if(area.equals("대전")){
         longi = 127.384894;
      }
      return longi;
   }
}