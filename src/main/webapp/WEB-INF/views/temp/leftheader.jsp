<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="layoutSidenav_nav">
    <nav class="sidenav shadow-right sidenav-light">
        <sec:authentication property="Principal" var="user"/>
        <div class="sidenav-menu">
            <div class="nav accordion" id="accordionSidenav">
                <c:if test="${user.roleName eq 'ROLE_ADMIN' || user.roleName eq 'ROLE_MANAGER'}">
                <div class="sidenav-menu-heading">객실</div>
                <!-- Sidenav Accordion (Dashboard)-->
                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                    <div class="nav-link-icon"><i data-feather="activity"></i></div>
                    객실관리
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                        <a class="nav-link" href="/room/roommanager">
                            실시간 객실 상태
                        </a>
                        <a class="nav-link" href="/roomStatus/roomStatusList">객실현황</a>
                        <a class="nav-link" href="/clean/roomClean">객실 청소상태</a>
                    </nav>
                </div>
                <!-- Sidenav Heading (Custom)-->
                <div class="sidenav-menu-heading">재고</div>
                <!-- Sidenav Accordion (Pages)-->
                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="nav-link-icon"><i data-feather="grid"></i></div>
                    재고관리
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePages" data-bs-parent="#accordionSidenav">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPagesMenu">
                        <!-- Nested Sidenav Accordion (Pages -> Account)-->
                        <a class="nav-link collapsed" href="/partnerAdmin/partnerList">
                            업체리스트
                        </a>
                        <!-- Nested Sidenav Accordion (Pages -> Authentication)-->
                        <a class="nav-link collapsed" href="/stock/managerStockList">재고리스트</a>
                        <!-- Nested Sidenav Accordion (Pages -> Error)-->
                        <a class="nav-link collapsed" href="/partnerStock/allItemsList">
                            전체품목리스트
                        </a>
                        <%
                            java.util.Date date = new java.util.Date();
                            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-01");
                            String formattedDate = sdf.format(date);
                        %>
                        <a class="nav-link" href="/partnerCalculate/list?date=<%= formattedDate %>">정산관리</a>
                    </nav>
                </div>

                <!-- Sidenav Heading (Custom)-->
                <div class="sidenav-menu-heading">고객</div>
                <!-- Sidenav Accordion (Applications)-->
                <a class="nav-link collapsed" href="/user/userList" >
                    <div class="nav-link-icon"><i data-feather="globe"></i></div>
                    고객관리
                </a>



                <!-- Sidenav Heading (Custom)-->
                <div class="sidenav-menu-heading">매출</div>
                <!-- Sidenav Accordion (Flows)-->
                <a class="nav-link collapsed" href="/">
                    <div class="nav-link-icon"><i data-feather="repeat"></i></div>
                    매출분석
                </a>
                <!-- Sidenav Heading (UI Toolkit)-->
                <div class="sidenav-menu-heading">설정</div>
                <!-- Sidenav Accordion (Layout)-->
                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="nav-link-icon"><i data-feather="layout"></i></div>
                    설정
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" data-bs-parent="#accordionSidenav">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavLayout">
                        <!-- Nested Sidenav Accordion (Layout -> Navigation)-->
                        <a class="nav-link collapsed" href="/room/roomSettingList">객실설정</a>
                        <!-- Nested Sidenav Accordion (Layout -> Container Options)-->
                        <a class="nav-link collapsed" href="/partnerAdmin/stockSetting">
                            객실별 소모품 설정
                        </a>
                    </nav>
                </div>
                </c:if>
                <c:if test="${user.roleName eq 'ROLE_STOCK'}">
                    <div class="sidenav-menu-heading">재고</div>
                    <!-- Sidenav Accordion (Components)-->
                    <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseComponents" aria-expanded="false" aria-controls="collapseComponents">
                        <div class="nav-link-icon"><i data-feather="package"></i></div>
                        재고관리
                        <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseComponents" data-bs-parent="#accordionSidenav">
                        <nav class="sidenav-menu-nested nav">
                            <a class="nav-link" href="/partnerStock/stockList">업체별 품목 리스트</a>
                            <a class="nav-link" href="/partnerManager/partnerManagerStockList">업체별 재고 관리 리스트</a>
                        </nav>
                    </div>
                </c:if>
                <c:if test="${user.roleName eq 'ROLE_CLEAN'}">
                    <div class="sidenav-menu-heading">청소</div>
                    <!-- Sidenav Accordion (Components)-->
                    <a class="nav-link collapsed" href="/clean/cleanSchedule">
                        <div class="nav-link-icon"><i data-feather="clock"></i></div>
                        <span class="schedule-icon">스케줄</span>
                    </a>
                </c:if>
            </div>
        </div>
        <!-- Sidenav Footer-->
        <div class="sidenav-footer">
            <div class="sidenav-footer-content">
                <div class="sidenav-footer-subtitle">Logged in as:</div>
                <div class="sidenav-footer-title"><sec:authentication property="principal.name"/></div>
            </div>
        </div>
    </nav>
</div>