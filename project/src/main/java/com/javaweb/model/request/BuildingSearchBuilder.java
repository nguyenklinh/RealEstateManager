package com.javaweb.model.request;

import java.util.List;

public class BuildingSearchBuilder {
    private String name;
    private Integer floorArea;
    private String districtCode;
    private String ward;
    private String street;
    private Integer numberOfBasement;
    private String direction;
    private String level;
    private Double areaFrom;
    private Double areaTo;
    private Double priceFrom;
    private Double priceTo;
    private String managerName;
    private String managerPhone;
    private List<String> typeCode;
    private Long staffId;

    public String getName() {
        return name;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public String getWard() {
        return ward;
    }

    public String getStreet() {
        return street;
    }

    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }

    public String getDirection() {
        return direction;
    }

    public String getLevel() {
        return level;
    }

    public Double getAreaFrom() {
        return areaFrom;
    }

    public Double getAreaTo() {
        return areaTo;
    }

    public Double getPriceFrom() {
        return priceFrom;
    }

    public Double getPriceTo() {
        return priceTo;
    }

    public String getManagerName() {
        return managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public List<String> getTypeCode() {
        return typeCode;
    }

    public Long getStaffId() {
        return staffId;
    }

    private BuildingSearchBuilder(Builder builder) {
        this.name=builder.name;
        this.floorArea = builder.floorArea;
        this.districtCode = builder.districtCode;
        this.ward = builder.ward;
        this.street = builder.street;
        this.numberOfBasement = builder.numberOfBasement;
        this.direction = builder.direction;
        this.level = builder.level;
        this.areaFrom = builder.areaFrom;
        this.areaTo = builder.areaTo;
        this.priceFrom = builder.priceFrom;
        this.priceTo = builder.priceTo;
        this.managerName = builder.managerName;
        this.managerPhone = builder.managerPhone;
        this.typeCode = builder.typeCode;
        this.staffId = builder.staffId;
    }

    public static class Builder {
        private String name;
        private Integer floorArea;
        private String districtCode;
        private String ward;
        private String street;
        private Integer numberOfBasement;
        private String direction;
        private String level;
        private Double areaFrom;
        private Double areaTo;
        private Double priceFrom;
        private Double priceTo;
        private String managerName;
        private String managerPhone;
        private List<String> typeCode;
        private Long staffId;

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setFloorArea(Integer floorArea) {
            this.floorArea = floorArea;
            return this;
        }

        public Builder setDistrictCode(String districtCode) {
            this.districtCode = districtCode;
            return this;
        }

        public Builder setWard(String ward) {
            this.ward = ward;
            return this;
        }

        public Builder setStreet(String street) {
            this.street = street;
            return this;
        }

        public Builder setNumberOfBasement(Integer numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }

        public Builder setDirection(String direction) {
            this.direction = direction;
            return this;
        }

        public Builder setLevel(String level) {
            this.level = level;
            return this;
        }

        public Builder setAreaFrom(Double areaFrom) {
            this.areaFrom = areaFrom;
            return this;
        }

        public Builder setAreaTo(Double areaTo) {
            this.areaTo = areaTo;
            return this;
        }

        public Builder setPriceFrom(Double priceFrom) {
            this.priceFrom = priceFrom;
            return this;
        }

        public Builder setPriceTo(Double priceTo) {
            this.priceTo = priceTo;
            return this;
        }

        public Builder setManagerName(String managerName) {
            this.managerName = managerName;
            return this;
        }

        public Builder setManagerPhone(String managerPhone) {
            this.managerPhone = managerPhone;
            return this;
        }

        public Builder setTypeCode(List<String> typeCode) {
            this.typeCode = typeCode;
            return this;
        }

        public Builder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public BuildingSearchBuilder build() {
            return new BuildingSearchBuilder(this);
        }
    }

}
