package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    @Autowired
    private AssignmentBuildingService assignmentBuildingService;
    @Value("${file.upload-dir}")
    private String uploadDir;
    @PostMapping
    public ResponseEntity<BuildingEntity> addOrUpdateBuilding(
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
            return ResponseEntity.ok(savedBuilding);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    @DeleteMapping
    @ResponseStatus(HttpStatus.NO_CONTENT) // Trả về mã 204 khi xóa thành công
    public void deleteBuilding(@RequestBody List<Long> ids){
    //xuong db xoa theo iD
        buildingService.deleteBuildings(ids);
        System.out.println("ok");
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }
    @PostMapping("assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        assignmentBuildingService.updateAssignmentBuildingSv(assignmentBuildingDTO);
        System.out.println("okmen");
    }
}
