
    <div class="card-body">
        <c:forEach var="request" items="${request}">
            <c:forEach var="request2" items="${request.reservedVOS}">

                <!-- Item 1-->
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="d-flex align-items-center flex-shrink-0 me-3">
                        <div class="avatar avatar-xl me-3 bg-gray-200"><img
                                class="avatar-img img-fluid"
                                src="/assets/img/illustrations/profiles/profile-1.png" alt=""/>
                        </div>
                        <div class="d-flex flex-column fw-bold">
                            <div class="text-dark line-height-normal mb-1" href="#!">청소${request.scheduleNumber}팀</div>
                            <div class="small text-muted line-height-normal">${request2.roomNumber}</div>
                        </div>
                    </div>
                    <div class="dropdown no-caret">
                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle"
                                id="dropdownPeople1" type="button" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false"><i
                                data-feather="more-vertical"></i></button>
                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up"
                             aria-labelledby="dropdownPeople1">
                            <a class="dropdown-item" href="#!">청소완료</a>
                            <a class="dropdown-item" href="#!">Another action</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:forEach>
    </div>
