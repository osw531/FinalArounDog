package com.aroundog.model.domain;

public class ReportImg {
   private int reportimg_id;
   private Report report;
   private String img;
   
   public int getReportimg_id() {
      return reportimg_id;
   }
   public void setReportimg_id(int reportimg_id) {
      this.reportimg_id = reportimg_id;
   }
   public Report getReport() {
      return report;
   }
   public void setReport(Report report) {
      this.report = report;
   }
   public String getImg() {
      return img;
   }
   public void setImg(String img) {
      this.img = img;
   }   
}