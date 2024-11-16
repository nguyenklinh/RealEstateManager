package com.javaweb.utils;

import java.util.List;
import java.util.stream.Collectors;

public class SqlConditionBuilder {
    public static String buildCondition(String column, Object value){
        if(value == null ){
            return "";
        }
        // Trường hợp value là một danh sách
        if (value instanceof List) {
            List<String> values = (List<String>) value;
            if(values.size() == 0){return "";}
            StringBuilder condition = new StringBuilder();
            for (String val : values) {
                if (condition.length() > 0) {
                    condition.append(" AND ");
                }
                condition.append(column).append(" LIKE '%").append(val).append("%'");
            }
            return " AND " + condition.toString() + " ";
        }
        if (value instanceof String){
            return " AND " + column + " LIKE '%" + value + "%'" ;
        }
        return " AND " + column + "=" + value;
    }


}
