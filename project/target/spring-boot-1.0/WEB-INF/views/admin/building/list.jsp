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
    <title>danh sách tòa nhà</title>
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
                        danh sách tòa nhà
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
                                    <form:form id="ListForm" modelAttribute="modelSearch" action="/admin/building-list" method="get">
                                        <div class = "row">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <label class="name">tên tòa nhà</label>
                                                        <form:input class="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <label class="name">diện tích sàn</label>
                                                        <form:input class="form-control" path="floorArea"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-2">
                                                        <label class="name">quận</label>
                                                        <form:select class="form-control" path="district">
                                                            <form:option value="">-----chọn quận-----</form:option>
                                                            <form:options items="${districts}"/>
                                                        </form:select>

                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">phường</label>
                                                        <form:input class="form-control" path="ward"/>

                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">đường</label>
                                                        <form:input class="form-control" path="street"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-4">
                                                        <label class="name">số tâng hầm</label>
                                                        <form:input class="form-control" path="numberOfBasement"/>

                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">hướng</label>
                                                        <form:input class="form-control" path="direction"/>

                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">hạng</label>
                                                        <form:input class="form-control" path="level"/>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label class="name">diện tích từ</label>
                                                        <form:input class="form-control" path="areaFrom"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">diện tích đến</label>
                                                        <form:input class="form-control" path="areaTo"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">giá thuê từ</label>
                                                        <form:input class="form-control" path="priceFrom"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">giá thuê đến</label>
                                                        <form:input class="form-control" path="priceTo"/>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-5">
                                                        <label class="name">tên quản lý</label>
                                                        <form:input class="form-control" path="managerName"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">SDT quản lý</label>
                                                        <form:input class="form-control" path="managerPhoneNumber"/>
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <label class="name">nhân viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">-----chọn nhân viên-----</form:option>
                                                            <form:options items="${listStaffs}"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                            <form:checkboxes  path="typeCode" items="${typecodes}" cssStyle="margin-left: 15px; display: inline-block;"></form:checkboxes>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-danger" id="btnSearchBuilding">
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
                        <div class="pull-right">
                            <a href='/admin/building-edit'>
                                <button class="btn btn-info" title="thêm tòa nhà"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg></button>
                            </a>

                            <button class="btn btn-danger" title="xóa tòa nhà" id="btnDeletebuilding"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg></button>
                        </div>
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
                                    <th>Tên tòa nhà</th>
                                    <th>địa chỉ</th>
                                    <th>số tầng hầm</th>
                                    <th>tên quản lý</th>
                                    <th>số điện thoại quản lý</th>
                                    <th>diện tích sàn</th>
                                    <th>diện tích trống</th>
                                    <th>diện tích thuê</th>
                                    <th>phí môi giới</th>
                                    <th>thao tác</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${buildingList}">
                                    <tr>
                                        <td class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                        <td>${item.name}</td>
                                        <td>${item.address}</td>
                                        <td>${item.numberOfBasement}</td>
                                        <td>${item.managerName}</td>
                                        <td>${item.managerPhoneNumber}</td>
                                        <td>${item.floorArea}</td>
                                        <td>${item.emptyArea}</td>
                                        <td>${item.rentArea}</td>
                                        <td>${item.brokerageFee}</td>

                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="giao tòa nhà" onclick="assingmentBuilding(${item.id})">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>

                                                <a class="btn btn-xs btn-info" title="sửa tòa nhà" href="/admin/building-edit-${item.id}">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </a>

                                                <button class="btn btn-xs btn-danger" title="xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>


                                            </div>


                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
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

<div class="modal fade" id="assingmentBuildingmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

<%--                    <tr>--%>
<%--                        <td class="center">--%>

<%--                            <input type="checkbox" id="check_2" value="2 " >--%>

<%--                        </td>--%>
<%--                        <td>nguyễn văn c</td>--%>

<%--                    </tr>--%>

                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="building" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="btnassingmentBuilding">giao tòa nhà</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">đóng</button>
            </div>
        </div>
    </div>
</div>

<script>
    function assingmentBuilding(buildingId){
        $('#assingmentBuildingmodal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);

    }

    function loadStaff(buildingId){
        $.ajax({
            type:"GET",
            url:"/api/building/"+buildingId +"/staffs",
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

    $('#btnassingmentBuilding').click(function(e) {
        e.preventDefault();
        var data={};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] != ''){
            assingment(data);
        }
        console.log("ok");
    })

    function assingment(data){
        $.ajax({
            type:"POST",
            url:"/api/building/"+"assignment",
            data:JSON.stringify(data),
            contentType:"application/json",
            dataType:"JSON",
            success:function(response){
                console.log("success");
            },
            error: function(response){
                console.info("giao không thành công");
                window.location.href ="<c:url value = "/admin/building-list?message=erro"/>";
                console.log(response);
            }
        });
    }

    $('#btnSearchBuilding').click(function (e){
       e.preventDefault();
       $('#ListForm').submit();
    });

    function deleteBuilding(id){
        var buildingId = [id];
        deleteBuildings(buildingId);
    }

    $('#btnDeletebuilding').click(function(e) {
        e.preventDefault();
        var data={};
        data['buildingId'] = $('#buildingId').val();
        var buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function(){
            return Number($(this).val());
        }).get();
        deleteBuildings(buildingIds);
    })
    function deleteBuildings(buildingIds){
        $.ajax({
            type:"DELETE",
            url:"/api/building",
            data:JSON.stringify(buildingIds),
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
</script>
</body>
</html>
