document.addEventListener("DOMContentLoaded", function() {
    let tdElements = document.querySelectorAll("td[id^='pa']");
    let divElements = document.querySelectorAll("div[id^='ch']");

    for (let i = 0; i < tdElements.length; i++) {
        let tdElement = tdElements[i];
        let divElement = divElements[i];
        let roomNumber = tdElement.id.substring(2);

        if (tdElement.id === "pa" + roomNumber && divElement.id === "ch" + roomNumber) {

            tdElement.className = divElement.className;

            if (tdElement.className.includes("예약완료")) {
                tdElement.classList.add("bg-blue", "text-white");
                tdElement.onclick = function() {
                    window.location.href = "../roomDetail/resConfirmed?roomNumber="+roomNumber+"&roomStatus=예약완료";
                };
            } else if (tdElement.className.includes("청소요청")) {
                tdElement.classList.add("bg-info", "text-white");
            } else if (tdElement.className.includes("예약가능")) {
                tdElement.style.backgroundColor = "#1a1f71";
                tdElement.style.color = "white";
            } else if (tdElement.className.includes("재실")) {
                tdElement.classList.add("bg-warning", "text-white");
                tdElement.onclick = function() {
                    window.location.href = "../roomDetail/houseRoom?roomNumber="+roomNumber+"&roomStatus=재실";
                };
            } else if (tdElement.className.includes("청소중")) {
                tdElement.style.backgroundColor = "#ff662e";
                tdElement.style.color = "white";
            } else if (tdElement.className.includes("퇴실")) {
                tdElement.classList.add("bg-green", "text-white");
            } else if (tdElement.className.includes("객실점검")) {
                tdElement.style.backgroundColor = "#00673f";
                tdElement.style.color = "white";
            }
        }
    }
});

const roomStatusNames = ['예약가능', '재실', '예약완료', '청소요청', '청소중', '퇴실', '객실점검'];

const counts = new Array(roomStatusNames.length).fill(0);

const divElements = document.getElementsByTagName('div');

for (let i = 0; i < divElements.length; i++) {
    const className = divElements[i].className;

    for (let j = 0; j < roomStatusNames.length; j++) {
        if (className.includes(roomStatusNames[j])) {
            counts[j]++;
            break;
        }
    }
}

for (let i = 0; i < counts.length; i++) {
    const countElement = document.getElementsByClassName(`roomstatusname${i + 1}`)[0];
    countElement.innerHTML = counts[i];

    console.log(`각각의 객실상황별 룸 카운트' ${roomStatusNames[i]}: ${counts[i]}`);
}

