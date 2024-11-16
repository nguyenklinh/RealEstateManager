package com.javaweb.service;

import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);

    List<BuildingSearchResponse> findAll(BuildingSearchBuilder buildingSearchBuilder);


    BuildingEntity addBuilding(BuildingDTO buildingDTO);
    void deleteBuildings(List<Long> ids);
    BuildingDTO findById(Long id);
}
