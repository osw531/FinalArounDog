package com.aroundog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.aroundog.model.domain.Report;
import com.aroundog.model.domain.ReportImg;
import com.aroundog.model.service.ReportService;
 

@Controller
public class ReportController {
   @Autowired
   private ReportService reportService;
   
   //제보하기 report 글 등록
   @RequestMapping(value = "/user/report", method = RequestMethod.POST)
   public String report(Report report, HttpServletRequest request) {
      MultipartFile[] myFile = report.getMyFile();
      String realPath = request.getServletContext().getRealPath("/data");
      reportService.insert(report);
      reportService.insertImg(myFile, report,realPath);
      return "redirect:/user/index.jsp";
   }
}