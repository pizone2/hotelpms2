<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.*, java.text.*" %>
<%
    // 오늘 날짜 가져오기
    Calendar cal = Calendar.getInstance();
    cal.setTime(new Date());

    // 달의 첫 번째 날짜로 설정
    cal.set(Calendar.DAY_OF_MONTH, 1);

    // 날짜 형식 변환
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String firstDayOfMonth = sdf.format(cal.getTime());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Home</title>
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .datatable-info {
            display: none;
        }
    </style>
</head>
<body class="nav-fixed">

<!-- Header Section Begin -->
<c:import url="./temp/topheader.jsp"></c:import>
<!-- Header End -->
<div id="layoutSidenav">
    <!-- Header Section Begin -->
    <c:import url="./temp/leftheader.jsp"></c:import>
    <!-- Header End -->
    <div id="layoutSidenav_content">
    <main>
        <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
            <div class="container-fluid px-4">
                <div class="page-header-content">
                    <div class="row align-items-center justify-content-between pt-3">
                        <div class="col-auto mb-3">
                            <h1 class="page-header-title">
                                <div class="page-header-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg></div>
                                DASH BOARD
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <form>
        <!-- Main page content-->
        <div class="container-fluid px-4">
            <div class="card mb-4">
                <div class="card-body">
                    지점: <input type="text" value="Mohotel" disabled>
                    조회기간:조회기간:<input id="startDate" type="date" value="<%= firstDayOfMonth %>" readonly> ~
                    <input id="endDate" type="date">
                    <div class="btn-group" role="group" aria-label="Button group">
                    <button class="btn btn-dark btn-sm" type="button" id="btn-day">일</button>
                    <button class="btn btn-dark btn-sm" type="button" id="btn-month">월</button>
                    </div>
                </div>

            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">

                        </div>
                        <div class="col-6">
                            <table id="datatablesSimple">
                                <thead>
                                <tr>
                                   <%-- <th data-orderable="false"></th>--%>
                                    <th></th>
                                    <th>분류</th>
                                    <th>매출</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <%--<th></th>--%>
                                    <th></th>
                                    <th>분류</th>
                                    <th>매출</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>더블</td>
                                        <td>ROOM</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>디럭스</td>
                                        <td>ROOM</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>스위트</td>
                                        <td>ROOM</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>스탠다드</td>
                                        <td>ROOM</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>트윈</td>
                                        <td>ROOM</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>합계</td>
                                        <td></td>
                                        <td>원</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </main>
        <!-- Footer Section Begin -->
        <c:import url="./temp/footer.jsp"></c:import>
        <!-- Footer Section End -->
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo-sub.js"></script>
</body>
</html>
