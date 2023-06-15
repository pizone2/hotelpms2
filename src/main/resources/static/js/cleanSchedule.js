// JavaScript 코드
// 서버로 AJAX 요청 보내기
function updateCardContainer() {
    $.ajax({
        url: 'cleanCheckList',
        method: 'GET',
        success: function (checkList) {
            // 받은 HTML로 컨테이너를 업데이트합니다.
            $('#checkList').html(checkList);
        },
        error: function (error) {
            console.error('에러:', error);
        }
    });
}

// 초기에 컨테이너를 채우기 위해 updateCardContainer 함수를 호출합니다.
// updateCardContainer();

// 일정한 간격으로 컨테이너를 업데이트하기 위해 setInterval을 사용합니다.
setInterval(updateCardContainer, 5000); // 5초마다 업데이트합니다 (필요에 따라 조정)