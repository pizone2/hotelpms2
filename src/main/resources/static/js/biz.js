//input 태그 숨김처리
let elements = document.getElementsByClassName("myDiv");
for (let i = 0; i < elements.length; i++) {
    elements[i].style.display = "none";
}

//사업자 인증이 완료되어야만 post 처리가 가능하도록 구현
let isFalse = false;

// 사업자  API 필수 데이터
let data = {
    "b_no": [] // 사업자 번호가 입력 되는 변수
};

//확인 버튼이 클릭되었을 때 사업자 API 검증 및 사업자 등록 번호 DB 조회가 되도록 실행
document.querySelector('.btn-outline-blue').addEventListener('click', function () {
    var user = "${user}"; // JSP 변수를 JavaScript 변수에 할당
    console.log(user);
    // HTML에서 b_no 값 가져오기
    let b_noValue = document.getElementById('businessNumber').value;
    // 가져온 값으로 data 객체 업데이트
    data.b_no = [b_noValue];
    // 사업자 인증 api
    $.ajax({
        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=CUDiGGxX5sMlOkttxSlMucSgFGVUn09P2dC54WaXMNwYRvT1%2FCYYSXEqqMkFoQ%2Bkxjsb3XIGi0QEOAfX%2B9IJWw%3D%3D",
        type: "POST",
        data: JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function (result) {
            let b_stt_cd = result.data[0].b_stt_cd;
            let messageElement = document.createElement('div');
            let businessNumberElement = document.getElementById('businessNumber');

            if (b_stt_cd === '01') {
                // AJAX 요청 함수 정의
                function getBusinessNumber() {
                   // jsp에서 입력된 사업자 번호를 가져오기
                    let businessNumber = $("#businessNumber").val();
                    // ajax를 통해서 db에 있는 사업자 번호 검증 (findBusinessNumber 컨트롤러 )
                    $.ajax({
                        url: "/partner/findBusinessNumber",
                        method: "POST",
                        data: { businessNumber: businessNumber },
                        success: function(businessNumber) {
                            // 결과 값에 따라 메시지를 출력 nouse 사용하지 않는 사업자 번호일 때 일치할때는 이미 등록된 사업자 번호 입니다로 출력
                            if (businessNumber === 'nouse') {
                                isFalse = true;
                                messageElement.innerText = '사업자 번호 인증이 완료되었습니다.';
                                messageElement.style.color = 'green';
                            } else {
                                messageElement.innerText = '이미 등록된 사업자 번호입니다.';
                                messageElement.style.color = 'red';
                            }
                        },
                        error: function(xhr, status, error) {
                            // 에러 처리
                            console.error('오류가 발생했습니다 관리자에게 문의해주세요:', status, error);
                        }
                    });
                }
                // getBusinessNumber 함수 호출해서 실행될 수 있도록 함
                getBusinessNumber();
            // 사업자 api 오류일시 에러메시지 text 출력
            } else {
                messageElement.innerText = '잘못된 사업자 번호입니다 사업자 등록 번호를 확인해주세요.';
                messageElement.style.color = 'red';
            }

            // 이전 메시지를 제거하고 새로운 메시지로 대체하는 코드
            let existingMessageElement = businessNumberElement.parentNode.querySelector('.message');
            if (existingMessageElement) {
                existingMessageElement.parentNode.removeChild(existingMessageElement);
            }

            // text를 div아래에 출력할 수 있도록 설정
            messageElement.classList.add('message');
            businessNumberElement.parentNode.appendChild(messageElement);
            console.log(b_stt_cd);
        },
        error: function (result) {
            console.log(result.responseText);
        }
    });

});

// 제출 버튼 클릭 이벤트 처리 ( 사업자 인증이 완료되어야지만 insert)
document.getElementById("btn3").addEventListener("click", function() {
    if (isFalse===true) {
       document.getElementById("businessForm").submit();
    }
});

//주소 api 데이터 호출 및 데이터 가공
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 콘솔창에 테스트 출력
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

            // 값이 없을 때 공백으로 대체
            if (roadAddr !== '') {
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            // 값이 모두 선택되면 팝업 창 닫아주기
            window.close();
            // 주소 데이터를 DB에 인서트 하기 위해 데이터 가공 후 $("#address").val(address); 에 넣어주기
            let sample4_postcode = document.getElementById('sample4_postcode').value;
            let sample4_roadAddress = document.getElementById('sample4_roadAddress').value;
            let sample4_jibunAddress = document.getElementById('sample4_jibunAddress').value;
            let sample4_extraAddress = document.getElementById('sample4_extraAddress').value;
            let sample4_detailAddress = document.getElementById('sample4_detailAddress').value;
            let address = sample4_postcode + " " + sample4_roadAddress + " " + sample4_jibunAddress + " " + sample4_extraAddress + " " + sample4_detailAddress;
            // ADDRESS 태그에 값 넣어주기
            $("#address").val(address);

        }
    }).open();


}

//정산계정 정보를 form에 담기 위한 데이터 가공
$(document).ready(function() {
    let formSelectValue; // formSelectValue 변수를 선언하고 초기화

    $("#form-select").change(function() {
        formSelectValue = $(this).val(); // formSelectValue 변수에 값 할당
        console.log(formSelectValue);
        let accountValue = $("#account").val();
        let combinedValue = formSelectValue + " " + accountValue;
        $("#settlementAccount").val(combinedValue);

    });

    $("#account").on("input", function() {
        console.log(formSelectValue); // formSelectValue 변수 사용
        let accountValue = $("#account").val();
        let combinedValue = formSelectValue + " " + accountValue;
        $("#settlementAccount").val(combinedValue);
    });


});


