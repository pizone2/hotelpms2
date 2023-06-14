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
                                        <td>${roomClean.scheduleNumber}</td>
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

                                <input type="submit"/>
                            </form>



<%--                            <img src="${pageContext.request.contextPath}/resources/static/images/3fc8f4e1-1ae4-4ca4-a39a-8cd94772abbd_스크린샷 2023-05-21 오전 12.35.27.png" alt="이미지">--%>


                            <!-- Button trigger modal -->
                            <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Launch Demo Modal</button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form action="/clean/upload" method="post" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Default Bootstrap Modal</h5>
                                                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-md-12">
                                                    <label class="small mb-1" for="1">객실</label>
                                                    <input class="form-control" id="1" type="text" placeholder="ex) 101호" value="">
                                                </div>  <div class="col-md-12" style="margin-top: 10px">
                                                    <label class="small mb-1" for="2">소속</label>
                                                    <input class="form-control" id="2" type="text" placeholder="" value="">
                                                </div>
                                                <div class="col-md-12" style="margin-top: 15px">
                                                    <input type="file" name="attachment">
                                                </div>
                                                <div class="col-md-12" style="margin-top: 10px">
                                                    <label class="small mb-1" for="3">비고</label>
                                                    <input class="form-control" id="3" type="text" placeholder="" value="">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
                                                <button class="btn btn-primary" type="button">Save changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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