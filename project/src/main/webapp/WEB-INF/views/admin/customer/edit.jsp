<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/24/2024
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>thêm khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    thêm khách hàng
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class= "row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="customerEdit" id="listForm" method="GET">
                    <div class="col-xs-12">
                        <form action="" class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-xs-3">Tên khách hàng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="name" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Số điện thoại</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="customerPhone" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Email</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="email" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tên công ty</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="companyName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">nhu cầu</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="demand"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tình trạng</label>
                                <div class="col-xs-9">
                                    <form:select class="form-control" path="status">
                                        <form:option value="">---Chọn Tình Trạng---</form:option>
                                        <form:options items="${status}"></form:options>
                                    </form:select>
                                </div>


                            </div>
                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">

                                    <c:if test="${not empty customerEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật khách hàng</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>

                                    <c:if test="${empty customerEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm mới khách hàng</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                    <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                                </div>
                            </div>

                            <form:hidden path="id" id="customerId"/>
                        </form>
                    </div>
                </form:form>

            </div>


        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $('#btnAddOrUpdateCustomer').click(function () {
        var data = new FormData($('#listForm')[0]); // Gửi toàn bộ form, bao gồm cả hình ảnh
        //Thêm dữ liệu của các trường không phải là file
        var formData = $('#listForm').serializeArray();

        addOrUpdateBuilding(data);
    });


    function addOrUpdateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "/api/customer",
            data: data,
            contentType: false,  // Không cần content-type, vì là FormData
            processData: false,  // Không xử lý dữ liệu
            success: function (response) {
                window.location.href = "<c:url value = '/admin/customer-list?message=success'/>";
                alert("Thêm tòa nhà thành công!!!");
            },
            error: function (response) {
                console.log("failed");
                window.location.href = "<c:url value = '/admin/customer-edit?message=error'/>";
            }
        });
    }

    $('#btnCancel').click(function (){
        window.location.href= "/admin/building-list";
    });
</script>
</body>
</html>
