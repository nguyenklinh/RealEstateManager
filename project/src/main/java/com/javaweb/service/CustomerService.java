package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.CustomerSearchCriteriaDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    Page<CustomerSearchResponse> findAll(CustomerSearchCriteriaDTO criteriaDTO, Pageable pageable);
    ResponseDTO listStaffs(Long customerId);

    CustomerDTO findById(Long id);

    void deleteCustomersByIds(List<Long> ids);

    CustomerEntity addOrUpdateCustomer(CustomerDTO customerDTO);

}
