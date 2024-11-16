package com.javaweb.converter;

import com.javaweb.config.ModelMapperConfig;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingSearchResponseConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity item){
        BuildingSearchResponse building = modelMapper.map(item,BuildingSearchResponse.class);
        building.setAddress(item.getStreet()+","+item.getWard()+","+ District.valueOf(item.getDistrict()).getDistrictName());
        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
        String strRentArea = rentAreas.stream()
                .map(RentAreaEntity::getValue) //value is Long
                .map(String :: valueOf)
                .collect(Collectors.joining(" , "));
        building.setRentArea(strRentArea);
        return building;
    }

}
