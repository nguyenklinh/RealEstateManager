package com.javaweb.converter;

import com.javaweb.model.dto.BuildingSearchCriteriaDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.utils.BuildingSearchCriteriaUtil;

public class BuildingSearchBuilderConverter {
    public static BuildingSearchBuilder converterToEntity(BuildingSearchCriteriaDTO dto){
        return new BuildingSearchBuilder.Builder()
                .setName(BuildingSearchCriteriaUtil.checkEmpty(dto.getName()))
                .setFloorArea(BuildingSearchCriteriaUtil.checkEmpty(dto.getFloorArea()))
                .setDistrictCode(BuildingSearchCriteriaUtil.checkEmpty(dto.getDistrict()))
                .setWard(BuildingSearchCriteriaUtil.checkEmpty(dto.getWard()))
                .setStreet(BuildingSearchCriteriaUtil.checkEmpty(dto.getStreet()))
                .setNumberOfBasement(BuildingSearchCriteriaUtil.checkEmpty(dto.getNumberOfBasement()))
                .setDirection(BuildingSearchCriteriaUtil.checkEmpty(dto.getDirection()))
                .setLevel(BuildingSearchCriteriaUtil.checkEmpty(dto.getLevel()))
                .setAreaFrom(BuildingSearchCriteriaUtil.checkEmpty(dto.getAreaFrom()))
                .setAreaTo(BuildingSearchCriteriaUtil.checkEmpty(dto.getAreaTo()))
                .setPriceFrom(BuildingSearchCriteriaUtil.checkEmpty(dto.getPriceFrom()))
                .setPriceTo(BuildingSearchCriteriaUtil.checkEmpty(dto.getPriceTo()))
                .setManagerName(BuildingSearchCriteriaUtil.checkEmpty(dto.getManagerName()))
                .setManagerPhone(BuildingSearchCriteriaUtil.checkEmpty(dto.getManagerPhoneNumber()))
                .setStaffId(BuildingSearchCriteriaUtil.checkEmpty(dto.getStaffId()))
                .setTypeCode(dto.getTypeCode())
                .build();
    }
}
