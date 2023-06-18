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
        .tg .tg-mkvm{background-color:#f9f9f9;font-family:"Arial Black", Gadget, sans-serif !important;text-align:center;vertical-align:top}
        .tg .tg-ws9p{background-color:#ffffff;font-family:"Arial Black", Gadget, sans-serif !important;font-weight:bold;text-align:center;
            vertical-align:top}
        .tg .tg-fcno{background-color:#ffffff;border-color:inherit;font-family:"Arial Black", Gadget, sans-serif !important;
            font-weight:bold;text-align:center;vertical-align:top}
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
                <nav class="nav nav-borders">
                    <a class="nav-link active ms-0" href="account-profile.html">전월</a>
                    <a class="nav-link" href="account-billing.html">당월</a>
                    <a class="nav-link" href="account-security.html">현월</a>

                </nav>
                <hr class="mt-0 mb-4" />
                <div class="row">
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">고객사 리스트</div>
                            <div class="card-body text-center">
                                <div class="table-responsive">
                                    <table class="tg">
                                        <colgroup>
                                            <col style="width: 118.333333px">
                                            <col style="width: 137.333333px">
                                            <col style="width: 206.333333px">
                                            <col style="width: 168.333333px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th class="tg-fcno">상호명</th>
                                            <th class="tg-ws9p">사업자 번호</th>
                                            <th class="tg-ws9p">담당자 이메일</th>
                                            <th class="tg-ws9p">금액</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="vo" items="${list}">
                                        <tr>
                                            <td class="tg-mkvm">${vo.companyName}</td>
                                            <td class="tg-mkvm">${vo.companyName}</td>
                                            <td class="tg-mkvm">${vo.companyName}</td>
                                            <td class="tg-mkvm">${vo.companyName}</td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                <%--    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">고객사 리스트 </div>
                            <div class="card-body text-center">
                                <!-- 테이블 들어가는  부분 -->
                                <table class="tg" style="undefined;table-layout: fixed; width: 630px">
                                    <colgroup>
                                        <col style="width: 118.333333px">
                                        <col style="width: 137.333333px">
                                        <col style="width: 206.333333px">
                                        <col style="width: 168.333333px">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="tg-n40f">상호명</th>
                                        <th class="tg-7t7i">사업자 번호</th>
                                        <th class="tg-9qze">담당자 이메일</th>
                                        <th class="tg-9qze">금액</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="tg-5bf1"></td>
                                        <td class="tg-mkvm"></td>
                                        <td class="tg-5bf1"></td>
                                        <td class="tg-mkvm"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>--%>
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">상세 품목 리스트</div>
                            <div class="card-body">
                                <form>
                                    <!-- Form Group (username)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                                        <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="username" />
                                    </div>
                                    <!-- Form Row-->
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (first name)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputFirstName">First name</label>
                                            <input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie" />
                                        </div>
                                        <!-- Form Group (last name)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputLastName">Last name</label>
                                            <input class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" value="Luna" />
                                        </div>
                                    </div>
                                    <!-- Form Row        -->
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (organization name)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputOrgName">Organization name</label>
                                            <input class="form-control" id="inputOrgName" type="text" placeholder="Enter your organization name" value="Start Bootstrap" />
                                        </div>
                                        <!-- Form Group (location)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputLocation">Location</label>
                                            <input class="form-control" id="inputLocation" type="text" placeholder="Enter your location" value="San Francisco, CA" />
                                        </div>
                                    </div>
                                    <!-- Form Group (email address)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                        <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" value="name@example.com" />
                                    </div>
                                    <!-- Form Row-->
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (phone number)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputPhone">Phone number</label>
                                            <input class="form-control" id="inputPhone" type="tel" placeholder="Enter your phone number" value="555-123-4567" />
                                        </div>
                                        <!-- Form Group (birthday)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputBirthday">Birthday</label>
                                            <input class="form-control" id="inputBirthday" type="text" name="birthday" placeholder="Enter your birthday" value="06/10/1988" />
                                        </div>
                                    </div>
                                    <!-- Save changes button-->
                                    <button class="btn btn-primary" type="button">Save changes</button>
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
<script src="js/scripts.js"></script>
</body>
</html>





