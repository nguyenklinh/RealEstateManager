package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = assignmentBuildingRepository.findUsersByBuildingId(buildingId);
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

    @Override
    public Page<BuildingSearchResponse> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable) {
        Page<BuildingEntity> buildingEntitiesPage = buildingRepository.findAllBuilding(buildingSearchBuilder, pageable);
        List<BuildingSearchResponse> responseList = buildingEntitiesPage.getContent().stream()
                .map(buildingSearchResponseConverter::toBuildingSearchResponse)
                .collect(Collectors.toList());
        return new PageImpl<>(responseList, pageable, buildingEntitiesPage.getTotalElements());
    }

    @Override
    @Transactional
    public BuildingEntity addBuilding(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);

        BuildingEntity saveBuildingEntity = buildingRepository.save(buildingEntity);

        if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().isEmpty()) {
            String[] rentAreas = buildingDTO.getRentArea().split(",");
            rentAreaRepository.deleteByBuildingEntity_Id(buildingDTO.getId());
            for (String rentArea : rentAreas) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Long.parseLong(rentArea.trim()));
                rentAreaEntity.setBuildingEntity(saveBuildingEntity);
                rentAreaRepository.save(rentAreaEntity);
            }
        }
        System.out.println("ok");
        return saveBuildingEntity;
    }

    @Override
    @Transactional
    public void deleteBuildings(List<Long> ids) {
        for (Long buildingId : ids){
            assignmentBuildingRepository.deleteByBuildingEntity_Id(buildingId);
            rentAreaRepository.deleteByBuildingEntity_Id(buildingId);
            buildingRepository.deleteById(buildingId);
        }
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO= buildingConverter.toBuildingDTO(buildingEntity);
        return buildingDTO;
    }

}
