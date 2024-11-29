package com.javaweb.service;

import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);

    Page<BuildingSearchResponse> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable);

    BuildingEntity addBuilding(BuildingDTO buildingDTO);
    void deleteBuildings(List<Long> ids);
    BuildingDTO findById(Long id);
}

