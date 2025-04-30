package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BuildingRepository extends JpaRepository<BuildingEntity,Long>, BuildingRepositoryCustom {
    Page<BuildingEntity> findAll(Pageable page);
    void deleteByIdIn(List<Long> ids);
    @Query("SELECT b FROM BuildingEntity b WHERE " +
            "(:district IS NULL OR b.district LIKE %:district%) AND " +
            "(:name IS NULL OR b.name LIKE %:name%)")
    Page<BuildingEntity> getAllBuildings(@Param("district") String district,
                                         @Param("name") String name,
                                         Pageable pageable);
}
