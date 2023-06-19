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
        thead th svg tr {
            display: none;
        }

        .green {
            background-color: #abecab;
            color: #101318;
            font-weight: bold;
        }
        .red {
            background-color: #ee9393;
            color: #101318;
            font-weight: bold;
        }
        .yellow {
            background-color: #e8e699;
            color: #101318;
            font-weight: bold;
        }
        .purple {
            background-color: #d9b6e8;
            color: #101318;
            font-weight: bold;
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

            <!-- Main page content-->
            <div class="container-fluid px-4">
                <div class="card">
                    <div class="card-header">업체별 재고 관리 리스트</div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th data-orderable="false"><input type="checkbox" id="checkAll" class="myCheckbox"></th>
                                <th>품목번호</th>
                                <th>현재재고</th>
                                <th>자동발주수량</th>
                                <th>발주상태</th>
                                <th>상호명</th>
                                <th>품목코드</th>
                                <th>단위</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th></th>
                                <th>품목번호</th>
                                <th>현재재고</th>
                                <th>자동발주수량</th>
                                <th>발주상태</th>
                                <th>상호명</th>
                                <th>품목코드</th>
                                <th>단위</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="pm" items="${partnerManagerList}">
                                <!-- 유저 정보-->
                                <tr>
                                    <td ><input type="checkbox" class="myCheckbox"></td>
                                    <td >${pm.itemId}</td>
                                    <td >${pm.currentStock}</td>
                                    <td >${pm.autoOrderQuantity}</td>
                                   <c:if test="${pm.orderStatus eq '양호'}">
                                       <td><div class="green"><a href="#!">${pm.orderStatus}</a></div></td>
                                   </c:if>
                                    <c:if test="${pm.orderStatus eq '발주요청'}">
                                        <td class="badge bg-secondary text-white rounded-pill"><div class="red"><a href="#!" onclick="updateInProgress('${pm.itemId}'), reloadPageInProgress();">${pm.orderStatus}</a></div></td>
                                    </c:if>
                                    <c:if test="${pm.orderStatus eq '발주완료'}">
                                        <td class="badge bg-secondary text-white rounded-pill"><div class="yellow"><a href="#!" onclick="updateGoodStock('${pm.itemId}'), reloadPageGoodStock();">${pm.orderStatus}</a></div></td>
                                    </c:if>
                                    <c:if test="${pm.orderStatus eq '발주중'}">
                                        <td class="badge bg-secondary text-white rounded-pill"><div class="purple"><a href="#!">${pm.orderStatus}</a></div></td>
                                    </c:if>
                                    <td >${pm.productName}</td>
                                    <td>${pm.itemCode}</td>
                                    <td>${pm.unitPrice}</td>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="/js/updateOrder.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="/js/datatables/datatables-simple-demo.js"></script>
<script src="/js/managerStock.js"></script>
</body>
</html>