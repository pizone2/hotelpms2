$(document).ready(function() {
    // 체크박스 변경 이벤트 처리
    $('input[name="roomstatus"], input[name="floors"], input[name="roomTypes"]').change(function() {
        applyFilters(); // 필터링 로직 호출
    });

  // 체크 박스를 선택되었을 때 실행
    function applyFilters() {
        let selectedRoomstatus = [];
        let selectedFloors = [];
        let selectedRoomTypes = [];

        // roomstatus (객실상태) 별 필터
        $('input[name="roomstatus"]:checked').each(function() {
            selectedRoomstatus.push($(this).val());
        });

        // floors(층별) 필터
        $('input[name="floors"]:checked').each(function() {
            selectedFloors.push($(this).val());
        });

        // roomTypes(객실타입) 필터
        $('input[name="roomTypes"]:checked').each(function() {
            selectedRoomTypes.push($(this).val());
        });

        // 선택된 배열 확인
        console.log('층별 필터:', selectedRoomstatus);
        console.log('룸타입 필터:', selectedFloors);
        console.log('예약상태 필터:', selectedRoomTypes);


        // 확인하는 콘솔창
        console.log('체크박스가 선택되었습니다.');
    }
});
