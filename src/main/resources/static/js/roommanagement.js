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
        if (filtersApplied || selectedFloors.length > 0) {
            $('tr.floor').hide();
        }

        // 선택된 층만 표시
        selectedFloors.forEach(function(floor) {
            $('tr.floor[data-index="' + floor + '"]').show();
        });

        // 필터 적용 플래그를 true로 설정
        filtersApplied = true;
    }
});
