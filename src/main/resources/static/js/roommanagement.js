

document.addEventListener("DOMContentLoaded", function() {
    let tdElements = document.querySelectorAll("td[id^='pa']");
    let divElements = document.querySelectorAll("div[id^='ch']");

    for (let i = 0; i < tdElements.length; i++) {
        let tdElement = tdElements[i];
        let divElement = divElements[i];
        let roomNumber = tdElement.id.substring(2);

        if (tdElement.id === "pa" + roomNumber && divElement.id === "ch" + roomNumber) {

            tdElement.className = divElement.className;

            if (tdElement.className.includes("예약완료")) {
                tdElement.classList.add("bg-blue", "text-white");
            } else if (tdElement.className.includes("청소요청")) {
                tdElement.classList.add("bg-info", "text-white");
            } else if (tdElement.className.includes("예약가능")) {
                tdElement.style.backgroundColor = "#1a1f71";
                tdElement.style.color = "white";
            } else if (tdElement.className.includes("재실")) {
                tdElement.classList.add("bg-warning", "text-white");
            } else if (tdElement.className.includes("청소중")) {
                tdElement.style.backgroundColor = "#8B4513";
                tdElement.style.color = "white";
            } else if (tdElement.className.includes("퇴실")) {
                tdElement.classList.add("bg-green", "text-white");
            } else if (tdElement.className.includes("객실점검")) {
                tdElement.style.backgroundColor = "#00673f";
                tdElement.style.color = "white";
            }

        }
    }
});



$(document).ready(function() {
    // 체크박스가 표시되었을 때만 숨김처리 될 수 있도록 filtersApplied 변수 선언 (체크박스를 선택 안하면 전체 객실이 표시)
    let filtersApplied = false;

    // 체크 박스 값이 변경될 때 마다 실행
    $('input[name="roomstatus"], input[name="floors"], input[name="roomTypes"]').change(function() {
        applyFilters();
    });

    // 체크박스 선택 시 실행
    function applyFilters() {
        // 객실 상태
        let selectedRoomstatus = [];
        // 층별
        let selectedFloors = [];
        // 객실 유형별
        let selectedRoomTypes = [];

        // 객실 상태 필터
        $('input[name="roomstatus"]:checked').each(function() {
            selectedRoomstatus.push($(this).val());
        });

        // 층별 필터
        $('input[name="floors"]:checked').each(function() {
            selectedFloors.push($(this).val());
        });

        // 객실 유형별 필터
        $('input[name="roomTypes"]:checked').each(function() {
            selectedRoomTypes.push($(this).val());
        });

        // 필터 상태값 확인하는 콘솔창
        console.log('층별 필터:', selectedRoomstatus);
        console.log('객실 유형 필터:', selectedFloors);
        console.log('예약 상태 필터:', selectedRoomTypes);

/////////////////////////////// ////층별 필터처리///////////////////////////////////////////////////////////////////////

       // 선택된 층이 하나 이상일 때 전체 층 숨김 표시
        if (filtersApplied || selectedFloors.length > 0 ) {
            $('tr.floor').hide();
        } else if (filtersApplied || selectedFloors.length == 0 ) {
            $('tr.floor').show();
        }

        // 선택된 층만 표시
        if (selectedFloors.length === 0) {
            $('tr.floor').show();
        } else {
            selectedFloors.forEach(function(floor) {
                $('tr.floor[data-index="' + floor + '"]').show();
            });
        }

//////////////////////////////////////////////////////////////////////////////////////////////////////////

        //객실타입 체크박스가 1개 이상 선택되면 전체 객실을 숨김 표시
        if (filtersApplied || selectedRoomTypes.length > 0) {
            $('td.tdroom').hide();
        } else if  (filtersApplied || selectedRoomTypes.length  == 0) {
            $('td.tdroom').show();
        }
        // //체크박스에 선택된 값을 roomType 변수에 담아서 td.tdroom.roomType 클래스명인 애들만 보여줘

        // 체크박스 값이 변경될 때마다 필터 적용
        $('input[name="roomTypes"]').change(function () {
            applyFilters();
        });
        // 필터 적용 함수
        function applyFilters() {
            // 객실 유형별 필터
            if (selectedRoomTypes.length === 0) {
                $('td.tdroom').show();
            } else {
                $('td.tdroom').hide(); // 모든 td.tdroom 요소 숨김
                selectedRoomTypes.forEach(function (roomType) {
                    $('td.tdroom.' + roomType).show(); // 선택된 roomType에 해당하는 td.tdroom 요소만 보여줌
                });
            }


        }


// // 체크박스 값이 변경될 때마다 필터 적용
//         $('input[name="roomTypes"]').change(function () {
//             applyFilters();
//         });
//         if (selectedRoomTypes.length === 0) {
//             $('td.tdroom').show();
//         } else {
//             selectedRoomTypes.forEach(function (roomType) {
//                 $('td.tdroom').filter(function () {
//                     return $(this).attr('class').split(' ').some(function (className) {
//                         return className.startsWith('tdroom') && className.includes(roomType);
//                     });
//                 }).show();
//             });
//         }
//         let matchingTdElements = $(selectedRoomTypes.map(roomType => 'td.tdroom.' + roomType).join(','));
//         matchingTdElements.show();
//         matchingTdElements.each(function(index, element) {
//             console.log($(element).attr('class'));
//         });

    //////////////////////////////////////////////////////////////////////////////////////////

        //객실상태 체크박스가 1개 이상 선택되면 전체 객실을 숨김 표시
        if (filtersApplied || selectedRoomstatus.length > 0) {
            $('td.tdroom').hide();
        }


        // if ( selectedRoomstatus.length === 0) {
        //     $('td.tdroom').show();
        // } else {
        //     selectedRoomstatus.forEach(function (roomstatus) {
        //         console.log("안녕", roomstatus);
        //         $('td.tdroom').filter(function () {
        //             return $(this).attr('class').match(new RegExp("^tdroom.*" + roomstatus + "*"));
        //         }).show();
        //     });
        // }
        if (selectedRoomstatus.length === 0) {
            $('td.tdroom').show();
        } else {
            selectedRoomstatus.forEach(function (roomstatus) {
                console.log("안녕", roomstatus);
                $('td.tdroom').filter(function () {
                    return $(this).hasClass(roomstatus);
                }).show();
            });
        }
    ///////////////////////////////////////////////////////////////////////////////////////////
        // 필터 적용 플래그를 true로 설정
        filtersApplied = true;


        // 재시작되었을 때 선택된 룸 갯수만 세주기
        let visibleTdroomElements = $('.tdroom:visible');
        console.log('<td> 중 class="tdroom"인것의 갯수는:' + visibleTdroomElements.length);
        divElement.text(visibleTdroomElements.length/2 + "개");
    }


    ////////////// 선택된 룸 갯수를 세주는 곳//////////////////////////////////////
    // class="tdroom" 의 갯수는 총 몇개니?
    let tdroomCount = $('.tdroom').length/2;
   //let visibleTdroomElements = $('.tdroom:visible');
    // 콘솔창에서 룸갯수 확인
    console.log('Number of <td> elements with class="tdroom":', tdroomCount);

    // form-check-label-tdroomCount 클래스를 let divElement 변수로 선언 
    let divElement = $('.form-check-label-tdroomCount');

    //divElement 변수에 갯수 넣어주기
    divElement.text(tdroomCount + "개");
});


