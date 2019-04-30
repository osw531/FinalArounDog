package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.Report;
import com.aroundog.model.domain.ReportImg;

@Repository
public class MybatisReportDAO implements ReportDAO {
   @Autowired
   private SqlSessionTemplate sessionTemplate;

   @Override
   public int insert(Report report) {
      // TODO Auto-generated method stub
      return sessionTemplate.insert("Report.insert", report);
   }

   @Override
   public int insertImg(ReportImg reportImg) {
      return sessionTemplate.insert("ReportImg.insert_img", reportImg);
   }

   @Override
   public List selectAll() {
      return sessionTemplate.selectList("Report.selectAll");
   }

   @Override
   public Report select(int report_id) {
      return sessionTemplate.selectOne("Report.select", report_id);
   }

   @Override
   public List selectImg(int report_id) {
      // TODO Auto-generated method stub
      return sessionTemplate.selectList("ReportImg.selectImgList", report_id);
   }

   @Override
   public int update(int report_id) {
      return sessionTemplate.update("Report.update", report_id);
   }

}