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
        <title>Dashboard - SB Admin Pro</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="/assets/img/favicon.png" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js" crossorigin="anonymous"></script>
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

    </head>
    <body class="nav-fixed">

    <c:import url="../temp/topheader.jsp"></c:import>
        <div id="layoutSidenav">
            <c:import url="../temp/leftheader.jsp"></c:import>
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="activity"></i></div>
                                            CleanSchedule
                                        </h1>
                                        <div class="page-header-subtitle">Example dashboard overview and content summary</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>

                    <!-- Large modal -->

                    <div class="modal fade" id="exampleModalLg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">객실 상태 보고 </h5>
                                    <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="mb-3"><label for="exampleFormControlInput1">객실</label><input class="form-control form-control-solid" id="exampleFormControlInput1" type="text" placeholder="101호"></div>
                                        <div class="mb-3"><label for="exampleFormControlInput1">소속</label><input class="form-control form-control-solid" id="exampleFormControlInput2" type="text" placeholder="청소2팀 001번"></div>
                                        <div class="mb-3"><label for="exampleFormControlInput1">사진첨부</label><input class="form-control form-control-solid" id="exampleFormControlInput3" type="text" placeholder="사진"></div>


                                        <div class="mb-0"><label for="exampleFormControlTextarea1">비고</label><textarea class="form-control form-control-solid" id="exampleFormControlTextarea1" rows="3"></textarea></div>
                                    </form>

                                </div>
                                <div class="modal-footer"><button class="btn btn-primary" type="button" data-bs-dismiss="modal">Close</button></div>
                            </div>
                        </div>
                    </div>





                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <div class="row">
                            <div class="col-xl-4 mb-4">
                                <!-- Dashboard example card 1-->
                                <a class="card lift h-100" href="#!">
                                    <div class="card-body d-flex justify-content-center flex-column">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="me-3">
                                                <i class="feather-xl text-primary mb-3" data-feather="package"></i>
                                                <h5>Powerful Components</h5>
                                                <div class="text-muted small">To create informative visual elements on your pages</div>
                                            </div>
                                            <img src="/assets/img/illustrations/browser-stats.svg" alt="..." style="width: 8rem" />
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-4 mb-4">
                                <!-- Dashboard example card 2-->
                                <a class="card lift h-100" href="#!">
                                    <div class="card-body d-flex justify-content-center flex-column">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="me-3">
                                                <i class="feather-xl text-secondary mb-3" data-feather="book"></i>
                                                <h5>Documentation</h5>
                                                <div class="text-muted small">To keep you on track when working with our toolkit</div>
                                            </div>
                                            <img src="/assets/img/illustrations/processing.svg" alt="..." style="width: 8rem" />
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-4 mb-4">
                                <!-- Dashboard example card 3-->
                                <a class="card lift h-100" href="#!">
                                    <div class="card-body d-flex justify-content-center flex-column">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="me-3">
                                                <i class="feather-xl text-green mb-3" data-feather="layout"></i>
                                                <h5>Pages &amp; Layouts</h5>
                                                <div class="text-muted small">To help get you started when building your new UI</div>
                                            </div>
                                            <img src="/assets/img/illustrations/windows.svg" alt="..." style="width: 8rem" />
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xxl-8">
                                <!-- Tabbed dashboard card example-->

                                <!-- 풀 캘린더 사용 -->
                                <div id='calendar' class="mb-4"></div>
                                <script>
                                    document.addEventListener('DOMContentLoaded', function() {
                                        let calendarEl = document.getElementById('calendar');
                                        let calendar = new FullCalendar.Calendar(calendarEl, {
                                            initialView: 'dayGridMonth',
                                            events: [

                                                <c:forEach var="event" items="${events}">
                                                {
                                                    title: '${event.scheduleNumber}',
                                                    start: '${event.scheduleStartdate}',
                                                    end: '${event.scheduleEnddate}'
                                                },
                                                </c:forEach>
                                            ]
                                        });
                                        calendar.render();
                                    });
                                </script>


                                <!-- Illustration dashboard card example-->
                                <div class="card mb-4">
                                    <div class="card-body py-5">
                                        <div class="d-flex flex-column justify-content-center">
                                            <img class="img-fluid mb-4" src="/assets/img/illustrations/data-report.svg" alt="" style="height: 10rem" />
                                            <div class="text-center px-0 px-lg-5">
                                                <h5>New reports are here! Generate custom reports now!</h5>
                                                <p class="mb-4">Our new report generation system is now online. You can start creating custom reporting for any documents available on your account.</p>
                                                <a class="btn btn-primary p-3" href="#!">Get Started</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-xxl-4">
                                <div class="row">
                                    <div class="col-xl-6 col-xxl-12">
                                        <!-- Team members / people dashboard card example-->
                                        <div class="card mb-4">
                                            <div class="card-header">체크 리스트

                                                    <button class="btn" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalLg">
                                                        <span class="material-symbols-outlined align-middle">mail</span>
                                                    </button>

                                            </div>
                                            <div class="card-body">
                                                <!-- Item 1-->
                                                <div class="d-flex align-items-center justify-content-between mb-4">
                                                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                                                        <div class="avatar avatar-xl me-3 bg-gray-200"><img class="avatar-img img-fluid" src="/assets/img/illustrations/profiles/profile-1.png" alt="" /></div>
                                                        <div class="d-flex flex-column fw-bold">
                                                            <a class="text-dark line-height-normal mb-1" href="#!">Sid Rooney</a>
                                                            <div class="small text-muted line-height-normal">Position</div>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown no-caret">
                                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle" id="dropdownPeople1" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="more-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up" aria-labelledby="dropdownPeople1">
                                                            <a class="dropdown-item" href="#!">Action</a>
                                                            <a class="dropdown-item" href="#!">Another action</a>
                                                            <a class="dropdown-item" href="#!">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Item 2-->
                                                <div class="d-flex align-items-center justify-content-between mb-4">
                                                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                                                        <div class="avatar avatar-xl me-3 bg-gray-200"><img class="avatar-img img-fluid" src="/assets/img/illustrations/profiles/profile-2.png" alt="" /></div>
                                                        <div class="d-flex flex-column fw-bold">
                                                            <a class="text-dark line-height-normal mb-1" href="#!">Keelan Garza</a>
                                                            <div class="small text-muted line-height-normal">Position</div>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown no-caret">
                                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle" id="dropdownPeople2" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="more-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up" aria-labelledby="dropdownPeople2">
                                                            <a class="dropdown-item" href="#!">Action</a>
                                                            <a class="dropdown-item" href="#!">Another action</a>
                                                            <a class="dropdown-item" href="#!">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Item 3-->
                                                <div class="d-flex align-items-center justify-content-between mb-4">
                                                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                                                        <div class="avatar avatar-xl me-3 bg-gray-200"><img class="avatar-img img-fluid" src="/assets/img/illustrations/profiles/profile-3.png" alt="" /></div>
                                                        <div class="d-flex flex-column fw-bold">
                                                            <a class="text-dark line-height-normal mb-1" href="#!">Kaia Smyth</a>
                                                            <div class="small text-muted line-height-normal">Position</div>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown no-caret">
                                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle" id="dropdownPeople3" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="more-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up" aria-labelledby="dropdownPeople3">
                                                            <a class="dropdown-item" href="#!">Action</a>
                                                            <a class="dropdown-item" href="#!">Another action</a>
                                                            <a class="dropdown-item" href="#!">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Item 4-->
                                                <div class="d-flex align-items-center justify-content-between mb-4">
                                                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                                                        <div class="avatar avatar-xl me-3 bg-gray-200"><img class="avatar-img img-fluid" src="/assets/img/illustrations/profiles/profile-4.png" alt="" /></div>
                                                        <div class="d-flex flex-column fw-bold">
                                                            <a class="text-dark line-height-normal mb-1" href="#!">Kerri Kearney</a>
                                                            <div class="small text-muted line-height-normal">Position</div>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown no-caret">
                                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle" id="dropdownPeople4" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="more-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up" aria-labelledby="dropdownPeople4">
                                                            <a class="dropdown-item" href="#!">Action</a>
                                                            <a class="dropdown-item" href="#!">Another action</a>
                                                            <a class="dropdown-item" href="#!">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Item 5-->
                                                <div class="d-flex align-items-center justify-content-between mb-4">
                                                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                                                        <div class="avatar avatar-xl me-3 bg-gray-200"><img class="avatar-img img-fluid" src="/assets/img/illustrations/profiles/profile-5.png" alt="" /></div>
                                                        <div class="d-flex flex-column fw-bold">
                                                            <a class="text-dark line-height-normal mb-1" href="#!">Georgina Findlay</a>
                                                            <div class="small text-muted line-height-normal">Position</div>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown no-caret">
                                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle" id="dropdownPeople5" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="more-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up" aria-labelledby="dropdownPeople5">
                                                            <a class="dropdown-item" href="#!">Action</a>
                                                            <a class="dropdown-item" href="#!">Another action</a>
                                                            <a class="dropdown-item" href="#!">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Item 6-->
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                                                        <div class="avatar avatar-xl me-3 bg-gray-200"><img class="avatar-img img-fluid" src="/assets/img/illustrations/profiles/profile-6.png" alt="" /></div>
                                                        <div class="d-flex flex-column fw-bold">
                                                            <a class="text-dark line-height-normal mb-1" href="#!">Wilf Ingram</a>
                                                            <div class="small text-muted line-height-normal">Position</div>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown no-caret">
                                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle" id="dropdownPeople6" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="more-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up" aria-labelledby="dropdownPeople6">
                                                            <a class="dropdown-item" href="#!">Action</a>
                                                            <a class="dropdown-item" href="#!">Another action</a>
                                                            <a class="dropdown-item" href="#!">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-xxl-12">
                                        <!-- Project tracker card example-->

                                    </div>
                                </div>
                                <!-- Illustration dashboard card example-->

                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-end small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/assets/demo/chart-area-demo.js"></script>
        <script src="/assets/demo/chart-pie-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="/js/datatables/datatables-simple-demo.js"></script>
    </body>
</html>
