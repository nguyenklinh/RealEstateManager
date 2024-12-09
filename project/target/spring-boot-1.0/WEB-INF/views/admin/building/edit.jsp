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
                <form:form modelAttribute="buildingEdit" id="listForm" method="post" enctype="multipart/form-data">
                    <div class="col-xs-12 ">
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

                            <!-- Bắt đầu: Mục ảnh minh họa -->
                            <div class="form-group">
                                <label  class="col-xs-3">ảnh minh họa</label>
                                <input class="col-sm-3 no-padding-right" type="file" id="avatarFile" name="avatarFile" accept=".png, .jpg, .jpeg"/>
                            </div>

                            <div class="form-group">
                                <label  class="col-xs-3"></label>
                                <img title="avatar preview" class="col-xs-5"  alt="avatar preview"
                                id="avatarPreview"/>
                            </div>

                            <!-- Kết thúc: Mục ảnh minh họa -->
                            <c:if test="${not empty buildingEdit.avatar}">
                                <div class="form-group">
                                    <label class="col-xs-3">Ảnh hiện tại</label>
                                    <div class="col-xs-5">
                                        <img class="col-xs-12" src="${buildingEdit.avatar}" alt="Current Avatar">
                                    </div>
                                </div>
                            </c:if>



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
                    </div>
                </form:form>

            </div>


        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        avatarFile.change(function (e){
            const imgURL = URL.createObjectURL(e.target.files[0]);
            $("#avatarPreview").attr("src",imgURL);
            $("#avatarPreview").css({"display":"block"})
        })
    })
</script>

<script>
    $(document).ready(function () {
        $('#buildingImage').on('change', function () {
            const file = this.files[0];
            if (file) {
                const url = URL.createObjectURL(file); // Tạo đường dẫn tạm thời
                $('#preview').attr('src', url).show(); // Gắn đường dẫn vào ảnh và hiển thị
            } else {
                $('#preview').hide(); // Ẩn ảnh nếu không có file
            }
        });
    });
</script>
<script>
    $('#btnAddOrUpdateBuilding').click(function () {
        var data = new FormData($('#listForm')[0]); // Gửi toàn bộ form, bao gồm cả hình ảnh
        var typeCode = [];

        //Thêm dữ liệu của các trường không phải là file
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name != 'typeCode') {
                // data.append(v.name, v.value); // Append các field khác
                console.log("hehe");
            } else {
                typeCode.push(v.value); // Thêm dữ liệu của trường typeCode
            }
        });

        // Thêm dữ liệu của typeCode vào formData
        // data.append('typeCode', typeCode);

        if (typeCode.length !== 0) {
            $('#loading_image').show();  // Hiển thị loading
            addOrUpdateBuilding(data);   // Gọi hàm gửi dữ liệu
        } else {
            window.location.href = "<c:url value = '/admin/building-list?typeCode=require'/>";
        }
    });


    function addOrUpdateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "/api/building",
            data: data,
            contentType: false,  // Không cần content-type, vì là FormData
            processData: false,  // Không xử lý dữ liệu
            success: function (response) {
                window.location.href = "<c:url value = '/admin/building-list?message=success'/>";
                alert("Thêm tòa nhà thành công!!!");
            },
            error: function (response) {
                console.log("failed");
                window.location.href = "<c:url value = '/admin/building-edit?message=error'/>";
            }
        });
    }

    $('#btnCancel').click(function (){
        window.location.href= "/admin/building-list";
    });
</script>
</body>
</html>
