//테이블 만들어주는 코드

window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple);
    }

    //제공된 테이블이 초기화된 후 "datatable-sorter" 클래스 제거
    $(document).ready(function() {
        $('a.datatable-sorter').removeClass('datatable-sorter');
    });
});

// 전역 범위에서 selectedValues 배열 선언 및 초기화
const selectedValues = [];

window.addEventListener('DOMContentLoaded', event => {
    const checkboxes = document.querySelectorAll('input.myCheckbox');

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            const nextColumn = checkbox.parentNode.nextElementSibling;
            const nextColumnValue = nextColumn.textContent.trim();

            if (checkbox.checked && !selectedValues.includes(nextColumnValue)) {
                selectedValues.push(nextColumnValue);
            } else if (!checkbox.checked && selectedValues.includes(nextColumnValue)) {
                const index = selectedValues.indexOf(nextColumnValue);
                selectedValues.splice(index, 1);
            }

            console.log('선택된 다음 열 값들:', selectedValues);
        });
    });
});

$(document).ready(function () {
    $('#btn-send').click(function () {
        // Get the value from the input field
        var quantity = $('#quantity').val();

        // Create a data object to send via AJAX
        var data = {
            count: quantity,
            itemIds: selectedValues // selectedValues 배열을 데이터 객체에 추가
        };

        console.log('선택된 다음 열 값들:', selectedValues);
        console.log('quantity:', quantity);
        console.log('data:', data);

        // Send the AJAX POST request
        $.ajax({
            type: 'POST',
            url: '/stock/setQuantity',
            data: {
                'quantity':quantity,
                'itemIds': selectedValues
            },
            success: function (response) {
                // Handle the response from the server
                console.log('Data sent successfully');
            },
            error: function (xhr, status, error) {
                // Handle the error case
                console.log('Error:', error);
            }
        });
    });
});
