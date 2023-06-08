$("#btn-reset").click(function() {
    // 확인 대화상자 표시
    var confirmed = confirm("초기화 하시겠습니까?");

    // 사용자가 확인을 클릭한 경우
    if (confirmed) {
        // class가 resetfield인 value 초기화
        $(".resetfield").val("");
    }
});

let guestSelect = document.getElementById('guest');
let selectedLong;

// 셀렉트 박스가 로드되면 초기 선택된 값을 출력하는 함수
window.onload = function() {
    selectedLong = parseInt(guestSelect.options[guestSelect.selectedIndex].value, 10);
    console.log(selectedLong);
}

guestSelect.addEventListener('change', function(e) {
    let selectedValue = e.target.value;
    console.log(selectedValue);
    selectedLong = parseInt(selectedValue, 10); //10진수로 변환(String->Number->10진수)

    //이미 선택되었던 것 지움
    let prevSelectedOption = guestSelect.querySelector('.guest-option[data-selected="true"]');
    if (prevSelectedOption) {
        prevSelectedOption.removeAttribute('data-selected');
    }

    //사용자가 선택한거 selected
    let newSelectedOption = guestSelect.querySelector('.guest-option[value="' + selectedValue + '"]');
    newSelectedOption.setAttribute('data-selected', "true");

    console.log(selectedLong);
});


$("#btn-save").click(function() {
    let ckoutDate = $('#checkoutDate').val()
    let roomNum = $('#roomNumber').val()
    let key = 0;

    $.ajax({
        type : "Post",
        url : "./saveCheck",
        data : {
            checkoutDate:ckoutDate,
            roomNumber:roomNum
        },
        success:function(result){
            key=result
            if(key===2){
                alert("레이트 체크아웃이 불가능한 날짜입니다.");
            }else if(key===0){
                // 확인 대화상자 표시
                let confirmed = confirm("레이트 체크아웃이 가능한 날짜입니다. 해당 날짜로 레이트 체크아웃 하시겠습니까?");
                if(confirmed){
                    $('#updateCheckout').val(ckoutDate)
                    $('#updateReservationDate').val(ckoutDate)
                    $('#updateGuestCount').val(selectedLong)
                    $('#saveForm').submit(); // 수정된 부분: 폼을 제출하는 코드
                    alert("저장되었습니다.");
                }
             }else if(key===1) {
                $('#updateCheckout').val(ckoutDate)
                    $('#updateReservationDate').val(ckoutDate)
                    $('#updateGuestCount').val(selectedLong)
                    $('#saveForm').submit(); // 수정된 부분: 폼을 제출하는 코드
                alert("저장되었습니다.")
             }

        },
        error:function(){
            console.log()
            alert("에러가 발생했습니다.")
        }
    })
});

$("#btn-checkin").click(function() {
    let confirmed = confirm("체크인 하시겠습니까?");
    if(confirmed){
        $('#updateResCheckout').val( $('#checkoutDate').val())
        $('#checkinForm').submit();
        alert("체크인 되었습니다.")
    }
});

