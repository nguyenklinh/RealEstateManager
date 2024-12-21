package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerSearchCriteriaDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerRepositoryCustom {
    Page<CustomerEntity> findAll (CustomerSearchCriteriaDTO criteriaDTO, Pageable pageable);
}
