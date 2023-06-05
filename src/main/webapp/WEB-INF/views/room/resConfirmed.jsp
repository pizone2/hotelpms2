<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Home</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="/assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    <style>
        table {
            display: flex;
            width: 100%;
        }
        td {
            flex: 1;
            text-align: center;
        }
        .datatable-table > thead > tr > th {
            vertical-align: bottom;
            text-align: center;
            border-bottom: none;
        }
    </style>
</head>
<body class="nav-fixed">
<!-- Header Section Begin -->
<c:import url="../temp/topheader.jsp"></c:import>
<!-- Header End -->
<div id="layoutSidenav">
    <!-- Header Section Begin -->
    <c:import url="../temp/leftheader.jsp"></c:import>
    <!-- Header End -->
    <div id="layoutSidenav_content">
<main>
<!-- Main page content-->
<div class="container-xl px-4 mt-4">
    <div class="card invoice">
        <div class="card-header p-4 p-md-5 border-bottom-0 bg-gradient-primary-to-secondary text-white-50">
            <div class="row justify-content-between align-items-center">
                <div class="col-12 col-lg-auto mb-5 mb-lg-0 text-center text-lg-start">
                    <div class="h2 text-white mb-0">예약등록</div>
                </div>
                <div class="col-12 col-lg-auto text-center text-lg-end">
                    <!-- Invoice details-->
                    <div class="h3 text-white">
                        <a href="#"><button class="btn btn-dark" type="button">초기화</button></a>
                        <a href="#"><button class="btn btn-dark" type="button">저장</button></a>
                        <a href="#"><button class="btn btn-dark" type="button">문자발송</button></a>
                        <a href="#"><button class="btn btn-dark" type="button">알림톡발송</button></a>
                        <a href="#"><button class="btn btn-dark" type="button">체크인</button></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body p-4 p-md-5">
            <!-- Invoice table-->
            <div class="table-responsive">
                <label style="margin-bottom: 15px;">프론트 정보 및 예약번호</label>
                <div class="datatable-container">
                    <table id="datatablesSimple" class="datatable-table">
                        <thead>
                        <tr>
                            <th>진행자</th>
                            <td><input type="text" value="매니저"></td>
                            <th>E-mail</th>
                            <td><input type="text" value="sksk436@naver.com"></td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td><input type="text" value="01079328558"></td>
                            <th>OTA예약번호</th>
                            <td><input type="text" value="1685942180027"></td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <!-- Invoice table-->
            <div class="table-responsive">
                <label style="margin-top: 30px; margin-bottom: 15px;">객실정보</label>
                <div class="datatable-container">
                    <table class="datatable-table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>고객명</th>
                            <th>고객ID</th>
                            <th>전화번호</th>
                            <th>인 수</th>
                            <th>박 수</th>
                            <th>입실일</th>
                            <th>퇴실일</th>
                            <th>객실타입</th>
                            <th>객실번호</th>
                            <th>이메일</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="text" value="김민지"></td>
                            <td><input type="text" value="10000ji"></td>
                            <td><input type="text" value="01079328558"></td>
                            <td><input type="text" value="1"></td>
                            <td><input type="text" value="1"></td>
                            <td style="white-space: nowrap;">
                                <input type="date" value="2023-06-05" style="width: 100px;"> /
                                <input type="text" value="15:00" style="width: 60px;">
                            </td>
                            <td style="white-space: nowrap;">
                                <input type="date" value="2023-06-06" style="width: 100px;"> /
                                <input type="text" value="13:00" style="width: 60px;">
                            </td>
                            <td><input type="text" value="더블"></td>
                            <td><input type="text" value="105"></td>
                            <td><input type="text" value="sksk436@naver.com"></td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>
</main>
        <!-- Footer Section Begin -->
        <c:import url="../temp/footer.jsp"></c:import>
        <!-- Footer Section End -->
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>
