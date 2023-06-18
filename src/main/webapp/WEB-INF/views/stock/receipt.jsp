<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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
    .tg .tg-kxtx{background-color:#f9f9f9;font-family:inherit;font-size:small;text-align:center;vertical-align:top}
    .tg .tg-amwm{font-weight:bold;text-align:center;vertical-align:top}
</style>
<table class="tg" style="undefined;table-layout: fixed; width: 645px">
    <colgroup>
        <col style="width: 55.333333px">
        <col style="width: 120.333333px">
        <col style="width: 120.333333px">
        <col style="width: 124.333333px">
        <col style="width: 148.333333px">
        <col style="width: 178.333333px">
    </colgroup>
    <thead>
    <tr>
        <th class="tg-3kff">번호</th>
        <th class="tg-950s">품목코드</th>
        <th class="tg-950s">품목명</th>
        <th class="tg-950s">단가</th>
        <th class="tg-950s">수량</th>
        <th class="tg-950s">품목 총금액</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list}" varStatus="status">
        <tr>
            <td class="tg-kxtx">${status.index + 1}</td>
            <td class="tg-kxtx">${vo.itemCode}</td>
            <td class="tg-kxtx">${vo.productName}</td>
            <td class="tg-kxtx">${vo.unitPrice} 원</td>
            <td class="tg-kxtx">${vo.unit} EA</td>
            <td class="tg-kxtx">${vo.itemIdSum} 원</td>
        </tr>
    </c:forEach>
    <c:forEach var="vo" items="${list}" varStatus="loop">
        <c:if test="${loop.first}">
            <tr>
                <td class="tg-amwm" colspan="2">Total Price</td>
                <td class="tg-amwm"></td>
                <td class="tg-amwm"></td>
                <td class="tg-amwm"></td>
                <td class="tg-amwm">${vo.total} 원</td>
            </tr>
        </c:if>
    </c:forEach>
 <%--   <tr>
        <td class="tg-kxtx"></td>
        <td class="tg-kxtx"></td>
        <td class="tg-kxtx"></td>
        <td class="tg-kxtx"></td>
    </tr>--%>
    </tbody>
</table>
</html>



