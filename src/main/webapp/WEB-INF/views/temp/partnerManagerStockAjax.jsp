<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                            <td><div class="green"><a href="">${pm.orderStatus}</a></div></td>
                        </c:if>
                        <c:if test="${pm.orderStatus eq '발주요청'}">
                            <td class="badge bg-secondary text-white rounded-pill"><div class="red" id="updateInProgress"><a href="#!" onclick="updateInProgress('${pm.itemId}')">${pm.orderStatus}</a></div></td>
                        </c:if>
                        <c:if test="${pm.orderStatus eq '발주완료'}">
                            <td class="badge bg-secondary text-white rounded-pill"><div class="yellow"><a href="partnerManagerStockList.jsp">${pm.orderStatus}</a></div></td>
                        </c:if>
                        <c:if test="${pm.orderStatus eq '발주중'}">
                            <td class="badge bg-secondary text-white rounded-pill"><div class="yellow"><a href="partnerManagerStockList.jsp">${pm.orderStatus}</a></div></td>
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



