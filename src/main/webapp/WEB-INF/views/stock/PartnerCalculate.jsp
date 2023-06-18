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
    <title>Edit User - SB Admin Pro</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--테이블 디자인 --%>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;border-style:solid;border-width:1px;}
        .tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
            font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
            font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-3kff{background-color:#ffffff;border-color:inherit;font-family:Verdana, Geneva, sans-serif !important;font-size:small;
            font-weight:bold;text-align:center;vertical-align:top}
        .tg .tg-950s{background-color:#ffffff;font-family:Verdana, Geneva, sans-serif !important;font-size:small;font-weight:bold;
            text-align:center;vertical-align:top}
        .tg .tg-kxtx{background-color:#f9f9f9;font-family:inherit;font-size:small;text-align:center;vertical-align:top;}
        .tg .tg-amwm{font-weight:bold;text-align:center;vertical-align:top}
    </style>
</head>
<body class="nav-fixed">
<!-- Header Section Begin -->
<c:import url="../temp/topheader.jsp"></c:import>
<!-- Header End -->
<div id="layoutSidenav">
    <!-- Header Section Begin -->
    <c:import url="../temp/leftheader.jsp"></c:import>
    <div id="layoutSidenav_content">
        <main>
            <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                <div class="container-xl px-4">
                    <div class="page-header-content">
                        <div class="row align-items-center justify-content-between pt-3">
                            <div class="col-auto mb-3">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="user"></i></div>
                                    거래처별 정산 내역
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main page content-->
            <div class="container-xl px-4 mt-4">
                <!-- Account page navigation-->
                <nav class="nav nav-borders justify-content-between">
                    <div class="d-flex">
                        <a class="nav-link me-2 font-weight-bold" href="http://localhost/partnerCalculate/list?date=2023-0${yearMonth - 1 < 10 ? '0' + (yearMonth - 1) : yearMonth - 1}-01" id="before"><c:out value="${yearMonth - 1 < 10 ? '0' + (yearMonth - 1) : yearMonth - 1}"/> 월 정산</a>
                    </div>
                        <a class="nav-link me-2 active ms-0 font-weight-bold" href="account-billing.html"><c:out value="${yearMonth < 10 ? '0' + yearMonth : yearMonth}"/> 월 정산</a>
                    <a class="nav-link font-weight-bold" href="http://localhost/partnerCalculate/list?date=2023-0${yearMonth + 1 < 10 ? '0' + (yearMonth + 1) : yearMonth + 1}-01" id="after"><c:out value="${yearMonth + 1 < 10 ? '0' + (yearMonth + 1) : yearMonth + 1}"/> 월 정산</a>
                </nav>
                <hr class="mt-0 mb-4" />
                <div class="row">
                    <div class="col-xl-5">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">고객사 리스트</div>
                            <div class="card-body text-center">
                                <div class="table-responsive">
                                    <table class="tg">
                                        <colgroup>
                                            <col style="width: 155.333333px">
                                            <col style="width: 177.333333px">
                                            <col style="width: 144.333333px">
                                            <col style="width: 168.333333px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th class="tg-950s">상호명</th>
                                            <th class="tg-950s">사업자 번호</th>
                                            <th class="tg-950s">담당자 이메일</th>
                                            <th class="tg-950s">금액</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="vo" items="${list}">
                                        <tr>
                                            <td class="tg-kxtx" style="text-decoration: underline;">${vo.companyName}</td>
                                            <td class="tg-kxtx" style="text-decoration: underline;">${vo.businessNumber}</td>
                                            <td class="tg-kxtx" style="text-decoration: underline;">${vo.email}</td>
                                            <td class="tg-kxtx" style="text-decoration: underline;">${vo.amount}</td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-7">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">상세 품목 리스트</div>
                            <div class="card-body">
                                <form>
                                    <div id="tableDiv" style="overflow-x: auto;"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <c:import url="../temp/footer.jsp"></c:import>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="/js/PartnerCalculate.js"></script>
</body>
</html>





