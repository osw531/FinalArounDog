package com.aroundog.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.aroundog.model.domain.Adoptboard;

public interface AdoptboardService {
   
   public void insert(Adoptboard adoptboard, String realPath);
   public List selectAll();
   public Adoptboard select(int adoptboard_id);
   public void update(Adoptboard adoptboard, String realPath);
   public void delete(int adoptboard_id, String realPath);
}