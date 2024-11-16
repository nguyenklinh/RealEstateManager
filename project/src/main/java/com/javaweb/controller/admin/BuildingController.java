package com.javaweb.controller.admin;



import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.BuildingSearchCriteriaDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private IUserService userService;

 @GetMapping(value = "/admin/building-list")
    public ModelAndView buildinglist(@ModelAttribute BuildingSearchCriteriaDTO buildingSearchCriteriaDTO, HttpServletRequest request){
     ModelAndView mav= new ModelAndView("admin/building/list");
     mav.addObject("modelSearch",buildingSearchCriteriaDTO);
     //xuong database xu ly lay dc du lieu phuhop
     BuildingSearchBuilder criteria = BuildingSearchBuilderConverter.converterToEntity(buildingSearchCriteriaDTO);
     List<BuildingSearchResponse> responseList = buildingService.findAll(criteria);

     mav.addObject("buildingList",responseList);
     mav.addObject("listStaffs",userService.getStaffs());
     mav.addObject("districts", District.type());
     mav.addObject("typecodes", TypeCode.type());
     return  mav;
 }

 @GetMapping(value = "admin/building-edit")
    public ModelAndView buildingedit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav= new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit",buildingDTO);
        mav.addObject("districts", District.type());
        mav.addObject("typecodes", TypeCode.type());
        return  mav;
    }

 @GetMapping(value = "admin/building-edit-{id}")
    public ModelAndView buildingedit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav= new ModelAndView("admin/building/edit");
        // xuong dtbase tim building theo id

         BuildingDTO buildingDTO = buildingService.findById(id);

         mav.addObject("buildingEdit", buildingDTO);
         mav.addObject("districts", District.type());
         mav.addObject("typecodes", TypeCode.type());
           return  mav;
    }

}
