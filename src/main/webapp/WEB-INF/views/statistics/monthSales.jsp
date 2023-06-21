<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<div class="row">

    <div class="col-6">

    </div>

    <div class="col-6">
        <table id="datatablesSimple" class="datatable-table">
            <thead>
            <tr>
                <%-- <th data-orderable="false"></th>--%>
                <th>객실</th>
                <th>분류</th>
                <th>매출</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>더블</td>
                <td>ROOM</td>
                <td>${selectedSales[0].total}</td>
            </tr>
            <tr>
                <td>디럭스</td>
                <td>ROOM</td>
                <td>${selectedSales[1].total}</td>
            </tr>
            <tr>
                <td>스위트</td>
                <td>ROOM</td>
                <td>${selectedSales[2].total}</td>
            </tr>
            <tr>
                <td>스탠다드</td>
                <td>ROOM</td>
                <td>${selectedSales[3].total}</td>
            </tr>
            <tr>
                <td>트윈</td>
                <td>ROOM</td>
                <td>${selectedSales[4].total}</td>
            </tr>
            <tr>
                <td>합계</td>
                <td>ROOM</td>
                <td>${selectedSales[5].total}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</html>