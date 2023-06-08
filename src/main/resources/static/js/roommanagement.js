

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
                tdElement.style.backgroundColor = "#ff662e";
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



var divElements = document.getElementsByTagName('div');
var roomstatusnames1 = '예약가능'
var roomstatusnames2 = '재실'
var roomstatusnames3 = '예약완료'
var roomstatusnames4 = '청소요청'
var roomstatusnames5 = '청소중'
var roomstatusnames6 = '퇴실'
var roomstatusnames7 = '객실점검'
// 클래스 이름이 ${status.roomStatus}인 div 요소들을 카운트할 변수를 초기화합니다.
var count1 = 0;
var count2 = 0;
var count3 = 0;
var count4 = 0;
var count5 = 0;
var count6 = 0;
var count7 = 0;



// 각 div 요소에 대해 반복하면서 클래스 이름을 확인하고 카운트를 증가시킵니다.
for (var i = 0; i < divElements.length; i++) {
    var className = divElements[i].className;

    // 클래스 이름이 ${status.roomStatus}와 일치하는 경우에만 카운트를 증가시킵니다.
    if (className.includes(roomstatusnames1)) {
        count1++;
    }
    if (className.includes(roomstatusnames2)) {
        count2++;
    }
    if (className.includes(roomstatusnames3)) {
        count3++;
    }
    if (className.includes(roomstatusnames4)){
        count4++;
    }
    if (className.includes(roomstatusnames5)) {
        count5++;
    }
    if (className.includes(roomstatusnames6)) {
        count6++;
    }
    if (className.includes(roomstatusnames7)) {
        count7++;
    }

}

// 결과를 출력합니다.
console.log('${status.roomStatus} 클래스를 가진 div의 개수: ' + count1);
console.log('class ${status.roomStatus2}을 가진 div의 개수: ' + count2);
console.log('class ${status.roomStatus3}을 가진 div의 개수: ' + count3);
console.log('class ${status.roomStatus4}을 가진 div의 개수: ' + count4);
console.log('class ${status.roomStatus5}을 가진 div의 개수: ' + count5);
console.log('class ${status.roomStatus6}을 가진 div의 개수: ' + count6);
console.log('class ${status.roomStatus7}을 가진 div의 개수: ' + count7);

var count1Element = document.getElementsByClassName('roomstatusname1')[0];
count1Element.innerHTML = count1;
var count2Element = document.getElementsByClassName('roomstatusname2')[0];
count2Element.innerHTML = count2;
var count3Element = document.getElementsByClassName('roomstatusname3')[0];
count3Element.innerHTML = count3;
var count4Element = document.getElementsByClassName('roomstatusname4')[0];
count4Element.innerHTML = count4;
var count5Element = document.getElementsByClassName('roomstatusname5')[0];
count5Element.innerHTML = count5;
var count6Element = document.getElementsByClassName('roomstatusname6')[0];
count6Element.innerHTML = count6;
var count7Element = document.getElementsByClassName('roomstatusname7')[0];
count7Element.innerHTML = count7;



