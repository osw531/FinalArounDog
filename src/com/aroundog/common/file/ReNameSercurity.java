package com.aroundog.common.file;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ReNameSercurity {
   public String textToHash(String filename) {
      StringBuilder sb = new StringBuilder();
      try {
         MessageDigest md = MessageDigest.getInstance("SHA-224");
         md.update(filename.getBytes());
         byte[] data = md.digest(); 

         for (int i = 0; i < data.length; i++) {
            sb.append(Integer.toString((data[i] & 0xff) + 0x100, 16).substring(1));
         }
      } catch (NoSuchAlgorithmException e) {
         e.printStackTrace();
      }
      return sb.toString();
   }
}