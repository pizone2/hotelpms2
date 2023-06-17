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

            <main>

                <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                    <div class="container-fluid px-4">
                        <div class="page-header-content">
                            <div class="row align-items-center justify-content-between pt-3">
                                <div class="col-auto mb-3">
                                    <h1 class="page-header-title">
                                        <div class="page-header-icon"><i data-feather="user"></i></div>
                                        객실청소상태
                                    </h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- Main page content-->
                <div class="container-fluid px-4">
                    <div class="card">
                        <div class="card-body">

                            <table id="datatablesSimple">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>객실</th>
                                    <th>소속</th>
                                    <th>등록일</th>
                                    <th>확인여부</th>
                                    <th>비고</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>번호</th>
                                    <th>객실</th>
                                    <th>소속</th>
                                    <th>등록일</th>
                                    <th>확인여부</th>
                                    <th>비고</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="roomClean" items="${roomCleanVO}">
                                    <!-- 유저 정보-->
                                    <tr>
                                        <td>${roomClean.cleanNum}</td>
                                        <td>
                                            <span class="modal-trigger roomNumber" data-note="${roomClean.note}" data-savedName="${roomClean.savedName}" data-cleanNum="${roomClean.cleanNum}">
                                                    ${roomClean.roomNumber}
                                            </span>
                                        </td>
                                        <td>${roomClean.scheduleNumber}</td>
                                        <td>${roomClean.dateOfRegistration}</td>
                                        <td style="color: ${roomClean.confirmationStatus == '확인' ? 'blue' : 'red'}">${roomClean.confirmationStatus}</td>
                                        <td>${roomClean.note}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>
                <%--insert 모달--%>
                <div class="modal fade exampleModal" id="exampleModal"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">품목추가</h5>
                                    <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                        <div class="mb-3">
                                            <label for="savedName">청소상태</label>
                                            <img id="savedName" src="" alt="Preview Image" style="max-width: 100%; height: auto;">
                                        </div>
                                        <div class="mb-3">
                                            <label for="remarks">비고</label>
                                            <textarea  class="form-control form-control-solid"  cols="30" rows="5"
                                                       name="remarks" id="remarks"></textarea>
                                        </div>

                                        <div class="modal-footer">
                                            <button class="btn btn-dark" type="button" data-bs-dismiss="modal">취소</button>
                                            <input type="hidden" name="pageName" value="${pageName}">
                                            <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">

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
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <script src="../js/scripts.js"></script>--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="/js/datatables/datatables-simple-demo.js"></script>
    <script src="/js/roomClean.js"></script>

</body>
</html>