

document.addEventListener("DOMContentLoaded", function() {
    var tdElements = document.querySelectorAll("td[id^='pa']");
    var divElements = document.querySelectorAll("div[id^='ch']");

    for (var i = 0; i < tdElements.length; i++) {
        var tdElement = tdElements[i];
        var divElement = divElements[i];
        //var roomNumber = ""; // ${room.roomNumber}에 해당하는 값을 설정
        var roomNumber = tdElement.id.substring(2);

        if (tdElement.id === "pa" + roomNumber && divElement.id === "ch" + roomNumber) {
            // ${room.roomNumber}와 일치하는 요소에 대해 동작 수행
            // 예시: 스타일 변경
            tdElement.className = divElement.className;

            // 원하는 작업 수행
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

        // 선택된 층이 하나 이상일 때 전체 층 숨김 표시
        if (filtersApplied || selectedFloors.length > 0 ) {
            $('tr.floor').hide();
        }

        // 선택된 층만 표시
        selectedFloors.forEach(function(floor) {
            $('tr.floor[data-index="' + floor + '"]').show();
        });


        //객실타입 체크박스가 1개 이상 선택되면 전체 객실을 숨김 표시
        if (filtersApplied || selectedRoomTypes.length > 0) {
            $('td.tdroom').hide();
        }

        //체크밗스에 선택된 값을 roomType 변수에 담아서 td.tdroom.roomType 클래스명인 애들만 보여줘
        selectedRoomTypes.forEach(function(roomType) {
            $('td.tdroom.' + roomType).show();
        });

        //
        let matchingTdElements = $('td.tdroom.' + selectedRoomTypes.join(',td.tdroom.'));
        matchingTdElements.show();
        matchingTdElements.each(function(index, element) {
            console.log($(element).attr('class'));
        });

        // 필터 적용 플래그를 true로 설정
        filtersApplied = true;


        // 재시작되었을 때 선택된 룸 갯수만 세주기
        let visibleTdroomElements = $('.tdroom:visible');
        console.log('<td> 중 class="tdroom"인것의 갯수는:' + visibleTdroomElements.length);
        divElement.text(visibleTdroomElements.length + "개");
    }


    ////////////// 선택된 룸 갯수를 세주는 곳//////////////////////////////////////
    // class="tdroom" 의 갯수는 총 몇개니?
    let tdroomCount = $('.tdroom').length;
   //let visibleTdroomElements = $('.tdroom:visible');
    // 콘솔창에서 룸갯수 확인
    console.log('Number of <td> elements with class="tdroom":', tdroomCount);

    // form-check-label-tdroomCount 클래스를 let divElement 변수로 선언 
    let divElement = $('.form-check-label-tdroomCount');

    //divElement 변수에 갯수 넣어주기
    divElement.text(tdroomCount + "개");
});


