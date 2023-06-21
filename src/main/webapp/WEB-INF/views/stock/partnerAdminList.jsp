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
    <title>ProductLists List - SB Admin Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="/assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        thead th svg {
            display: none;
        }

        .truncate-text {
            display: inline-block;
            width: 100px; /* 표시할 글자 수에 맞게 조정하세요 */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
                                    PartnerAdmin List
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main page content-->
            <div class="container-fluid px-4">
                <div class="card">
                    <div class="card-body">
                        <button class="btn btn-outline-dark" type="button" style="margin-bottom: 15px;" data-bs-toggle="modal" data-bs-target="#exampleModalLg1">업체등록</button>
                        <%--<button class="btn btn-outline-dark" type="button" style="margin-bottom: 15px;" data-bs-toggle="modal" data-bs-target="#exampleModalLg2">업체수정</button>--%>
                        <button class="btn btn-outline-dark" type="button" style="margin-bottom: 15px;" id="btn-delete">업체삭제</button>
                        <button class="btn btn-outline-dark" type="button" style="margin-bottom: 15px;" id="btn-register">상태변경</button>

                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th data-orderable="false"><input type="checkbox" id="checkAll" class="myCheckbox"></th>
                                <th>상호번호</th>
                                <th>상호명</th>
                                <th>담당자명</th>
                                <th>전화번호</th>
                                <th>이메일</th>
                                <th>등록일</th>
                                <th>구분</th>
                                <th>등록상태</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th></th>
                                <th>상호번호</th>
                                <th>상호명</th>
                                <th>담당자명</th>
                                <th>전화번호</th>
                                <th>이메일</th>
                                <th>등록일</th>
                                <th>구분</th>
                                <th>등록상태</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="vo" items="${list}">
                                <c:choose>
                                    <c:when test="${vo.approval == false}">
                                        <c:set var="status" value="등록신청" />
                                    </c:when>
                                    <c:when test="${vo.approval == true}">
                                        <c:set var="status" value="등록완료" />
                                    </c:when>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${vo.sectors == 'ROLE_STOCK'}">
                                        <c:set var="role" value="상품 판매" />
                                    </c:when>
                                    <c:when test="${vo.sectors == 'ROLE_CLEAN'}">
                                        <c:set var="role" value="용역 서비스" />
                                    </c:when>
                                </c:choose>

                                <!-- 유저 정보-->
                                <tr>
                                    <%--<div class="businessNum" data-num="${vo.businessNumber}"></div>--%>
                                    <td><input type="checkbox" class="myCheckbox"></td>
                                    <td>${vo.businessNumber}</td>
                                     <td>${vo.companyName}</td>
                                    <td>${vo.contactName}</td>
                                    <td>${vo.phoneNumber}</td>
                                    <td>${vo.email}</td>
                                    <td>${vo.registrationDate}</td>
                                    <td>${role}</td>
                                    <td>${status}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        <%--insert 모달--%>
            <div class="modal fade" id="exampleModalLg1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <form action="/partner/join" method="post" id="businessForm" >
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel1">협력업체 사업자 등록</h5>
                                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <!-- Form Row-->
                            <div class="modal-body">
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="row">
                                    <div class="col-md-8">
                                        <label class="small mb-1" for="businessNumber">사업자 번호 </label>
                                        <input class="form-control" id="businessNumber" name="businessNumber" type="text" placeholder="사업자번호를 -를 제외하고 입력해주세요" value="" />
                                    </div>
                                    <div class="col-md-4" style="margin-top: 23px;" >
                                        <button class="btn btn-outline-dark btn-business me-2 my-1" id="businessNumButton" type="button">확인</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-5">
                                    <label class="small mb-1" for="ceoName">대표자</label>
                                    <input class="form-control" id="ceoName" type="text" name="ceoName" placeholder="대표자 이름을 입력해주세요" value="" />
                                </div>
                                <div class="col-md-5">
                                    <label class="small mb-1" for="registrationDate">개업일자</label>
                                    <input class="form-control" id="registrationDate" name="registrationDate" type="date" placeholder="" value="" />
                                </div>
                                <%--                                            <div class="col-md-4 d-flex align-items-end" style="margin-top: 23px;" >--%>
                                <%--                                                <button class="btn btn-outline-blue me-2 my-1" type="button">확인</button>--%>
                                <%--                                            </div>--%>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-5">
                                    <label class="small mb-1" for="conpanyName">상호명</label>
                                    <input class="form-control" id="conpanyName" type="text" name="companyName" placeholder="상호명을 입력해주세요" value="" />
                                </div>
                                <div class="col-md-5">
                                    <label class="small mb-1" for="email">사업자 E-mail</label>
                                    <input class="form-control" id="email" type="email" name="email" placeholder="사업자 E-mail을 입력해주세요" value="" />
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-5">
                                    <label class="small mb-1" for="contactName">담당자</label>
                                    <input class="form-control" id="contactName" name="contactName" type="text" placeholder="업무 담당자명을 입력해주세요" value="" />
                                </div>
                                <div class="col-md-5">
                                    <label class="small mb-1" for="phoneNumber">유선 전화번호</label>
                                    <input class="form-control" id="phoneNumber"  name="phoneNumber" type="text" placeholder="010-0000-0000" value="" />
                                </div>
                            </div>

                            <%-- ////////////////////////////////////////////////사업자 주소 입력 ///////////////////////////////////////--%>
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="row">
                                    <div class="col-md-2">
                                        <label class="small mb-1" for="sample4_postcode">사업자 주소 </label>
                                        <input class="form-control" id="sample4_postcode" type="text" placeholder="우편번호" value="" />
                                    </div>
                                    <div class="col-md-4 d-flex align-items-end" style="margin-top: 23px;">
                                        <button class="btn btn-outline-dark me-2 my-1"  id="ddd" onclick="sample4_execDaumPostcode()" type="button">우편번호 찾기</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5">
                                        <input class="form-control" id="sample4_roadAddress" type="text" placeholder="도로명 주소" value="" />
                                    </div>
                                    <div class="col-md-5">
                                        <input class="form-control" id="sample4_jibunAddress" type="text" placeholder="지번주소" value="" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5">
                                        <input class="form-control" id="sample4_extraAddress" type="text" placeholder="참고주소" value="" />
                                    </div>
                                    <div class="col-md-5">
                                        <input class="form-control" id="sample4_detailAddress" type="text" placeholder="상세주소" value="" />
                                    </div>
                                </div>
                            </div>
                            <input  class="myDiv" id="address" name="address">


                            <%-- <input type="text" id="address" name="address">--%>
                            <%--  ////////////////////////////////////////////////////////////////////////////////////--%>


                            <div class="row gx-3 mb-3">
                                <div class="col-md-7">
                                    <label class="small mb-1">업태 구분</label>
                                    <select class="form-select"  id="sectors" name="sectors" aria-label="Default select example">
                                        <option selected disabled>사업자 업태를 선택해주세요</option>
                                        <option value="ROLE_STOCK" selected>상품 판매</option>
                                        <option value="ROLE_CLEAN">용역 서비스</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row gx-3 mb-3">
                                <div class="col-md-5">
                                    <label class="small mb-1">은행</label>
                                    <select class="form-select" id="form-select" aria-label="Default select example">
                                        <option selected disabled>사업자 업태를 선택해주세요</option><option value="KB국민은행">KB국민은행</option><option value="신한은행">신한은행</option><option value="우리은행">우리은행</option><option value="하나은행">하나은행</option><option value="SC제일은행">SC제일은행</option><option value="케이뱅크">케이뱅크</option><option value="카카오뱅크">카카오뱅크</option><option value="토스뱅크">토스뱅크</option><option value="NH농협은행">NH농협은행</option><option value="수협은행">수협은행</option><option value="대구은행">대구은행</option><option value="부산은행">부산은행</option><option value="경남은행">경남은행</option><option value="광주은행">광주은행</option><option value="제주은행">제주은행</option>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <label class="small mb-1" for="account">정산 계좌</label>
                                    <input class="form-control" id="account" type="text" placeholder="정산계좌명을 입력해주세요" value="" />
                                </div>
                            </div>
                            <input class="myDiv"  id="settlementAccount"  name="settlementAccount">

                                <div class="modal-footer">
                            <button class="btn btn-dark" id="btn3"  type="button">사업자 등록 요청</button>
                                </div>
                            </div>
                        </form>
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
<script src="/js/datatables/datatables-simple-demo.js"></script>
<script src="../js/biz2.js"></script>
</body>
</html>
