//package com.javaweb.repository;
//
//import com.javaweb.entity.AssignmentBuildingEntity;
//import com.javaweb.entity.UserEntity;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//
//import java.util.List;
//
//public interface AssignmentBuildingRepository extends JpaRepository<AssignmentBuildingEntity,Long> {
//    @Query("SELECT ab.userEntity FROM AssignmentBuildingEntity ab WHERE ab.buildingEntity.id = :buildingId")
//    List<UserEntity> findUsersByBuildingId(@Param("buildingId") Long buildingId);
//
//
//    void deleteByBuildingEntity_Id(Long buildingId);
//}
