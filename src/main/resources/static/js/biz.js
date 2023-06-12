let data = {
    "b_no": [] // 사업자 등록번호로 검색할 때 "xxxxxxx"를 대체하세요
};

// OK 버튼을 클릭할 때 실행되도록 설정
document.querySelector('.btn-outline-blue').addEventListener('click', function() {
    // HTML에서 b_no 값을 가져옴
    let b_noValue = document.getElementById('businessNumber').value;
    // 가져온 값으로 data 객체 업데이트
    data.b_no = [b_noValue];

    $.ajax({
        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=CUDiGGxX5sMlOkttxSlMucSgFGVUn09P2dC54WaXMNwYRvT1%2FCYYSXEqqMkFoQ%2Bkxjsb3XIGi0QEOAfX%2B9IJWw%3D%3D",
        type: "POST",
        data: JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function(result) {
            let b_stt_cd = result.data[0].b_stt_cd;
            let messageElement = document.createElement('div');
            let businessNumberElement = document.getElementById('businessNumber');

            if (b_stt_cd === '01') {
                messageElement.innerText = '사업자 등록번호 확인이 완료되었습니다.';
                messageElement.style.color = 'green';
            } else {
                messageElement.innerText = '사업자 등록번호를 확인해주세요.';
                messageElement.style.color = 'red';
            }

            // 이전 메시지가 있다면 제거하고 새로운 메시지로 대체
            let existingMessageElement = businessNumberElement.parentNode.querySelector('.message');
            if (existingMessageElement) {
                existingMessageElement.parentNode.removeChild(existingMessageElement);
            }

            // 메시지를 필드 아래에 추가
            messageElement.classList.add('message');
            businessNumberElement.parentNode.appendChild(messageElement);
            console.log(b_stt_cd);
        },
        error: function(result) {
            console.log(result.responseText);
        }
    });
});

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // Put the zip code and address information into the corresponding fields.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

            // If there is a reference item string, put it in the relevant field.
            if (roadAddr !== '') {
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            window.close();
        }
    }).open();

}





