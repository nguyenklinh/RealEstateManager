package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.SqlConditionBuilder;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
@Repository

public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<BuildingEntity> findAllBuilding(BuildingSearchBuilder buildingSearchBuilder) {
        StringBuilder sql = new StringBuilder("SELECT DISTINCT b.* FROM building b");
        joinTable(buildingSearchBuilder,sql);
        sql.append(" where 1 = 1 ");
        generateQueryConditions(buildingSearchBuilder,sql);
        Query query = entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        return query.getResultList();
    }

    public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql){
        if(buildingSearchBuilder.getStaffId() != null){
            sql.append(" left join assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
        }
        if(buildingSearchBuilder.getAreaFrom() != null || buildingSearchBuilder.getAreaTo() != null){
            sql.append(" left join rentarea ON b.id = rentarea.buildingid ");
        }
    }
    public static void generateQueryConditions(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql){
        Map<String, Object> conditions = new HashMap<>();
        conditions.put("b.name",buildingSearchBuilder.getName());
        conditions.put("b.floorarea",buildingSearchBuilder.getFloorArea());
        conditions.put("b.district",buildingSearchBuilder.getDistrictCode());
        conditions.put("b.ward",buildingSearchBuilder.getWard());
        conditions.put("b.street",buildingSearchBuilder.getStreet());
        conditions.put("b.numberofbasement",buildingSearchBuilder.getNumberOfBasement());
        conditions.put("b.direction",buildingSearchBuilder.getDirection());
        conditions.put("b.level",buildingSearchBuilder.getLevel());
        conditions.put("rentarea.value >",buildingSearchBuilder.getAreaFrom());
        conditions.put("rentarea.value <",buildingSearchBuilder.getAreaTo());
        conditions.put("b.rentprice >",buildingSearchBuilder.getPriceFrom());
        conditions.put("b.rentprice <",buildingSearchBuilder.getPriceTo());
        conditions.put("b.managername",buildingSearchBuilder.getManagerName());
        conditions.put("b.managerphone",buildingSearchBuilder.getManagerPhone());
        conditions.put("b.type",buildingSearchBuilder.getTypeCode());
        conditions.put("assignmentbuilding.staffid",buildingSearchBuilder.getStaffId());


        conditions.forEach((column, value)->{
            if (value != null){
                sql.append(SqlConditionBuilder.buildCondition(column,value));
            }
        });
    }
}
