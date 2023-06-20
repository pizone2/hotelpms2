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

                <div class="container-fluid px-4">
                    <div class="card">
                        <div class="card-body">

                            <table id="datatablesSimple">
                                <thead>
                                <tr>
                                    <th>객실</th>
                                    <th>매출</th>

                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>객실</th>
                                    <th>매출</th>

                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="vo" items="${statisticsVO}">
                                    <!-- 유저 정보-->
                                    <tr>
                                        <td>${vo.roomType}</td>
                                        <td>${vo.todaySales}원</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>


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