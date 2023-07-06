<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="card-body">
    <c:forEach var="request" items="${request}">
        <c:forEach var="request2" items="${request.reservedVOS}">
            <c:if test="${request2.roomStatus eq '청소요청'}">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                        <div class="avatar avatar-xl me-3 bg-gray-200"><img
                                class="avatar-img img-fluid"
                                src="/assets/img/illustrations/profiles/profile-1.png" alt=""/>
                        </div>
                        <div class="d-flex flex-column fw-bold">
                            <div class="text-dark line-height-normal mb-1" href="#!">청소${request.scheduleNumber}팀 : 청소요청</div>
                            <div class="small text-muted line-height-normal">방번호 : ${request2.roomNumber} 호</div>
                        </div>
                    </div>
                    <button class="btn btn-dark" onclick="CleaningInProgress('${request2.roomNumber}')">청소시작</button>
                </div>
            </c:if>
        </c:forEach>
        <c:forEach var="request2" items="${request.reservedVOS}">
            <c:if test="${request2.roomStatus eq '청소중'}">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                        <div class="avatar avatar-xl me-3 bg-gray-200"><img
                                class="avatar-img img-fluid"
                                src="/assets/img/illustrations/profiles/profile-1.png" alt=""/>
                        </div>
                        <div class="d-flex flex-column fw-bold">
                            <span class="text-dark line-height-normal mb-1" href="#!">청소${request.scheduleNumber}팀 : 청소요청</span><div class="cleaning">청소중</div>
                            <div class="small text-muted line-height-normal">방번호 : ${request2.roomNumber} 호</div>
                        </div>
                    </div>
                    <button class="btn btn-dark" onclick="CleaningComplete('${request2.roomNumber}')">청소완료</button>
                </div>
            </c:if>
        </c:forEach>
    </c:forEach>
</div>
