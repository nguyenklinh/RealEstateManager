package com.javaweb.controller.admin;

import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.CustomerSearchCriteriaDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.service.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller("customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;
    @GetMapping("/admin/customer-list")
    public ModelAndView customerList(@ModelAttribute CustomerSearchCriteriaDTO customerSearchCriteriaDTO,
                                     @RequestParam(defaultValue = "1") int page,
                                     HttpServletRequest request){
        Pageable pageable = PageRequest.of(page-1,3);
        ModelAndView mav= new ModelAndView("admin/customer/list");
        Page<CustomerSearchResponse> responsePage = customerService.findAll(customerSearchCriteriaDTO,pageable);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", responsePage.getTotalPages());
        mav.addObject("customerList",responsePage.getContent());
        mav.addObject("modelSearch",customerSearchCriteriaDTO);
        mav.addObject("listStaffs",userService.getStaffs());
        return mav;
    }

    @GetMapping("/admin/customer-edit")
    private ModelAndView customerEdit(@ModelAttribute CustomerDTO customerDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdit",customerDTO);
        mav.addObject("status", Status.type());
        return mav;
    }
}
