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
    <title>danh sách khách hàng</title>
</head>
<body>
<div class="main-content" id="main-container">

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
                        danh sách khách hàng
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class= "row">
                    <div class="col-xs-12 ">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">
                                    <div class="widget-menu">

                                    </div>


                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                                <div class="widget-main" id="listForm">
                                    <form:form id="ListForm" modelAttribute="modelSearch" action="/admin/customer-list" method="get">
                                        <div class = "row">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label class="name">tên Khách hàng </label>
                                                        <form:input class="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">email </label>
                                                        <form:input class="form-control" path="email"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">số điện thoại</label>
                                                        <form:input class="form-control" path="customerPhone"/>
                                                    </div>
                                                    <security:authorize access="hasRole('MANAGER')">
                                                    <div class="col-xs-3">
                                                        <label class="name">nhân viên quản lý</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">-----Bỏ chọn-----</form:option>
                                                            <form:options items="${listStaffs}"/>
                                                        </form:select>
                                                    </div>
                                                    </security:authorize>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-danger" id="btnSearchCustomer">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                            </svg>
                                                            tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                        <security:authorize access="hasRole('MANAGER')">
                        <div class="pull-right">
                            <a href='/admin/customer-edit'>
                                <button class="btn btn-info" title="thêm khách hàng"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg></button>
                            </a>

                            <button class="btn btn-danger" title="xóa khách hàng" id="btnDeleteCustomer"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg></button>
                        </div>
                        </security:authorize>
                    </div>
                </div>

                <div> <!--tabel danh  -->
                    <div class="row">
                        <div class="col-xs-12">
                            <table id="tableList" style="margin: 3em 0 1.5em 0;" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace">
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th>Tên khách hàng</th>
                                    <th>số điện thoại</th>
                                    <th>email</th>
                                    <th>nhu cầu</th>
                                    <th>người thêm</th>
                                    <th>ngày thêm</th>
                                    <th>tình trạng</th>
                                    <th>thao tác</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${customerList}">
                                    <tr>
                                        <td class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                        <td>${item.fullName}</td>
                                        <td>${item.phone}</td>
                                        <td>${item.email}</td>
                                        <td>${item.demand}</td>
                                        <td>${item.createdBy}</td>
                                        <td>${item.createdDate}</td>
                                        <td>${item.status}</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="giao khách hàng" onclick="assingmentCustomer(${item.id})">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>

                                                <a class="btn btn-xs btn-info" title="sửa khach hang" href="/admin/building-edit-${item.id}">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </a>

                                                <button class="btn btn-xs btn-danger" title="xóa khach hang" onclick="deleteBuilding(${item.id})">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>


                                            </div>

                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <!-- Previous Button -->
                                    <li class="page-item ${currentPage == 1 ? 'hidden' : ''}">
                                        <a class="page-link" href="#" onclick="navigateToPage(${currentPage - 1})" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>

                                    <!-- Page Numbers -->
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                            <a class="page-link" href="#" onclick="navigateToPage(${i})">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <!-- Next Button -->
                                    <li class="page-item ${currentPage == totalPages ? 'hidden' : ''}">
                                        <a class="page-link" href="#" onclick="navigateToPage(${currentPage + 1})" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<div class="modal fade" id="assingmentCustomerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="font-family: 'Times New Roman', Times, serif;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">danh sách nhân viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="staffList" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" id="customerId" name="customer" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="btnassingmentCustomer">giao nhân viên</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">đóng</button>
            </div>
        </div>
    </div>
</div>

<script>
    function navigateToPage(page) {
        // Lấy các tham số hiện tại từ URL
        const params = new URLSearchParams(window.location.search);

        // Cập nhật hoặc thêm tham số page
        params.set("page", page);

        // Tạo URL mới với tham số page
        window.location.href = window.location.pathname + "?" + params.toString();
    }

    $('#btnSearchCustomer').click(function (e){
        e.preventDefault();
        $('#ListForm').submit();
    });

    function assingmentCustomer(customerId){
        // Đặt giá trị buildingId trước khi mở modal
        $('#customerId').val(customerId);

        // Mở modal và đảm bảo focus vào modal
        $('#assingmentCustomerModal').modal({
            backdrop: 'static', // Ngăn không cho đóng modal khi click ra ngoài
            keyboard: true      // Cho phép đóng bằng phím ESC
        }).on('shown.bs.modal', function () {
            // Focus vào nút hoặc phần tử đầu tiên bên trong modal
            $('#btnassingmentCustomer').focus();
        });
        loadStaff(customerId);
    }


    function loadStaff(customerId){
        $.ajax({
            type:"GET",
            url:"/api/customer/"+customerId +"/staffs",
            contentType:"application/json",
            dataType:"JSON",
            success:function(response){
                var row='';
                $.each(response.data,function (index,item){
                    row+= '<tr>';
                    row+= '<td class="center"> <input type="checkbox" value='+item.staffId +' '+ item.checked  +'/></td>';
                    row+= '<td>'+item.fullName +'</td>';
                    row+= '</tr>';
                });
                $('#staffList tbody').html(row);
                console.log("success");
            },
            error: function(response){
                console.log("erro");
                console.log(response);
            }
        });
    }


</script>

</body>
</html>
