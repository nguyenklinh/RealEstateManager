package com.javaweb.api.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.ErrorCode;
import com.javaweb.exception.MyException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ApiResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @Value("${file.upload-dir}")
    private String uploadDir;
    @PostMapping
    public ResponseEntity<?> addOrUpdateBuilding(@Valid
            @ModelAttribute BuildingDTO buildingDTO,
            @RequestParam("avatarFile") MultipartFile avatarFile) {
        try {
            // Lưu file ảnh
            if (!avatarFile.isEmpty()) {
                String fileName = avatarFile.getOriginalFilename();//get fileName
                Path filePath = Paths.get(uploadDir, fileName);
                Files.createDirectories(filePath.getParent());//tao thu muc filepath neu chua ton tai
                avatarFile.transferTo(filePath.toFile());

                // Lưu đường dẫn file vào DTO
                buildingDTO.setAvatar("/img/" + fileName);
            }
            // Lưu thông tin building
            BuildingEntity savedBuilding = buildingService.addBuilding(buildingDTO);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .message(SystemConstant.UPDATE_SUCCESS)
                    .result(savedBuilding)
                    .build());
        } catch (IOException e) {
            throw new MyException(ErrorCode.ADD_OR_UPDATE_BUILDING_FAIL);
        }
    }


    @DeleteMapping
    public ResponseEntity<?> deleteBuilding(@RequestBody List<Long> ids){
        try {
            buildingService.deleteBuildings(ids);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .message(SystemConstant.DELETE_SUCCESS)
                    .build());
        }catch (Exception e){
            throw new MyException(ErrorCode.DELETE_BUILDING_FAIL);
        }
    }
    @GetMapping("/{id}/staffs")
    public ResponseEntity<?> loadStaffs(@PathVariable Long id){
            ResponseDTO result = buildingService.listStaffs(id);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .message(SystemConstant.LOAD_SUCCESS)
                    .result(result)
                    .build());

    }
    @PostMapping("assignment")
    public ResponseEntity<?> updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        try {
            buildingService.addAssignmentBuilding(assignmentBuildingDTO);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .message(SystemConstant.UPDATE_SUCCESS)
                    .build());
        }catch (Exception e){
            throw new MyException(ErrorCode.ASSIGNMENT_UPDATE_FAIL);
        }
    }
}
