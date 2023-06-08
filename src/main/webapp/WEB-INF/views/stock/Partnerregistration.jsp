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
    <title>Edit User - SB Admin Pro</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
</head>
<body class="nav-fixed">
<!-- Header Section Begin -->
<c:import url="../temp/topheader.jsp"></c:import>
<!-- Header End -->
<div id="layoutSidenav">
    <!-- Header Section Begin -->
    <c:import url="../temp/leftheader.jsp"></c:import>
    <!-- Header End -->
    <div id="layoutSidenav_content">
        <main>
            <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                <div class="container-xl px-4">
                    <div class="page-header-content">
                        <div class="row align-items-center justify-content-between pt-3">
                            <div class="col-auto mb-3">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="user"></i></div>
                                    Edit User
                                </h1>
                            </div>
                            <div class="col-12 col-xl-auto mb-3">
                                <a class="btn btn-sm btn-light text-primary" href="user-management-list.html">
                                    <i class="me-1" data-feather="arrow-left"></i>
                                    Back to Users List
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main page content-->
            <div class="container-xl px-4 mt-4">
                <div class="row">
                    <div class="col-xl">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">협력업체 사업자 등록 </div>
                            <div class="card-body">
                                <form>
                                    <!-- Form Row-->
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (first name)-->
                                        <div class="row">
                                        <div class="col-md-8">
                                            <label class="small mb-1" for="inputFirstName">First name</label>
                                            <input class="form-control" id="inputFirstName2" type="text" placeholder="Enter your first name" value="Valerie" />
                                        </div>
                                        <div class="col-md-4 d-flex align-items-end" style="margin-top: 23px;" >
                                        <button class="btn btn-outline-blue me-2 my-1" type="button">Blue</button>
                                        </div>
                                        </div>
                                        <!-- Form Group (last name)-->
                                    </div>
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (first name)-->
                                        <div class="row">
                                            <div class="col-md-8">
                                                <label class="small mb-1" for="inputFirstName">First name</label>
                                                <input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie" />
                                            </div>
                                            <div class="col-md-4 d-flex align-items-end" style="margin-top: 23px;" >
                                                <button class="btn btn-outline-blue me-2 my-1" type="button">Blue</button>
                                            </div>
                                        </div>
                                        <!-- Form Group (last name)-->
                                    </div>
                                    <!-- Form Group (email address)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">상호명</label>
                                        <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" value="name@example.com" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">담당자명</label>
                                        <input class="form-control" id="inputEmailAddress2" type="email" placeholder="Enter your email address" value="name@example.com" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">주소</label>
                                        <input class="form-control" id="inputEmailAddress2" type="email" placeholder="Enter your email address" value="name@example.com" />
                                    </div>
                                    <!-- Form Group (Group Selection Checkboxes)-->
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="small mb-1">Group(s)</label>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input class="form-check-input" id="groupSales" type="checkbox" value="" checked />--%>
<%--                                            <label class="form-check-label" for="groupSales">Sales</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input class="form-check-input" id="groupDevs" type="checkbox" value="" checked />--%>
<%--                                            <label class="form-check-label" for="groupDevs">Developers</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input class="form-check-input" id="groupMarketing" type="checkbox" value="" />--%>
<%--                                            <label class="form-check-label" for="groupMarketing">Marketing</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input class="form-check-input" id="groupManagers" type="checkbox" value="" checked />--%>
<%--                                            <label class="form-check-label" for="groupManagers">Managers</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input class="form-check-input" id="groupCustomer" type="checkbox" value="" />--%>
<%--                                            <label class="form-check-label" for="groupCustomer">Customer</label>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <!-- Form Group (Roles)-->
                                    <div class="mb-3">
                                        <label class="small mb-1">Role</label>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected disabled>Select a role:</option>
                                            <option value="administrator" selected>Administrator</option>
                                            <option value="registered">Registered</option>
                                            <option value="edtior">Editor</option>
                                            <option value="guest">Guest</option>
                                        </select>
                                    </div>
                                    <!-- Submit button-->
                                    <button class="btn btn-primary" type="button">Save changes</button>
                                </form>
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
<script src="../js/scripts.js"></script>
</body>
</html>
