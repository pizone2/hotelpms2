<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Home</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/roomStatus.css" rel="stylesheet"/>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
          integrity="sha512-..." crossorigin="anonymous"/>

    <script data-search-pseudo-elements defer
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<body class="nav-fixed">
<div class="content" style="overflow:hidden;">
    <!-- Header Section Begin -->
    <c:import url="../temp/topheader.jsp"></c:import>
    <!-- Header End -->

    <div id="layoutSidenav">
        <!-- Header Section Begin -->
        <c:import url="../temp/leftheader.jsp"></c:import>
        <!-- Header End -->
        <div id="layoutSidenav_content">
            <div class="datatable-container">
                <div class="container-fluid px-4 py-4" >
                    <div class="card mb-4">
                        <div class="card-header">
                            <h3 style="margin-top: 15px;">객실 현황</h3>
                        </div>
                        <div class="card-body" >

                            <ul class="cr_status">
                                <li>
                                    <span class="fas fa-circle text-primary fa-xs"></span>
                                    <span class="cr_box02">예약확정</span>
                                </li>
                                <li>
                                    <span class="fas fa-circle text-warning fa-xs"></span>
                                    <span class="cr_box04">체크인</span>
                                </li>
                                <li>
                                    <span class="fas fa-circle text-success fa-xs"></span>
                                    <span class="cr_box05">퇴실예정</span>
                                </li>
                                <li>
                                    <h1 id="todayDate" style="display: inline; margin-left: 20px;"></h1>
                                </li>
                                <li style="float: right">
                                    <div style="display: inline; margin-left: 20px;">
                                        <a href="/roomStatus/roomStatusList" class="btn btn-outline-primary btn-sm rounded-0 shadow-sm px-4 py-3 text-uppercase fw-800 me-1 my-1"
                                           style="color: gray; border-color: gray;">2 weeks</a>
                                        <a href="/roomStatus/roomStatusThreeWeeksList" class="btn btn-outline-primary btn-sm rounded-0 shadow-sm px-4 py-3 text-uppercase fw-800 me-1 my-1"
                                           style="color: gray; border-color: gray;">3 weeks</a>
                                        <a href="/roomStatus/roomStatusMonthList" class="btn btn-outline-primary btn-sm rounded-0 shadow-sm px-4 py-3 text-uppercase fw-800 me-1 my-1"
                                           style="color: gray; border-color: gray;">1 months</a>

                                    </div>
                                </li>
                            </ul>




                            <div style="overflow: auto; max-height: 500px;">
                                <table class="table-status">
                                    <thead >
                                    <tr style="height: 70px;">
                                        <th class="tg-0pky">TYPE</th>
                                        <th class="tg-0pky">ROOM</th>
                                        <th class="tg-0lax">재실</th>
                                        <%
                                            java.util.Date currentDate = new java.util.Date();
                                            java.util.Calendar calendar = java.util.Calendar.getInstance();
                                            calendar.setTime(currentDate);

                                            java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("MM/dd (E)");

                                            for (int i = 0; i < 14; i++) {
                                                java.util.Date date = calendar.getTime();
                                                String formattedDate = dateFormat.format(date);
                                        %>
                                        <th class="tg-0lax"><%= formattedDate %>
                                        </th>
                                        <%
                                                calendar.add(java.util.Calendar.DATE, 1);
                                            }
                                        %>
                                    </tr>

                                    <tr>
                                        <td class="tg-0pky" colspan="2">체크인수</td>
                                        <c:forEach items="${checkinCount}" var="checkin" varStatus="loop">
                                            <c:if test="${loop.index < 15}">
                                                <td class="tg-0lax">${checkin.checkinCount}</td>
                                            </c:if>
                                        </c:forEach>

                                    </tr>
                                    <tr>
                                        <td class="tg-0lax" colspan="2">예약수</td>
                                        <c:forEach items="${reservationCount}" var="reservation"
                                                   varStatus="loop">
                                            <c:if test="${loop.index < 15}">
                                                <td class="tg-0lax">${reservation.reservationCount}</td>
                                            </c:if>
                                        </c:forEach>

                                    </tr>
                                    <tr>
                                        <td class="tg-0lax" colspan="2">객실재고</td>
                                        <c:forEach items="${roomStock}" var="stock" varStatus="loop">
                                            <c:if test="${loop.index < 15}">
                                                <td class="tg-0lax">${stock.roomStock}</td>
                                            </c:if>
                                        </c:forEach>

                                    </tr>

                                    </thead>

                                    <tbody style="display: block;">
                                    <c:forEach items="${roomStatusVO}" var="roomStatus" varStatus="status">
                                        <c:if test="${status.index % 15 == 0}">
                                            <tr>
                                            <td>&nbsp;&nbsp;&nbsp;${roomStatus.roomType}&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;${roomStatus.roomNumber}&nbsp;&nbsp;&nbsp;</td>
                                        </c:if>
                                        <style>
                                            .test {
                                                background-color: orange;
                                            }
                                        </style>
                                        <td class="room-status"
                                            style="background-color: ${roomStatus.roomStatus == '예약완료' ? 'dodgerblue' : roomStatus.roomStatus == '재실' ? 'orange' : roomStatus.roomStatus == '퇴실' ? 'limegreen' : 'white'};"
                                            onmouseover="showTooltip(event, '${roomStatus.roomNumber}', '${roomStatus.reservationDate}', '${roomStatus.name}', '${roomStatus.roomStatus}', '${roomStatus.reservationNumber}', '${roomStatus.phoneNumber}', '${roomStatus.checkinDate}', '${roomStatus.checkoutDate}')"
                                            onmouseout="hideTooltip()">
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">ROOMNUMBER: ${roomStatus.roomNumber}</span>
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">reservationDate: ${roomStatus.reservationDate}</span>
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">name: ${roomStatus.name}</span>
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">roomStatus: ${roomStatus.roomStatus}</span>
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">reservationNumber: ${roomStatus.reservationNumber}</span>
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">phoneNumber: ${roomStatus.phoneNumber}</span>
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">checkinDate: ${roomStatus.checkinDate}</span>
                                            <span style="color: transparent; overflow: hidden; display: inline-block; width: 100%; white-space: nowrap; text-overflow: ellipsis;">checkoutDate: ${roomStatus.checkoutDate}</span>

                                        </td>
                                        <c:if test="${status.index % 15 == 14 || status.last}">
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>


                                <%
                                    // Calculate yesterday's date
                                    java.time.LocalDate yesterday = java.time.LocalDate.now().minusDays(1);
                                    java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd");

                                    // Create a list to store the dates
                                    java.util.List<String> dateList = new java.util.ArrayList<>();

                                    // Loop through the dates and add them to the list
                                    for (int i = 0; i < 14; i++) {
                                        dateList.add(yesterday.minusDays(i).format(formatter));
                                    }

                                    // Set the date list as a JSP variable
                                    pageContext.setAttribute("dateList", dateList);
                                %>

                                <style>
                                    .reservation-tooltip {
                                        position: absolute !important;
                                        background-color: white !important;
                                        padding: 10px !important;
                                        border-radius: 5px !important;
                                        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2) !important;
                                    }
                                </style>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Footer Section Begin -->
            <c:import url="../temp/footer.jsp"></c:import>
            <!-- Footer Section End -->
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="/js/roomStatus.js"></script>
</body>
</html>