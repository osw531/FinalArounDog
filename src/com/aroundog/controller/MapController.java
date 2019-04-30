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
   
   @RequestMapping(value="/user/map/area",method=RequestMethod.GET)
   @ResponseBody
   public String getPos(@RequestParam("area") String area) {
	  System.out.println("getPos 실행");
      double lati = mapService.getLati(area);
      double longi = mapService.getLongi(area);
      
      
      JSONObject obj = new JSONObject();
      obj.put("lati",lati);
      obj.put("longi", longi);
      System.out.println("getpos 실행 후 데이터"+ obj.toString());
      return obj.toString();
   }
}