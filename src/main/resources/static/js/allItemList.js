$(document).ready(function() {
    // "checkAll" 체크박스에 클릭 이벤트 핸들러 추가
    $('#checkAll').click(function() {
        var isChecked = $(this).is(':checked');

        // "tbody"의 모든 체크박스 선택 또는 선택 해제
        $('tbody .myCheckbox').prop('checked', isChecked);
    });
});

window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple);
    }

    // 제공된 테이블이 초기화된 후 "datatable-sorter" 클래스 제거
    $(document).ready(function() {
        $('a.datatable-sorter').removeClass('datatable-sorter');
    });
});

// 모달 창에 입력된 최소 주문 수량
const autoOrderQuantityInput = document.getElementById('autoOrderQuantity');
let autoOrderQuantityValue = autoOrderQuantityInput.value;

window.addEventListener('DOMContentLoaded', event => {
    const checkboxes = document.querySelectorAll('input.myCheckbox');
    const selectedValues = [];

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            selectedValues.length = 0; // 배열 초기화
            checkboxes.forEach(checkbox => {
                if (checkbox !== document.getElementById('checkAll') && checkbox.checked) {
                    const row = checkbox.parentNode.parentNode;
                    console.log(row);
                    const td = checkbox.closest('td');
                    const nextColumn = td.nextElementSibling;
                    const nextColumnValue = nextColumn.textContent.trim();

                    if (!selectedValues.includes(nextColumnValue)) {
                        selectedValues.push(nextColumnValue);
                    }
                }
            });

            // 변수의 개수에 따라 IF 문 실행
            const count = selectedValues.length;
            console.log("들어오는 배열의 개수:", count);

            const addButton = document.getElementById('add');
            addButton.removeEventListener('click', handleAddButtonClick); // 이전에 등록된 이벤트 리스너 제거
            addButton.addEventListener('click', handleAddButtonClick); // 수정된 이벤트 리스너 등록
        });
    });

    // 버튼 클릭 이벤트 핸들러
    function handleAddButtonClick() {
        if (selectedValues.length === 1) {
            // 모달 열기
            $('#exampleModalLg').modal('show');
            $('#add').off('click', handleAddButtonClick); // 이벤트 리스너 제거

            document.getElementById('btn-send').addEventListener('click', function() {
                autoOrderQuantityValue = $('#autoOrderQuantity').val();

                console.log("죄송합니다.", autoOrderQuantityValue); // 값을 확인하거나 원하는 논리 수행
                $.ajax({
                    type: 'POST',
                    url: '/partnerStock/itemOrderQuantity', // 실제 컨트롤러 URL로 변경되어야 합니다.
                    data: JSON.stringify({
                        itemList: selectedValues,
                        orderQuantity: autoOrderQuantityValue
                    }),
                    contentType: 'application/json',
                    success: function(response) {
                        console.log('전송 완료');
                        console.log('응답:', response);
                        location.reload();
                    },
                    error: function(error) {
                        console.log('전송 실패', selectedValues);
                        console.log('전송 실패');
                        console.log('에러:', error);
                        alert('재고 등록이 완료되었습니다');
                        location.reload();

                    }
                });
            });
        } else {
            if (selectedValues.length > 1) {
                $.ajax({
                    type: 'POST',
                    url: '/partnerStock/ItemNumberList', // 실제 컨트롤러 URL로 변경되어야 합니다.
                    data: JSON.stringify({ itemList: selectedValues }),
                    contentType: 'application/json',
                    success: function(response) {
                        console.log('전송 완료');
                        console.log('응답:', response);
                    },
                    error: function(error) {
                        console.log('전송 실패', selectedValues);
                        console.log('전송 실패');
                        console.log('에러:', error);
                        alert('재고 등록이 완료되었습니다');
                        location.reload();
                    }
                });
            }
        }
    }
});
