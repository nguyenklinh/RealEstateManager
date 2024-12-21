package com.javaweb.service;

import com.javaweb.model.dto.CustomerSearchCriteriaDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CustomerService {
    Page<CustomerSearchResponse> findAll(CustomerSearchCriteriaDTO criteriaDTO, Pageable pageable);
    ResponseDTO listStaffs(Long customerId);
}