$(document).ready(function() {
    // 체크박스가 선택된 경우에만 숨기기로 표시되는 filtersApplied 변수를 선언합니다. (체크박스가 선택되지 않은 경우 모든 방이 표시됩니다.)
    let filtersApplied = false;

    // 체크박스 값이 변경될 때마다 실행됩니다.
    $('input[name="roomstatus"], input[name="floors"], input[name="roomTypes"]').change(function() {
        applyFilters();
    });

    // 체크박스가 선택되었을 때 실행됩니다.
    function applyFilters() {
        // 객실 상태
        let selectedRoomstatus = [];
        // 층별
        let selectedFloors = [];
        // 객실 유형
        let selectedRoomTypes = [];

        // 객실 상태 필터
        $('input[name="roomstatus"]:checked').each(function() {
            selectedRoomstatus.push($(this).val());
        });

        // 층별 필터
        $('input[name="floors"]:checked').each(function() {
            selectedFloors.push($(this).val());
        });

        // 객실 유형 필터
        $('input[name="roomTypes"]:checked').each(function() {
            selectedRoomTypes.push($(this).val());
        });

        // 필터 상태를 확인하기 위해 콘솔에 출력합니다.
        console.log('객실 상태 필터:', selectedRoomstatus);
        console.log('객실 층별 필터:', selectedFloors);
        console.log('객실 타입 필터:', selectedRoomTypes);

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 하나 이상의 층이 선택된 경우 모든 층을 숨깁니다.
        if (filtersApplied || selectedFloors.length > 0) {
            $('tr.floor').hide();
        } else if (filtersApplied || selectedFloors.length === 0) {
            $('tr.floor').show();
        }

        // 선택된 층만 보여줍니다.
        if (selectedFloors.length === 0) {
            $('tr.floor').show();
        } else {
            selectedFloors.forEach(function(floor) {
                $('tr.floor[data-index="' + floor + '"]').show();
            });
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // 필터를 적용하는 함수
        function applyFilters() {
            // 선택된 객실 유형
            let selectedRoomTypes = [];

            // 객실 유형 필터
            $('input[name="roomTypes"]:checked').each(function() {
                selectedRoomTypes.push($(this).val());
            });

            // 모든 td.tdroom 요소를 숨깁니다.
            $('td.tdroom').hide();

            // 선택된 객실 유형에 해당하는 td.tdroom 요소만 보여줍니다.
            if (selectedRoomTypes.length > 0) {
                let selector = selectedRoomTypes.map(function(roomType) {
                    return 'td.tdroom.' + roomType;
                }).join(',');
                $(selector).show();
            } else {
                // 선택된 객실 유형이 없는 경우 모든 td.tdroom 요소를 보여줍니다.
                $('td.tdroom').show();
            }
        }

        // 체크박스 값이 변경될 때마다 필터를 적용합니다.
        $('input[name="roomTypes"]').change(function() {
            applyFilters();
        });

        // 페이지가 로드될 때 초기 필터를 적용합니다.
        applyFilters();



        ////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // 하나 이상의 객실 상태 체크박스가 선택된 경우 모든 방을 숨깁니다.
        if (filtersApplied || selectedRoomstatus.length > 0) {
            $('td.tdroom').hide();
        } else if (filtersApplied || selectedRoomstatus.length == 0) {
            $('td.tdroom').show();
        }

        // 선택된 객실 상태에 해당하는 td.tdroom 요소만 보여줍니다.
        if (selectedRoomstatus.length === 0) {
            $('td.tdroom').show();
        } else {
            $('td.tdroom').hide(); // 모든 td.tdroom 요소를 숨깁니다.
            selectedRoomstatus.forEach(function(roomstatus) {
                $('td.tdroom').filter(function() {
                    return $(this).hasClass(roomstatus);

                }).show(); // 선택된 객실 상태에 해당하는 td.tdroom 요소만 보여줍니다.
            });
        }

        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 필터가 적용되었음을 표시하는 플래그를 true로 설정합니다.
        filtersApplied = true;

        // 다시 시작할 때 선택된 방의 수만 계산합니다.
        let visibleTdroomElements = $('.tdroom:visible');
        console.log('<td class="tdroom">의 개수:', visibleTdroomElements.length);
        divElement.text(visibleTdroomElements.length / 2 + "개");
    }

    //////////////////////////////////////////
    // 선택된 방의 개수 계산

    // class="tdroom"인 모든 요소의 개수를 구합니다.
    let tdroomCount = $('.tdroom').length / 2;

    // 콘솔 창에서 방의 개수를 확인합니다.
    console.log('<td> 요소의 개수:', tdroomCount);

    // class="form-check-label-tdroomCount"인 요소를 변수로 선언합니다.
    let divElement = $('.form-check-label-tdroomCount');

    // divElement 변수에 방의 개수를 넣습니다.
    divElement.text(tdroomCount + "개");
});
