<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Calendar" %>
<%
    String Date = new java.text.SimpleDateFormat("yyyy. MM. dd").format(new java.util.Date());
    String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link rel="icon" type="image/x-icon" href="/assets/img/favicon.png"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0"/>
    <script data-search-pseudo-elements defer
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js"
            crossorigin="anonymous"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%--    <script src="/webjars/sockjs-client/sockjs.min.js"></script>--%>
<%--    <script src="/webjars/stomp-websocket/stomp.min.js"></script>--%>
<%--    <script src="/js/webSocket.js"></script>--%>


</head>
<body class="nav-fixed">

<c:import url="../temp/topheader.jsp"></c:import>
<div id="layoutSidenav">
    <c:import url="../temp/leftheader.jsp"></c:import>
    <div id="layoutSidenav_content">
        <main>
            <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                <div class="container-xl px-4">
                    <div class="page-header-content pt-4">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-auto mt-4">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="activity"></i></div>
                                    CleanSchedule
                                </h1>
                                <div class="page-header-subtitle">Example dashboard overview and content summary</div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <div class="row">
                <div class="col-md-12">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="message">Message</label>
                            <input type="text" id="message" class="form-control" placeholder="Enter your message here...">
                        </div>
                        <button id="send" class="btn btn-default" type="button">Send</button>
                    </form>
                </div>
            </div>





        </main>
        <c:import url="../temp/footer.jsp"></c:import>
    </div>
</div>


<script src="/assets/demo/chart-area-demo.js"></script>
<script src="/assets/demo/chart-pie-demo.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="/js/cleanSchedule.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
<script src="/js/datatables/datatables-simple-demo.js"></script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/js/webSocket.js"></script>


</body>
</html>
