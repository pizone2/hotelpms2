<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Home</title>
    <link href="/css/styles.css" rel="stylesheet"/>
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
                            객실청소상태
                        </div>
                        <div class="card-body" >
                            <table class="datatable-table">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>객실</th>
                                    <th>소속</th>
                                    <th>등록일</th>
                                    <th>확인여부</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="roomClean" items="${roomCleanVO}">
                                    <tr>

                                        <td>${roomClean.cleanNum}</td>
                                        <td>${roomClean.roomNumber}</td>
                                        <td>${roomClean.serialNum}</td>
                                        <td>${roomClean.dateOfRegistration}</td>
                                        <td>${roomClean.confirmationStatus}</td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <h2>파일 업로드</h2>

                            <form action="/clean/upload" method="post" enctype="multipart/form-data">

                                <h4>단일 파일 업로드</h4>
                                <input type="file" name="file">

                                <h4>다중 파일 업로드</h4>
                                <input type="file" multiple="multiple" name="files">

                                <input type="submit"/>
                            </form>

                            <h3>이미지 출력</h3>
                            <div th:each="imageFile : ${all} ">
                                <img  th:src="|/images/${imageFile.imageId}|" width="150" height="150">
                                <p th:text="${imageFile.orgName}"></p>
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

</body>
</html>