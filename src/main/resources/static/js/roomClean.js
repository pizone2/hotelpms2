
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


window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple);
    }

    // Remove "datatable-sorter" class after provided table is initialized
    $(document).ready(function() {
        $('a.datatable-sorter').removeClass('datatable-sorter');
    });

    // td에 id 할당하기
    let tdElements = document.getElementsByTagName('td'); // 모든 <td> 요소 선택

    for (let i = 0; i < tdElements.length; i++) {
        let tdElement = tdElements[i];
        let textContent = tdElement.textContent.trim(); // <td>의 텍스트 내용 가져오기

        if (textContent === '확인') {
            tdElement.id = 'ok'; // 확인인 td에 id 할당
            tdElement.classList.add('p-3', 'border', 'mb-3', 'text-primary','fw-bolder'); // 확인인 td에 클래스 추가
        }
    }
});
