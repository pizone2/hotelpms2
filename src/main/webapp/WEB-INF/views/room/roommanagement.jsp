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
    <link href="/css/roommanagement.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
            <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
            <div class="container-xl px-4">
                <div class="page-header-content pt-4">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                            <h1 class="page-header-title">
                                <div class="page-header-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-filter"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon></svg></div>
                                실시간 객실 상태
                            </h1>
                            <div class="page-header-subtitle">실시간 객실상태를 조회하고 확인할 수 있는 객실메인보드 기능을 담당합니다.</div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
            <div class="container-xl px-4 mt-n10">
                <div class="card mb-4">
                    <div class="card-header">실시간 객실 상태</div>
                    <div class="card-body">
                        <div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns"><div class="datatable-container">
                            <div class="datatable-dropdown">
                                <div class="mb-0">
                                    <label class="small mb-2">체크박스를 클릭하면 원하는 객실 필터링 조회가 가능합니다</label>
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <th scope="row">
                                                <label>객실상태</label>
                                            </th>
                                            <td>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="roomstatus" value="예약가능" id="roomstatus1">
                                                    <label class="form-check-label" for="roomstatus1">공실</label>
                                                    <div class="badge rounded-pill roomstatusname1" style="background-color: #1a1f71; color: white;" >공실</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="roomstatus" value="재실" id="roomstatus2">
                                                    <label class="form-check-label" for="roomstatus2">재실</label>
                                                    <div class="badge bg-warning text-white rounded-pill roomstatusname2" >Full-time</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="roomstatus" value="예약완료" id="roomstatus3">
                                                    <label class="form-check-label" for="roomstatus3">예약확정</label>
                                                    <div class="badge bg-blue text-white rounded-pill roomstatusname3" >Full-time</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="roomstatus" value="청소요청" id="roomstatus4">
                                                    <label class="form-check-label" for="roomstatus4">청소요청</label>
                                                    <div class="badge bg-info text-white rounded-pill roomstatusname4" >Full-time</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="roomstatus" value="청소중" id="roomstatus5">
                                                    <label class="form-check-label" for="roomstatus5">청소중</label>
                                                    <div class="badge rounded-pill roomstatusname5" style="background-color: #ff662e; color: white;">Full-time</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="roomstatus" value="퇴실" id="roomstatus6">
                                                    <label class="form-check-label" for="roomstatus6">퇴실</label>
                                                    <div class="badge bg-green text-white rounded-pill roomstatusname6" > Full-time</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="roomstatus" value="객실점검" id="roomstatus7">
                                                    <label class="form-check-label" for="roomstatus7">객실점검</label>
                                                    <div class="badge text-white rounded-pill  roomstatusname7" style="background-color: #00673f;" >Full-time</div>
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <label>층별</label>
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="floors" value="1" id="floor1">
                                                        <label class="form-check-label" for="floor1"></label>
                                                        <label class="form-check-label" for="floor1">1층</label>
                                                    </div>
                                                    <%--&nbsp;는 옆 간격을 주는 것--%>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="floors" value="2" id="floor2">
                                                        <label class="form-check-label" for="floor2"></label>
                                                        <label class="form-check-label" for="floor2">2층</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="floors" value="3" id="floor3">
                                                        <label class="form-check-label" for="floor3"></label>
                                                        <label class="form-check-label" for="floor3">3층</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="floors" value="4" id="floor4">
                                                        <label class="form-check-label" for="floor4"></label>
                                                        <label class="form-check-label" for="floor4">4층</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="floors" value="5" id="floor5">
                                                        <label class="form-check-label" for="floor5"></label>
                                                        <label class="form-check-label" for="floor5">5층</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="floors" value="6" id="floor6">
                                                        <label class="form-check-label" for="floor6"></label>
                                                        <label class="form-check-label" for="floor6">6층</label>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <label>룸타입</label>
                                            </th>
                                            <td>
                                                <div class="form-check">
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="roomTypes" value="더블" id="roomType1">
                                                        <label class="form-check-label" for="roomType1"></label>
                                                        <label class="form-check-label" for="roomType1">더블</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="roomTypes" value="디럭스" id="roomType2">
                                                        <label class="form-check-label" for="roomType2"></label>
                                                        <label class="form-check-label" for="roomType2">디럭스</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="roomTypes" value="스위트" id="roomType3">
                                                        <label class="form-check-label" for="roomType3"></label>
                                                        <label class="form-check-label" for="roomType3">스위트</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="roomTypes" value="스탠다드" id="roomType4">
                                                        <label class="form-check-label" for="roomType4"></label>
                                                        <label class="form-check-label" for="roomType4">스탠다드</label>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="roomTypes" value="트윈" id="roomType5">
                                                        <label class="form-check-label" for="roomType5"></label>
                                                        <label class="form-check-label" for="roomType5">트윈</label>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <label>객실수</label>
                                            </th>
                                            <td>
                                            <div class="form-check-inline">
                                                <label class="form-check-label-tdroomCount"></label>
                                            </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="datatable-search">
                            </div>
                        </div>
                            <div class="datatable-container">

                                <table id="datatablesSimple" class="datatable-table">
                                    <thead><tr></tr></thead>
                                 <%--   <thead><tr><th data-sortable="true" style="width: 16.023738872403563%;"><a href="#" class="datatable-sorter">Name</a></th><th data-sortable="true" style="width: 23.664688427299705%;"><a href="#" class="datatable-sorter">Position</a></th><th data-sortable="true" style="width: 12.314540059347182%;"><a href="#" class="datatable-sorter">Office</a></th><th data-sortable="true" style="width: 7.195845697329377%;"><a href="#" class="datatable-sorter">Age</a></th><th data-sortable="true" style="width: 11.498516320474778%;"><a href="#" class="datatable-sorter">Start date</a></th><th data-sortable="true" style="width: 10.682492581602373%;"><a href="#" class="datatable-sorter">Salary</a></th><th data-sortable="true" style="width: 8.902077151335313%;"><a href="#" class="datatable-sorter">Status</a></th><th data-sortable="true" style="width: 9.718100890207715%;"><a href="#" class="datatable-sorter">Actions</a></th></tr></thead>--%>
                                    <tbody>
                                    <div class="radius">
                                    <tr data-index="1" class="floor">
                                        <c:forEach items="${room}" var="room">
                                            <c:if test="${room.floor == 1}">
                                                <td class="tdroom ${room.roomType}" style="width: calc(100% / 5); height: 180px; text-align: center; " id="pa${room.roomNumber}">
                                                        ${room.roomNumber} <br> ${room.roomType} <br>
                                                    <c:forEach items="${status}" var="status">
                                                        <c:if test="${room.roomNumber == status.roomNumber}">
                                                            <div class="tdroom ${room.roomType} ${status.roomStatus}" id="ch${room.roomNumber}">
                                                            ${status.roomStatus}
                                                                </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                   <tr data-index="2" class="floor">
                                        <c:forEach items="${room}" var="room">
                                            <c:if test="${room.floor == 2}">
                                                <td class="tdroom ${room.roomType}" style="width: calc(100% / 5); height: 180px; text-align: center;" id="pa${room.roomNumber}" >
                                                        ${room.roomNumber} <br> ${room.roomType} <br>
                                                    <c:forEach items="${status}" var="status">
                                                        <c:if test="${room.roomNumber == status.roomNumber}">
                                                            <div class="tdroom ${room.roomType} ${status.roomStatus}" id="ch${room.roomNumber}">
                                                            ${status.roomStatus}
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr data-index="3" class="floor">
                                        <c:forEach items="${room}" var="room">
                                            <c:if test="${room.floor == 3}">
                                                <td class="tdroom ${room.roomType}" style="width: calc(100% / 5); height: 180px; text-align: center;"  id="pa${room.roomNumber}">${room.roomNumber} <br> ${room.roomType}  <br>
                                                    <c:forEach items="${status}" var="status">
                                                        <c:if test="${room.roomNumber == status.roomNumber}">
                                                         <div class="tdroom ${room.roomType} ${status.roomStatus}" id="ch${room.roomNumber}"> ${status.roomStatus}</div>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr data-index="4" class="floor">
                                        <c:forEach items="${room}" var="room">
                                            <c:if test="${room.floor == 4}">
                                                <td class="tdroom ${room.roomType}" style="width: calc(100% / 5); height: 180px; text-align: center;"  id="pa${room.roomNumber}">${room.roomNumber} <br> ${room.roomType}  <br>
                                                    <c:forEach items="${status}" var="status">
                                                        <c:if test="${room.roomNumber == status.roomNumber}">
                                                            <div class="tdroom ${room.roomType} ${status.roomStatus}" id="ch${room.roomNumber}"> ${status.roomStatus}</div>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr data-index="5" class="floor">
                                        <c:forEach items="${room}" var="room">
                                            <c:if test="${room.floor == 5}">
                                                <td class="tdroom ${room.roomType}" style="width: calc(100% / 5); height: 180px; text-align: center;"  id="pa${room.roomNumber}">${room.roomNumber} <br> ${room.roomType}  <br>
                                                    <c:forEach items="${status}" var="status">
                                                        <c:if test="${room.roomNumber == status.roomNumber}">
                                                            <div class="tdroom ${room.roomType} ${status.roomStatus}" id="ch${room.roomNumber}"> ${status.roomStatus}</div>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr data-index="6" class="floor">
                                        <c:forEach items="${room}" var="room">
                                            <c:if test="${room.floor == 6}">
                                                <td class="tdroom ${room.roomType}" style="width: calc(100% / 5); height: 180px; text-align: center;"  id="pa${room.roomNumber}"> ${room.roomNumber} <br> ${room.roomType}  <br>
                                                    <c:forEach items="${status}" var="status">
                                                        <c:if test="${room.roomNumber == status.roomNumber}">
                                                            <div class="tdroom ${room.roomType} ${status.roomStatus}" id="ch${room.roomNumber}"> ${status.roomStatus}</div>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    </div>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                    </div>
                </div>
                <div class="card card-icon mb-4">
                    <div class="row g-0">
                        <div class="col-auto card-icon-aside bg-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle me-1 text-white-50"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg></div>
                        <div class="col">
                            <div class="card-body py-5">
                                <h5 class="card-title">Third-Party Documentation Available</h5>
                                <p class="card-text">Simple DataTables is a third party plugin that is used to generate the demo table above. For more information about how to use Simple DataTables with your project, please visit the official documentation.</p>
                                <a class="btn btn-primary btn-sm" href="https://github.com/fiduswriter/Simple-DataTables" target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-external-link me-1"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path><polyline points="15 3 21 3 21 9"></polyline><line x1="10" y1="14" x2="21" y2="3"></line></svg>
                                    Visit Simple DataTables Docs
                                </a>
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
<script src="../js/scripts.js"></script>
<script src="../js/roommanagement.js"></script>
</body>
</html>
