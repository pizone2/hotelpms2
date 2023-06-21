<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
