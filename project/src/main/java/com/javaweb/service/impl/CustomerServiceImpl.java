package com.javaweb.service.impl;

import com.javaweb.converter.CustomerSearchResponseConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.CustomerSearchCriteriaDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private CustomerSearchResponseConverter customerSearchResponseConverter;
    @Autowired
    private UserRepository userRepository;
    @Override
    public Page<CustomerSearchResponse> findAll(CustomerSearchCriteriaDTO criteriaDTO, Pageable pageable) {
        Page<CustomerEntity> customerEntityPage = customerRepository.findAll(criteriaDTO, pageable);
        List<CustomerSearchResponse> responseList = customerEntityPage.getContent().stream()
                .map(customerSearchResponseConverter::toCustomerSearchResponse)
                .collect(Collectors.toList());
        return new PageImpl<>(responseList, pageable, customerEntityPage.getTotalElements());
    }

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = userRepository.findByCustomerEntitiesId(customerId);
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity it: staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("succsess");
        return responseDTO;
    }
}
