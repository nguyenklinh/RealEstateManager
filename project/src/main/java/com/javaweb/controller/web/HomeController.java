package com.javaweb.controller.web;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.SearchForm;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	@Autowired
	private BuildingService buildingService;

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("modelSearch", buildingSearchRequest);
		return mav;
	}

    @GetMapping(value="/gioi-thieu")
    public ModelAndView introducceBuiding(){
        ModelAndView mav = new ModelAndView("web/introduce");
        return mav;
    }
	@GetMapping(value = "/{id}")
	public ModelAndView buildingDetail(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView("web/detail");
		BuildingDTO buildingDTO = buildingService.findById(id);
		mav.addObject("building", buildingDTO);
		mav.addObject("districts", District.type());
		return mav;
	}

    @GetMapping(value="/san-pham")
    public ModelAndView buidingList(@RequestParam(defaultValue = "1") int page,
									@RequestParam(value = "district", required = false) String district,
									@RequestParam(value = "name", required = false) String name,
									@ModelAttribute("searchForm") SearchForm searchForm){

        ModelAndView mav = new ModelAndView("/web/list");
		Pageable pageable = PageRequest.of(page-1,6);
		Page<BuildingEntity> buildingPage = buildingService.getAllBuildings(district, name, pageable);
		searchForm.setDistrict(district);
		searchForm.setName(name);
		mav.addObject("buildings", buildingPage.getContent());
		mav.addObject("totalPages", buildingPage.getTotalPages());
		mav.addObject("currentPage", page);
		mav.addObject("district", district);
		mav.addObject("name", name);
		mav.addObject("districts", District.type());
		mav.addObject("searchForm", searchForm);

        return mav;
    }

    @GetMapping(value="/tin-tuc")
    public ModelAndView news(){
        ModelAndView mav = new ModelAndView("/web/news");
        return mav;
    }


    @GetMapping(value="/lien-he")
    public ModelAndView contact(){
        ModelAndView mav = new ModelAndView("/web/contact");
        return mav;
    }

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
}
