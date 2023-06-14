
$(document).ready(function() {
    // roomNumber 클래스 클릭 시 모달 창 열기
    $('.roomNumber').click(function() {
        console.log("onclick");
        var note = $(this).attr('data-note');
        var savedName = $(this).attr('data-savedName');
        openModal(note,savedName);
    });

    // openModal 함수 정의
    function openModal(note,savedName) {
        console.log("onclickTest");
        $('.exampleModal').modal('show');


        $('#remarks').val(note); // 품목명 입력 태그
        // $('#savedName').val(savedName); // 품목명 입력 태그
        $('#savedName').attr('src', 'webapp/resources/static/images/'+savedName);
    }
});