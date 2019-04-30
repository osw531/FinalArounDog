package com.aroundog.model.service;

import org.springframework.stereotype.Service;

import com.aroundog.map.AreaSelect;

@Service
public class MapServiceImpl implements MapService{
   private AreaSelect areaSelect = new AreaSelect();
   @Override
   public double getLati(String area) {
      return areaSelect.getLati(area);
   }

   @Override
   public double getLongi(String area) {
      return areaSelect.getLongi(area);
   }
}