$(document).ready(function() {
    // 체크박스가 선택된 경우에만 숨기기로 표시되는 filtersApplied 변수를 선언합니다. (체크박스가 선택되지 않은 경우 모든 방이 표시됩니다.)
    let filtersApplied = false;

    // 체크박스 값이 변경될 때마다 실행됩니다.
    $('input[name="roomstatus"], input[name="floors"], input[name="roomTypes"]').change(function() {
        applyFilters();
    });

    // 체크박스가 선택되었을 때 실행됩니다.
    function applyFilters() {
        // 객실 상태
        let selectedRoomstatus = [];
        // 층별
        let selectedFloors = [];
        // 객실 유형
        let selectedRoomTypes = [];

        // 객실 상태 필터
        $('input[name="roomstatus"]:checked').each(function() {
            selectedRoomstatus.push($(this).val());
        });

        // 층별 필터
        $('input[name="floors"]:checked').each(function() {
            selectedFloors.push($(this).val());
        });

        // 객실 유형 필터
        $('input[name="roomTypes"]:checked').each(function() {
            selectedRoomTypes.push($(this).val());
        });



        // 필터 상태를 확인하기 위해 콘솔에 출력합니다.
        console.log('객실 상태 필터:', selectedRoomstatus);
        console.log('객실 층별 필터:', selectedFloors);
        console.log('객실 타입 필터:', selectedRoomTypes);


        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 하나 이상의 층이 선택된 경우 모든 층을 숨깁니다.

        if (filtersApplied || selectedFloors.length > 0) {
            $('tr.floor').hide();
        } else if (filtersApplied || selectedFloors.length === 0) {
            $('tr.floor').show();
        }

        // 선택된 층만 보여줍니다.
        if (selectedFloors.length === 0) {
            $('tr.floor').show();
        } else {
            selectedFloors.forEach(function(floor) {
                $('tr.floor[data-index="' + floor + '"]').show();
            });
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // 필터를 적용하는 함수
        function applyFilters() {
            // 선택된 객실 유형
            let selectedRoomTypes = [];

            // 객실 유형 필터
            $('input[name="roomTypes"]:checked').each(function() {
                selectedRoomTypes.push($(this).val());
            });

            // 모든 td.tdroom 요소를 숨깁니다.
            $('td.tdroom').css('visibility', 'hidden');

            // 선택된 객실 유형에 해당하는 td.tdroom 요소만 보여줍니다.
            if (selectedRoomTypes.length > 0) {
                let selector = selectedRoomTypes.map(function(roomType) {
                    return 'td.tdroom.' + roomType;
                }).join(',');
                $(selector).css('visibility', 'visible');
            } else {
                // 선택된 객실 유형이 없는 경우 모든 td.tdroom 요소를 보여줍니다.
                $('td.tdroom').css('visibility', 'visible');
            }

            let tableId = "datatablesSimple";
            let table = document.getElementById(tableId);
            let rows = table.getElementsByTagName("tr");

            for (let i = 0; i < rows.length; i++) {
                let row = rows[i];
                let cells = row.getElementsByTagName("td");

                for (let j = 0; j < cells.length; j++) {
                    let cell = cells[j];
                    let visibility = window.getComputedStyle(cell).getPropertyValue("visibility");

                    if (visibility === "visible") {
                        let currentIndex = Array.prototype.indexOf.call(cells, cell);
                        row.removeChild(cell);
                        row.insertBefore(cell, cells[0]);
                        cells = row.getElementsByTagName("td");
                        let cellsArray = Array.from(cells);
                        Array.prototype.splice.call(cellsArray, 0, 0, Array.prototype.splice.call(cellsArray, currentIndex, 1)[0]);

                    }
                }
            }

        }

        // 체크박스 값이 변경될 때마다 필터를 적용합니다.
        $('input[name="roomTypes"]').change(function() {
            applyFilters();
        });


        // 페이지가 로드될 때 초기 필터를 적용합니다.
        applyFilters();



        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 하나 이상의 객실 상태 체크박스가 선택된 경우 모든 방을 숨깁니다.
        if (filtersApplied || selectedRoomstatus.length > 0) {
            $('td.tdroom').css('visibility', 'hidden');
        } else if (filtersApplied || selectedRoomstatus.length == 0) {
            $('td.tdroom').css('visibility', 'visible');
        }

        // 선택된 객실 상태에 해당하는 td.tdroom 요소만 보여줍니다.
        if (selectedRoomstatus.length === 0) {
            $('td.tdroom').css('visibility', 'visible');
        } else {
            $('td.tdroom').css('visibility', 'hidden'); // 모든 td.tdroom 요소를 숨깁니다.
            selectedRoomstatus.forEach(function(roomstatus) {
                $('td.tdroom').filter(function() {
                    return $(this).hasClass(roomstatus);
                }).css('visibility', 'visible');// 선택된 객실 상태에 해당하는 td.tdroom 요소만 보여줍니다.
            });
        }



        // 다시 시작할 때 선택된 방의 수만 계산합니다.
        let visibleTdroomElements = $('.tdroom:visible');
        console.log('<td class="tdroom">의 개수:', visibleTdroomElements.length);
        divElement.text(visibleTdroomElements.length / 2 + "개");

        //////////////////////////////////////테이블 재정렬 처리 /////////////////////////////////////////
        let tableId = "datatablesSimple";
        let table = document.getElementById(tableId);
        let rows = table.getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            let row = rows[i];
            let cells = row.getElementsByTagName("td");

            for (let j = 0; j < cells.length; j++) {
                let cell = cells[j];
                let visibility = window.getComputedStyle(cell).getPropertyValue("visibility");

                if (visibility === "visible") {
                    let currentIndex = Array.prototype.indexOf.call(cells, cell);
                    row.removeChild(cell);
                    row.insertBefore(cell, cells[0]);
                    cells = row.getElementsByTagName("td");
                    let cellsArray = Array.from(cells);
                    Array.prototype.splice.call(cellsArray, 0, 0, Array.prototype.splice.call(cellsArray, currentIndex, 1)[0]);

                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 필터가 적용되었음을 표시하는 플래그를 true로 설정합니다.
        filtersApplied = true;

    }

    //////////////////////////////////////////
    // 선택된 방의 개수 계산
    // class="tdroom"인 모든 요소의 개수를 구합니다.
    let tdroomCount = $('.tdroom').length / 2;

    // 콘솔 창에서 방의 개수를 확인합니다.
    console.log('<td> 요소의 개수:', tdroomCount);

    // class="form-check-label-tdroomCount"인 요소를 변수로 선언합니다.
    let divElement = $('.form-check-label-tdroomCount');

    // divElement 변수에 방의 개수를 넣습니다.
    divElement.text(tdroomCount + "개");




})