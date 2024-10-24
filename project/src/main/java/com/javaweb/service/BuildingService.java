package com.javaweb.service;

import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);

    List<BuildingSearchResponse> findAll(BuildingSearchBuilder buildingSearchBuilder);
}
