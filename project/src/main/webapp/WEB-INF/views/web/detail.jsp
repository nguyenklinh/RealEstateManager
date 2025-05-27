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
            <div class="col-md-6 mb-4">
                <div class="project-image-wrapper">
                    <img src="<c:out value='${not empty building.avatar ? building.avatar : "/images/default.jpg"}'/>" alt="Hình ảnh dự án" class="project-image"/>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="building-info card">
                    <div class="card-body">
                        <h2 class="card-title">Thông tin chi tiết</h2>
                        <ul class="info-list list-unstyled">
                            <li class="info-item">
                                <i class="fa fa-location-dot me-2"></i>
                                <span><strong>Địa chỉ:</strong> <c:out value="${districts[building.district]}"/></span>
                            </li>
                            <li class="info-item">
                                <i class="fa fa-building me-2"></i>
                                <span><strong>Loại BĐS:</strong> <c:out value="${building.typeCode}"/></span>
                            </li>
                            <li class="info-item">
                                <i class="fa fa-globe me-2"></i>
                                <span><strong>Diện tích:</strong> <c:out value="${building.floorArea}"/></span>
                            </li>
                            <li class="info-item">
                                <i class="fa fa-dollar me-2"></i>
                                <span><strong>Giá thuê:</strong> <c:out value="${building.rentPrice}"/></span>
                            </li>
                            <li class="info-item">
                                <i class="fa fa-info-circle me-2"></i>
                                <span><strong>Mô tả giá:</strong> <c:out value="${building.rentPriceDescription}"/></span>
                            </li>
                            <li class="info-item">
                                <i class="fa fa-comment me-2"></i>
                                <span><strong>Ghi chú:</strong> <c:out value="${building.note}"/></span>
                            </li>
                        </ul>
                        <!-- Dòng liên hệ -->
                        <div class="contact-callout mt-3">
                            <p class="mb-0">
                                <strong>Bạn muốn mua ngay?</strong>
                                <a href="/lien-he" class="btn btn-primary btn-sm ms-2">Liên hệ</a>
                            </p>
                        </div>
                    </div>
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
    <footer class="footer">
        <div class="container-fluid">
            <div class="top-footer text-center mt-0">
                <div class="logo logo-footer pt-5">
                    <a href="./trang-chu"><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo_footer.png?1676257083798"
                                               alt="logo-footer"></a>
                    <p class="desc-logo-footer mt-3">Với hơn 100 năm kinh nghiệm, SkyLand tự hào là sàn
                        mua
                        bán, giao dịch và quảng cáo
                        bất động sản hàng đầu tại Việt Nam</p>
                    <div class="item-footer mt-5">
                        <div class="row">
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_maps.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Trụ sở chính</p>
                                    <p class="desc-footer">Số 30 Yên Nghĩa, Hà Đông, TP Hà Nội</p>
                                </div>
                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_phone.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Hotline</p>
                                    <p class="desc-footer"><a class="a-text" href="/lien-he">0984765423</a></p>
                                </div>
                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_email.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Email</p>
                                    <p class="desc-footer"><a class="a-text" href="/lien-he">nkl@gmail.com</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <div class="border-bottom mb-5 mt-4"></div>
                </div>
            </div>
            <div class="bottom-footer container">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Thông tin công ty</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Chính sách hoạt động</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Hỗ trợ khách hàng</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Kết nối với chúng tôi</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer-2">
            <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Happy Team |
                Cung cấp bởi <a class="a-text group-name" href="#">HappyTeam</a></div>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
