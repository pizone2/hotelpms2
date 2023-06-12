// 현재 날짜 객체 생성
let today = new Date();

// 년, 월, 일 정보 추출
let year = today.getFullYear();
let month = String(today.getMonth() + 1).padStart(2, '0');
let day = String(today.getDate()).padStart(2, '0');

// 날짜를 'yyyy-mm-dd' 형식으로 조합
let todayDate = `${year}-${month}-${day}`;

document.getElementById('todayDate').innerText = todayDate;


function showTooltip(event, roomNumber, reservationDate, name, roomStatus, reservationNumber, phoneNumber, checkinDate, checkoutDate,backgroundColor) {
    if(roomStatus == 0){
        return; //roomStatus가 0일떄 툴팁 작동 x
    }

    // 툴팁을 표시할 div 엘리먼트를 생성합니다.
    let reservationtooltip = document.createElement("div");
    reservationtooltip.className = "reservation-tooltip";

    // 현재 스크롤 위치를 고려하여 마우스 위치를 계산합니다.
    let scrollX = window.pageXOffset || document.documentElement.scrollLeft;
    let scrollY = window.pageYOffset || document.documentElement.scrollTop;
    let tooltipX = event.clientX + scrollX + "px";
    let tooltipY = event.clientY + scrollY + "px";

    // 툴팁 위치를 설정합니다.
    reservationtooltip.style.left = tooltipX;
    reservationtooltip.style.top = tooltipY;

    // 툴팁 내용을 설정합니다.
    reservationtooltip.innerHTML = `
    <p style="color: ${backgroundColor}">${roomStatus} (${reservationNumber})</p>
    <p> - 고객명 : ${name}</p>
    <p> - 전화번호 : ${phoneNumber} </p>
    <p> - 방 번호 : ${roomNumber}호 </p>
    <p> - 투숙기간 : ${checkinDate} ~ ${checkoutDate}</p>


  
  `;

    // body에 툴팁을 추가합니다.
    document.body.appendChild(reservationtooltip);
}

function hideTooltip() {
    // 툴팁을 삭제합니다.
    let reservationtooltip = document.querySelector(".reservation-tooltip");
    if (reservationtooltip) {
        reservationtooltip.remove();
    }
}

window.addEventListener('scroll', function() {
    var tableOffsetTop = document.querySelector('.table-status').offsetTop;
    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    var thead = document.querySelector('.table-status thead');

    if (scrollTop >= tableOffsetTop) {
        thead.style.position = 'fixed';
        thead.style.top = '0';
        thead.style.zIndex = '1';
    } else {
        thead.style.position = 'static';
    }
});






