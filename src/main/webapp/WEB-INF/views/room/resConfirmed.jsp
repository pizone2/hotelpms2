<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

        form {
            display: inline;
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
                    <div class="h2 text-white mb-0">예약확정</div>
                </div>
                <div class="col-12 col-lg-auto text-center text-lg-end">
                    <!-- button -->
                    <div class="h3 text-white">
                        <button class="btn btn-dark" type="button" id="btn-reset">초기화</button>
                        <form id="saveForm" action="/roomDetail/save" method="post">
                            <input type="hidden" name="checkoutDate" id="updateCheckout">
                            <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">
                            <input type="hidden" name="reservationNumber" value="${bookingVO.reservationNumber}">
                            <input type="hidden" name="reservationDate" id="updateReservationDate">
                            <input type="hidden" name="guestCount" id="updateGuestCount">
                            <button class="btn btn-dark" type="button" id="btn-save">저장</button>
                        </form>
                        <a href="#"><button class="btn btn-dark" type="button">문자발송</button></a>
                        <a href="#"><button class="btn btn-dark" type="button">알림톡발송</button></a>
                        <form id="checkinForm" action="/roomDetail/checkInSave" method="post">
                           <input type="hidden" name="checkinDate" value="${bookingVO.checkinDate}">
                           <input type="hidden" name="checkoutDate" id="updateResCheckout">
                           <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">
                        <button class="btn btn-dark" type="button" id="btn-checkin">체크인</button>
                        </form>
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
                            <td><input type="text" value="${userVO.id}" disabled></td>
                            <th>E-mail</th>
                            <td><input type="text" value="${userVO.email}" disabled></td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td><input type="text" value="${userVO.phoneNumber}" disabled></td>
                            <th>OTA예약번호</th>
                            <td><input type="text" value="${bookingVO.reservationNumber}" name="reservationNumber" disabled></td>
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
                            <td><input type="text" value="${bookingVO.name}" name="name" disabled></td>
                            <td><input type="text" value="${bookingVO.id}" name="id" disabled></td>
                            <td><input type="text" value="${bookingVO.phoneNumber}" name="phoneNumber" disabled></td>
                            <%--<td><input type="text" value="${bookingVO.guestCount}" class="resetfield"></td>--%>
                            <td>
                                <select id="guest">
                                    <option value="1" ${bookingVO.guestCount == 1 ? 'selected' : ''} ${bookingVO.roomTypeVOs.capacity >= 1 ? '' : 'disabled'} class="guest-option" data-selected="${bookingVO.guestCount == 1 ? 'true' : 'false'}" data-capacity="${bookingVO.roomTypeVOs.capacity}"> 1인 (최대 ${bookingVO.roomTypeVOs.capacity}인) </option>
                                    <option value="2" ${bookingVO.guestCount == 2 ? 'selected' : ''} ${bookingVO.roomTypeVOs.capacity >= 2 ? '' : 'disabled'} class="guest-option" data-selected="${bookingVO.guestCount == 2 ? 'true' : 'false'}" data-capacity="${bookingVO.roomTypeVOs.capacity}"> 2인 (최대 ${bookingVO.roomTypeVOs.capacity}인) </option>
                                    <option value="3" ${bookingVO.guestCount == 3 ? 'selected' : ''} ${bookingVO.roomTypeVOs.capacity >= 3 ? '' : 'disabled'} class="guest-option" data-selected="${bookingVO.guestCount == 3 ? 'true' : 'false'}" data-capacity="${bookingVO.roomTypeVOs.capacity}"> 3인 (최대 ${bookingVO.roomTypeVOs.capacity}인) </option>
                                    <option value="4" ${bookingVO.guestCount == 4 ? 'selected' : ''} ${bookingVO.roomTypeVOs.capacity >= 4 ? '' : 'disabled'} class="guest-option" data-selected="${bookingVO.guestCount == 4 ? 'true' : 'false'}" data-capacity="${bookingVO.roomTypeVOs.capacity}"> 4인 (최대 ${bookingVO.roomTypeVOs.capacity}인) </option>
                                </select>

                            </td>
                            <c:set var="differenceInDays" value="${(checkoutDate.time - checkinDate.time / (1000 * 60 * 60 * 24)) + 1}" />
                            <td><input type="text" value="${fn:substringBefore(differenceInDays, '.')}" disabled></td>
                            <td style="white-space: nowrap;">
                                <input type="date" value="${bookingVO.checkinDate}" style="width: 100px;" name="checkinDate" disabled> /
                                15:00
                            </td>
                            <td style="white-space: nowrap;">
                                <input type="date" value="${bookingVO.checkoutDate}" style="width: 100px;" class="resetfield" id="checkoutDate" name="checkoutDate"> /
                                <%--<input type="text" value="13:00" style="width: 60px;">--%>
                                13:00
                            </td>
                            <td><input type="text" value="${bookingVO.roomType}" name="roomType" disabled></td>
                            <td><input type="text" value="${bookingVO.roomNumber}" id="roomNumber" name="roomNumber" disabled></td>
                            <td><input type="text" value="${bookingVO.reservationEmail}" name="reservationEmail" disabled></td>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/resConfirmed.js"></script>
</body>
</html>
