package com.aroundog.model.domain;

public class Mail {
   private String to;
   private String mailTitle;
   private String mailContent;
   
   public String getTo() {
      return to;
   }
   public void setTo(String to) {
      this.to = to;
   }
   public String getMailTitle() {
      return mailTitle;
   }
   public void setMailTitle(String maileTitle) {
      this.mailTitle = maileTitle;
   }
   public String getMailContent() {
      return mailContent;
   }
   public void setMailContent(String mailContent) {
      this.mailContent = mailContent;
   }
   
   
}