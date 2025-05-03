<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/3/2025
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết dự án - <c:out value="${building.name}"/></title>
</head>
<body>
<div class="page-wrapper">
    <div class="intro text-center mb-5">
        <div class="title-page">Chi tiết</div>
        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="desc-intro">
                    <li class="home">
                        <a href="./ViewHome.html"><span style="color:#fff">Trang chủ</span></a>
                        <span class="mx-1" style="color:#fff"> / </span>
                    </li>
                    <li class="intro-item"><span>Chi tiết</span></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container building-detail">
        <h1 class="text-center mb-4"><c:out value="${building.name}"/></h1>
        <div class="row">
            <div class="col-md-6">
                <img src="<c:out value='${building.avatar}'/>" alt="Hình ảnh dự án" class="building-image"/>
            </div>
            <div class="col-md-6">
                <div class="building-info">
                    <h2>Thông tin chi tiết</h2>
                    <p><i class="fa fa-location-dot"></i> Địa chỉ: <c:out value="${districts[building.district]}"/></p>
                    <p><i class="fa fa-building"></i> Loại BĐS: <c:out value="${building.typeCode}"/></p>
                    <p><i class="fa fa-globe"></i> Diện tích: <c:out value="${building.floorArea}"/></p>
                    <p><i class="fa fa-dollar"></i> Giá thuê: <c:out value="${building.rentPrice}"/></p>
                    <p><i class="fa fa-dollar"></i> mô tả giá: <c:out value="${building.rentPriceDescription}"/></p>
                    <p><i class="fa fa-info-circle"></i> Mô tả: <c:out value="${building.note}"/></p>
                </div>
            </div>
        </div>
        <div class="map">
            <div class="container">
                <h3 class="mt-4 mb-3">Vị trí trên Google Maps</h3>
                <div class="row">
                    <div class="col-12">
                        <div class="google-map margin-bottom-30">
                            <div class="maps_iframe">
                                <c:choose>
                                    <c:when test="${not empty building.mapEmbedUrl}">
                                        <iframe
                                                src="<c:out value='${building.mapEmbedUrl}'/>"
                                                width="100%"
                                                height="450"
                                                style="border:0;"
                                                allowfullscreen=""
                                                loading="lazy"
                                                referrerpolicy="no-referrer-when-downgrade">
                                        </iframe>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-muted">Chưa có thông tin bản đồ cho dự án này.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
