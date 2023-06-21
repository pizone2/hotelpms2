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
    <title>Users List - SB Admin Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="/assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        thead th svg {
            display: none;
        }

    </style>
</head>
<body class="nav-fixed">
<c:import url="../temp/topheader.jsp"></c:import>
<div id="layoutSidenav">
    <c:import url="../temp/leftheader.jsp"></c:import>
    <div id="layoutSidenav_content">
        <main>

            <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                <div class="container-fluid px-4">
                    <div class="page-header-content">
                        <div class="row align-items-center justify-content-between pt-3">
                            <div class="col-auto mb-3">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="user"></i></div>
                                    ProductStock List
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- data-bs-toggle="modal" data-bs-target="#exampleModalLg" Main page content-->
            <div class="container-fluid px-4">
                <div class="card">
                    <div class="card-body">
                        <button class="btn btn-outline-dark" type="button" id="add" style="margin-bottom: 15px;" >품목추가</button>
                       <%-- <button class="btn btn-outline-dark" type="button" style="margin-bottom: 15px;">품목수정</button>
                        <button class="btn btn-outline-dark" type="button" style="margin-bottom: 15px;">품목삭제</button>--%>
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th data-orderable="false"><input type="checkbox" id="checkAll" class="myCheckbox"></th>
                                <th>품목번호</th>
                                <th>상호명</th>
                                <th>품목명</th>
                                <th>품목코드</th>
                                <th>단가</th>
                                <th>단위</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th></th>
                                <th>품목번호</th>
                                <th>상호명</th>
                                <th>품목명</th>
                                <th>품목코드</th>
                                <th>단가</th>
                                <th>단위</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="vo" items="${list}">
                                <!-- 유저 정보-->
                                <tr>
                                    <td><input type="checkbox" class="myCheckbox"></td>
                                    <div  id="vo.itemId">
                                        <td class="d" data-cell-type="${vo.itemId}">${vo.itemId}</td>
                                    </div>
                                    <td>${vo.companyName}</td>
                                    <td>${vo.productName}</td>
                                    <td>${vo.itemCode}</td>
                                    <td>${vo.unitPrice}</td>
                                    <td>${vo.unit}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%--insert 모달--%>
            <%--insert 모달--%>
            <div class="modal fade" id="exampleModalLg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">최소수량설정</h5>
                            <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="autoOrderQuantity">최소수량</label>
                                <input class="form-control form-control-solid" id="autoOrderQuantity"
                                       name="autoOrderQuantity" type="text">
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-dark" type="button" data-bs-dismiss="modal">취소</button>
                                <input type="hidden" name="pageName" value="${pageName}">
                                <input type="hidden" name="roomNumber" value="${bookingVO.roomNumber}">
                                <button class="btn btn-dark" type="button" id="btn-send">저장</button>
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
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<%--<script src="/js/datatables/datatables-simple-demo.js"></script>--%>
<script src="/js/allItemList.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/js/webSocket.js"></script>
</body>
</html>