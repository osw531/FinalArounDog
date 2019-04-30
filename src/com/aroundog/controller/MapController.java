package com.aroundog.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aroundog.model.service.MapService;
 

@Controller
public class MapController {
   @Autowired
   private MapService mapService;
   
   //위도 경도 받아오기!
   @RequestMapping(value="/user/map/area",method=RequestMethod.GET)
   @ResponseBody
   public String getPos(@RequestParam("area") String area) {
      double lati = mapService.getLati(area);
      double longi = mapService.getLongi(area);
      
      
      JSONObject obj = new JSONObject();
      obj.put("lati",lati);
      obj.put("longi", longi);
      return obj.toString();
   }
}