package com.javaweb.controller.admin;



import com.javaweb.converter.BuildingSearchBuilderConverter;
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
     List<BuildingSearchResponse> result = buildingService.findAll(criteria);


     List<BuildingSearchResponse> responseList = new ArrayList<>();
     BuildingSearchResponse item1 = new BuildingSearchResponse();
     item1.setName("building");
     item1.setId(1L);
     item1.setAddress("quang trung duong pham ngu lao quan 1");
     item1.setNumberOfBasement(4L);
     item1.setManagerName("anh long");
     item1.setManagerPhoneNumber("0932637642");
     BuildingSearchResponse item2 = new BuildingSearchResponse();
     item2.setName("building 2");
     item2.setId(2L);
     item2.setAddress("quang trung duong pham ngu lao quan 2");
     item2.setNumberOfBasement(3L);
     item2.setManagerName("anh linh");
     item2.setManagerPhoneNumber("0932877642");
     responseList.add(item1);
     responseList.add(item2);
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
         BuildingDTO buildingDTO = new BuildingDTO();
         buildingDTO.setId(id);
         buildingDTO.setName("builidng abc");
         mav.addObject("buildingEdit", buildingDTO);
         mav.addObject("districts", District.type());
         mav.addObject("typecodes", TypeCode.type());
           return  mav;
    }

}
