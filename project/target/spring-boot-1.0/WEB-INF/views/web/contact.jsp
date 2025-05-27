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
    <title>Liên hệ</title>
</head>
<body>
<div class="page-wrapper">
    <div class="intro text-center mb-5">
        <div class="title-page">Liên hệ</div>
        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="desc-intro">
                    <li class="home">
                        <a href="./ViewHome.html"><span style="color:#fff">Trang chủ</span></a>
                        <span class="mx-1" style="color:#fff"> / </span>
                    </li>
                    <li class="intro-item"><span>Liên hệ</span></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- CONTENT  -->

    <div class="box-lienhe mt-5">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <h2 class="title-lienhe"><strong>Công ty trách nhiệm hữu hạn một thành viên SkyLand</strong></h2>
                    <div class="desc-lienhe">
                        <p>Được thành lập vào ngày 20/08/1924 với niềm đam mê và khát vọng thành công trong lĩnh vực
                            bất động sản. Nhờ chiến lược rõ ràng và hướng đi đúng, SkyLand đã nhanh chóng phát triển
                            và đạt được những thành công to lớn.</p>
                        <ul class="margin-bottom-15 link" style="list-style-type: none;">
                            <li>
                                <span class="block_fonticon"><i class="fa fa-map-marker icon-lienhe"></i></span>
                                <span class="title-li"> Số 30 Yên Nghĩa, Hà Đông, TP Hà Nội</span>
                            </li>
                            <li>
                                <span class="block_fonticon"><i class="fa fa-mobile icon-lienhe"></i></span>
                                <span class="title-li">
                                        Hotline: <a style="color: #434a6e;" class="fone" href="">0984765423</a>

                                    </span>
                            </li>
                            <li>
                                <span class="block_fonticon"><i class="fa fa-envelope icon-lienhe"></i></span>
                                <span class="title-li">Email: <a style="color: #434a6e;"
                                                                 href="">nkl@gmail.com</a></span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <h2 class="title-lienhe"><strong>Liên hệ với chúng tôi</strong></h2>
                    <form id="contactForm" method="POST">
                        <div class="row">
                            <div class="col">
                                <input type="text" name="fullName" class="form-control" placeholder="Họ và tên">
                            </div>
                            <div class="col">
                                <input type="text" name="email" class="form-control" placeholder="Email">
                            </div>
                        </div>
                        <input type="text" name="phone" class="form-control mt-3" placeholder="Số điện thoại">
                        <input type="text" name="demand" class="form-control mt-3" placeholder="Nội dung">
                        <button type="submit" class="btn btn-primary px-4 mt-3">
                            Gửi liên hệ
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- FOOTER  -->
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
<script>
    $(document).ready(function () {
        $('#contactForm').on('submit', function (e) {
            e.preventDefault();
            const formData = {
                fullName: $('input[name="fullName"]').val(),
                email: $('input[name="email"]').val(),
                phone: $('input[name="phone"]').val(),
                content: $('textarea[name="demand"]').val(),
            };

            $.ajax({
                url: '/api/customer',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (response) {
                    location.reload();
                    alert("Gửi thông tin liên hệ thành công")
                },
                error: function (xhr, status, error) {
                    alert('Có lỗi xảy ra. Vui lòng thử lại!');
                }
            });
        });
    });

</script>
</body>
</html>
