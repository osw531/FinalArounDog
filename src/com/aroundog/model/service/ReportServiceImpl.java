package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aroundog.common.exception.EditFailException;
import com.aroundog.common.exception.ReportFailException;
import com.aroundog.common.file.ReNameSercurity;
import com.aroundog.common.file.ReportImgUploader;
import com.aroundog.model.domain.Report;
import com.aroundog.model.domain.ReportImg;
import com.aroundog.model.repository.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService {
   @Autowired
   @Qualifier("mybatisReportDAO")
   private ReportDAO reportDAO;
   
   private ReportImgUploader uploader = new ReportImgUploader();
   @Override
   public void insert(Report report) throws ReportFailException {
      int result = reportDAO.insert(report);
      if (result == 0) {
         throw new ReportFailException("제보 실패!!");
      }
   }
   @Override
   public List selectAll() {
      return reportDAO.selectAll();
   }

   @Override
   public Report select(int report_id) {
      return reportDAO.select(report_id);
   }

   @Override
   public List selectImg(int report_id) {
      return reportDAO.selectImg(report_id);
   }

   @Override
   public void update(int report_id) {
      int result = reportDAO.update(report_id);
      if (result == 0) {
         throw new EditFailException("확인 실패");
      }
   }

   @Override
   public void insertImg(MultipartFile[] myFile, Report report, String realPath) throws ReportFailException {
      String[] imgList = uploader.returnFilename(myFile, report,realPath); // System.out.println("서비스에서 받은;
      int result = 0;
      for (int i = 0; i < imgList.length; i++) {
         ReportImg ri = new ReportImg();
         ri.setReport(report);
         ri.setImg(imgList[i]);
         result = reportDAO.insertImg(ri);
      }
      if (result == 0) {
         throw new ReportFailException("제보 실패!!");
      }
   }
}