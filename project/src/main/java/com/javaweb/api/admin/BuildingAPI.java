package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private AssignmentBuildingService assignmentBuildingService;
    @PostMapping
    public BuildingEntity addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        System.out.println("ok");
        return buildingService.addBuilding(buildingDTO);
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
