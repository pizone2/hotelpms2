// 페이지가 로드된 후 실행되는 코드
window.onload = function() {
    // 모든 <td> 요소의 값을 가져와서 합계를 계산합니다.
    let sum = 0;
    let tdElements = document.querySelectorAll('.tg-kxtx#itemIdSum');
    tdElements.forEach(function(element) {
        let value = parseInt(element.textContent.replace(/[^0-9]/g, ''));
        if (!isNaN(value)) {
            sum += value;
        }
    });

// 계산된 합계 값을 삽입합니다.
    let sumElement = document.querySelector('.tg-amwm#total');
    sumElement.textContent = new Intl.NumberFormat('ko-KR').format(sum) + ' 원';

// 콘솔에 결과 출력
    console.log("합계 값:", sum);

};

