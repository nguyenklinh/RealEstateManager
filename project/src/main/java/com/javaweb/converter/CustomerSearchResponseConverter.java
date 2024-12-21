package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;
@Component
public class CustomerSearchResponseConverter {
    @Autowired
    private ModelMapper modelMapper;
    public CustomerSearchResponse toCustomerSearchResponse(CustomerEntity item){
        CustomerSearchResponse customerSearchResponse = modelMapper.map(item,CustomerSearchResponse.class);
        return customerSearchResponse;
    }
}
