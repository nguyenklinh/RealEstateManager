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
    <title>thêm tòa nhà</title>
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
                    sửa tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class= "row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="buildingEdit" id="listForm" method="get">
                    <div class="col-xs-12 ">
                        <form class="form-horizontal" role="form" id="form-edit">
                            <div class="form-group">
                                <label class="col-xs-3">tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="name"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">quận</label>
                                <div class="col-xs-3">
                                    <form:select class="form-control" path="district">
                                        <form:option value="">-----chọn quận-----</form:option>
                                        <form:options items="${districts}"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">phường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="ward"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">đường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="street"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">kết cấu</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="structure"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">số tầng hầm</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="numberOfBasement"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">diện tích sàn</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="floorArea"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">hướng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="direction"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">hạng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="level"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">diện tích thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentArea"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">giá  thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentPrice"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">mô tả giá</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentPriceDescription"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">phí dịch vụ</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="serviceFee"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">phí ô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="carFee"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">phí mô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="motoFee"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">phí ngoài giờ</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="overtimeFee"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">tiền nước</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="waterFee"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">tiền điện</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="electricityFee"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">đặt cọc</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="deposit"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">thanh toán</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="payment"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">thời hạn thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentTime"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">thời gian trang trí</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="decorationTime"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">tên quả lý</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="managerName"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">SĐT quản lý</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="managerPhone"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">phí môi giới</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="brokerageFee"></form:input>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-xs-3">loại tòa nhà</label>
                                <div class="col-xs-6">
                                    <form:checkboxes  path="typeCode" items="${typecodes}" cssStyle="margin-left: 15px; display: inline-block;"></form:checkboxes>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3">ghi chú</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="note"></form:input>
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <label for="" class="col-xs-3">tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="name" name="name">
                                </div>
                            </div> -->

                            <div class="col-xs-12">
                                <div class="col-xs-3"></div>
                                <div>
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button type="button" class="btn btn-danger" id="btnAddOrUpdateBuilding">
                                            cập nhật tòa nhà
                                        </button>
                                        <button type="button" class="btn btn-danger" id="btnCancel">
                                            hủy thao tác
                                        </button>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button type="button" class="btn btn-danger" id="btnAddOrUpdateBuilding">
                                            thêm tòa nhà
                                        </button>
                                        <button type="button" class="btn btn-danger" id="btnCancel">
                                            hủy thao tác
                                        </button>
                                    </c:if>

                                </div>
                            </div>
                            <form:hidden path="id" id="buildingId"></form:hidden>
                        </form>
                    </div>
                </form:form>

            </div>


        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data= {};
        var typeCode = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function(i,v){
            if(v.name != 'typeCode'){
                data[""+v.name+""]= v.value;
            }else{
                typeCode.push(v.value);
            }
        });
        data["typeCode"] = typeCode;
        if(typeCode != ""){
            addOrUpdateBuilding(data);
        }else {
        window.location.href = "${pageContext.request.contextPath}/admin/building-edit?typeCode=require";
    }
        //call api

    });

    function addOrUpdateBuilding(data){
        $.ajax({
            type:"POST",
            url:"/api/building",
            data:JSON.stringify(data),
            contentType:"application/json",
            dataType:"JSON",
            success:function(respond){
                console.log("success");
            },
            error: function(respond){
                console.log("erro");
                console.log(respond);
            }
        });
    }

    $('#btnCancel').click(function (){
        window.location.href= "/admin/building-list";
    });
</script>
</body>
</html>
