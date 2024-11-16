package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity){
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity,BuildingDTO.class);
        // Chuyển đổi typeCode từ String sang List<String>
        String typeCode = buildingEntity.getTypeCode();
        if (typeCode != null && !typeCode.isEmpty()) {
            List<String> typeCodeList = Arrays.asList(typeCode.split(","));
            buildingDTO.setTypeCode(typeCodeList);
        } else {
            buildingDTO.setTypeCode(null);
        }
        List<RentAreaEntity> rentAreaEntity = buildingEntity.getRentAreaEntities();
        String strRentArea = rentAreaEntity.stream()
                .map(RentAreaEntity::getValue) //value is Long
                .map(String :: valueOf)
                .collect(Collectors.joining(" , "));
        buildingDTO.setRentArea(strRentArea);
        return buildingDTO;
    }
    public  BuildingEntity toBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO,BuildingEntity.class);
        List<String> typeCodeList = buildingDTO.getTypeCode();
        if (typeCodeList != null && !typeCodeList.isEmpty()) {
            String typeCode = String.join(",", typeCodeList);
            buildingEntity.setTypeCode(typeCode);
        } else {
            buildingEntity.setTypeCode(null);
        }
        return buildingEntity;
    }
}
