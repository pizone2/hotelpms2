
$(document).ready(function() {
    // roomNumber 클래스 클릭 시 모달 창 열기
    $('.roomNumber').click(function() {
        console.log("onclick");
        var note = $(this).attr('data-note');
        var savedName = $(this).attr('data-savedName');
        var cleanNum = $(this).attr('data-cleanNum');
        openModal(note,savedName,cleanNum);
    });

    // openModal 함수 정의
    function openModal(note,savedName,cleanNum) {
        console.log("onclickTest");
        $('.exampleModal').modal('show');
        $.ajax({
            type:"POST" ,
            url:"/clean/cleanStatus",
            data: {
                'cleanNum':cleanNum,
            },
            success: function (result) {
                console.log("확인여부")

            },
            error: function (result){
                alert("실패")
            }
        });





        $('#remarks').val(note); // 품목명 입력 태그
        // $('#savedName').val(savedName); // 품목명 입력 태그
        $('#savedName').attr('src', '/resources/static/images/'+savedName);

    console.log(savedName)
    }
});
// script.js 파일 예시

$('#exampleModal').on('hidden.bs.modal', function (e) {
    location.reload();
});