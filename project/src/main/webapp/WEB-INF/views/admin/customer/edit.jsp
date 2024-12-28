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
                                    <form:input class="form-control" path="fullName" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Số điện thoại</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="phone" />
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

<%--                            <div class="form-group">--%>
<%--                                <label class="col-xs-3">Tình trạng</label>--%>
<%--                                <div class="col-xs-9">--%>
<%--                                    <form:select class="form-control" path="status">--%>
<%--                                        <form:option value="">---Chọn Tình Trạng---</form:option>--%>
<%--                                        <form:options items="${status}"></form:options>--%>
<%--                                    </form:select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
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
            <c:if test="${not empty customerEdit.id}">
                <div> <!--tabel danh  -->
                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="header smaller lighter blue">chăm sóc khách hàng</h3>
                            <table id="tableList" style="margin: 3em 0 1.5em 0;" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th colspan="9" class="text-left">
                                        <button class="btn btn-primary" onclick="addTransaction()">thêm dịch vụ</button>
                                        <button class="btn btn-primary" onclick="updateTransaction()">cập nhật dịch vụ</button>
                                    </th>
                                </tr>
                                <tr>
                                    <th class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace">
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th>Tên dịch vụ</th>
                                    <th>người thêm</th>
                                    <th>ngày thêm</th>
                                    <th>tình trạng</th>
                                    <th>thao tác</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${transaction}">
                                    <tr>
                                        <td class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                        <td>${item.note}</td>
                                        <td>${item.createdBy}</td>
                                        <td>${item.createdDate}</td>
                                        <td>
                                            <select class="form-control">
                                                <option value="">---Chọn Tình Trạng---</option>
                                                <c:forEach var="entry" items="${status}">
                                                    <option value="${entry.key}" ${entry.key == item.status ? 'selected' : ''}>${entry.value}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="giao khách hàng" onclick="assingmentCustomer(${item.id})">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </div>
                                            <button class="btn btn-xs btn-danger" title="xóa tòa nhà" onclick="deleteTransaction(${item.id})">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="transactionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="font-family: 'Times New Roman', Times, serif;" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">thêm công việc</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="text" id="note" placeholder="thêm thao tác">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" id="btnAddTransaction">xác nhận</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">đóng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $('#btnAddOrUpdateCustomer').click(function () {
        var formData = $('#listForm').serializeArray();
        var customerData = {};
        formData.forEach(function(item) {
            customerData[item.name] = item.value;
        });

        addOrUpdateCustomer(customerData);
    });

    function addTransaction(){
        $('#transactionModal').modal('show');
    }

    $('#btnAddTransaction').click(function (){
        var note = $('#note').val();
        var customerId = $('#customerId').val();
        $.ajax({
            type: "POST",
            url: "/api/transaction",
            data: {
                note: note,
                customerId: customerId
            },
            success: function (response) {
                location.reload();
                alert("Thêm thành công!!!");
            },
            error: function (response) {
                console.log("failed");
                window.location.href = "<c:url value = '/admin/customer-edit?message=error'/>";
            }
        });
    });

    function addOrUpdateCustomer(data) {
        $.ajax({
            type: "POST",
            url: "/api/customer",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.location.href = "<c:url value = '/admin/customer-list?message=success'/>";
                alert("Thêm thành công!!!");
            },
            error: function (response) {
                if (response.status === 400) {
                    const errors = response.responseJSON; // Mảng lỗi từ backend
                    let errorMessage = "Đã xảy ra lỗi:\n";
                    alert(errorMessage);
                } else {
                    console.log("failed");
                    alert("Có lỗi xảy ra, vui lòng thử lại!");
                }
            }
        });
    }
    function deleteTransaction(id){
        $.ajax({
            type: "DELETE",
            url: "/api/transaction/" + id,
            success: function (response) {
                window.location.href = "<c:url value = '/admin/customer-edit-${id}?message=thanhcong'/>";
                alert("Xóa thành công!!!");
            },
            error: function (response) {
                console.log("failed");
                window.location.href = "<c:url value = '/admin/customer-edit-${id}?message=error'/>";
            }
        });
    }
    function submitData() {
        let transactionData = []; // Mảng chứa dữ liệu
        // Duyệt qua từng hàng trong bảng
        $("#tableList tbody tr").each(function () {
            let id = $(this).find("input[name='checkList']").val(); // Lấy giá trị id từ checkbox
            let status = $(this).find("select").val(); // Lấy giá trị được chọn từ select

            // Đưa dữ liệu vào mảng
            transactionData.push({
                id: id,
                status: status,
            });
        });
        return transactionData;
    }
    function updateTransaction() {
        let data = submitData(); // Lấy dữ liệu từ bảng

        $.ajax({
            url: '/api/transaction',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data), // Chuyển dữ liệu thành JSON
            success: function (response) {
                alert("Cập nhật thành công!");
                location.reload();
            },
            error: function (error) {
                console.error("Lỗi: ", error);
                alert("Có lỗi xảy ra!");
            }
        });
    }


    $('#btnCancel').click(function (){
        window.location.href= "/admin/building-list";
    });
</script>
</body>
</html>
