package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerSearchCriteriaDTO;
import com.javaweb.model.request.BuildingSearchBuilder;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.SqlConditionBuilder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Page<CustomerEntity> findAll(CustomerSearchCriteriaDTO criteriaDTO, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT DISTINCT c.* FROM customer c");
        joinTable(criteriaDTO,sql);
        sql.append(" where 1 = 1 ");
        generateQueryConditions(criteriaDTO,sql);
        // Tính tổng số bản ghi phù hợp
        String countSql = "SELECT COUNT(*) FROM (" + sql.toString() + ") AS countQuery";
        Query countQuery = entityManager.createNativeQuery(countSql);
        Long totalRecords = ((Number) countQuery.getSingleResult()).longValue();

        // Áp dụng phân trang
        sql.append(" LIMIT ").append(pageable.getPageSize())
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        List<CustomerEntity> customerEntities = query.getResultList();

        // Tạo Page object
        return new PageImpl<>(customerEntities, pageable, totalRecords);
    }
    public static void joinTable(CustomerSearchCriteriaDTO criteriaDTO, StringBuilder sql){
        if(criteriaDTO.getStaffId() != null){
            sql.append(" left join assignmentcustomer ON c.id = assignmentcustomer.customerid ");
        }
    }
    public static void generateQueryConditions(CustomerSearchCriteriaDTO criteriaDTO, StringBuilder sql){
        Map<String, Object> conditions = new HashMap<>();
        conditions.put("c.fullname",criteriaDTO.getName());
        conditions.put("c.email",criteriaDTO.getEmail());
        conditions.put("c.phone",criteriaDTO.getCustomerPhone());
        conditions.put("assignmentcustomer.staffid",criteriaDTO.getStaffId());


        conditions.forEach((column, value)->{
            if (value != null){
                sql.append(SqlConditionBuilder.buildCondition(column,value));
            }
        });
    }
}
