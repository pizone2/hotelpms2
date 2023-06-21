<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
                <table id="datatablesSimple" class="datatable-table">
                    <thead>
                    <tr>
                        <th>객실</th>
                        <th>분류</th>
                        <th>매출</th>

                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="vo" items="${statisticsVO}">
                        <!-- 유저 정보-->
                        <tr>
                            <td>${vo.roomType}</td>
                            <td>ROOM</td>
                            <td align="right">${vo.todaySales}원</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


</html>