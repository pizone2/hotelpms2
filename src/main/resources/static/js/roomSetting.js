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
            const td = checkbox.closest('td');
            const nextColumn = td.nextElementSibling;
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
        var capacity = $('#capacity').val();
        var roomPrice = $('#roomPrice').val();

        console.log('선택된 다음 열 값들:', selectedValues);
        console.log('capacity =',capacity)
        console.log('roomPrice =',roomPrice)

        // Send the AJAX POST request
        $.ajax({
            type: 'POST',
            url: '/room/roomSetting',
            data: {
                'capacity':capacity,
                'roomPrice':roomPrice,
                'roomTypes': selectedValues
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
        setTimeout(function() {
            location.reload();
        }, 500);
    });
});
