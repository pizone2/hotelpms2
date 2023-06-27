/*체크박스 전체 체크*/
$(document).ready(function() {
    // "checkAll" 체크박스에 클릭 이벤트 핸들러를 추가
    $('#checkAll').click(function() {
        var isChecked = $(this).is(':checked');

        // "tbody"에 있는 모든 체크박스를 선택 혹은 해제
        $('tbody .myCheckbox').prop('checked', isChecked);
    });

    // "tbody"에 있는 체크박스에 클릭 이벤트 핸들러를 추가
    $('tbody .myCheckbox').click(function() {
        var isAllChecked = true;

        // 모든 체크박스가 체크되었는지 확인
        $('tbody .myCheckbox').each(function() {
            if (!$(this).is(':checked')) {
                isAllChecked = false;
                return false; // each문 중단
            }
        });

        // 모든 체크박스가 체크되어 있다면 "checkAll" 체크박스를 체크하고, 그렇지 않다면 해제
        $('#checkAll').prop('checked', isAllChecked);
    });
});


/*상품추가*/
$('#btn-insert').on('click', function(event) {
    // 입력 필드 선택
    const inputs = $('#insertForm').find('.form-input');

    // 모든 입력 필드가 채워졌는지 확인
    for (let i = 0; i < inputs.length; i++) {
        // trim 함수를 사용하여 문자열 양 끝의 공백 제거
        if ($(inputs[i]).val().trim() === '') {
            event.preventDefault(); // 폼 제출 중지
            alert('모든 필드를 작성해주세요.');
            return; // 함수 종료
        }
    }

/*    // 입력된 분류코드가 "C001" 형식인지 확인
    const itemCode = $('#itemCode').val().trim();
    const regex = /^[A-Z][0-9]{3}$/;

    if (!regex.test(itemCode)) {
        const label = $('#itemCode').siblings('.code-message');
        label.text('잘못된 형식 입니다. 영대문자+세자리 숫자 형태로 작성하시오.').css('color', 'red');
        return; // 함수 종료
    }*/

    // 단위와 단가가 숫자인지 확인
    const unit = $('#unit').val().trim();
    const unitPrice = $('#unitPrice').val().trim();
    const numRegex = /^[0-9]+$/;

    if (!numRegex.test(unit)) {
        const label = $('#unit').siblings('.unit-message');
        label.text('단위는 숫자만 입력 가능합니다.').css('color', 'red');
        return; // 함수 종료
    }

    if (!numRegex.test(unitPrice)) {
        const label = $('#unitPrice').siblings('.price-message');
        label.text('단가는 숫자만 입력 가능합니다.').css('color', 'red');
        return; // 함수 종료
    }

    // 모든 필드가 채워져 있으면 폼을 제출
    $('#insertForm').submit();
    alert('해당 상품이 추가되었습니다.');
});


$(document).ready(function() {
    // 체크박스 선택 후(한개) "품목수정" 누르면 정보 들어옴
    $('#exampleModalLg2').on('show.bs.modal', function (event) {
        const selectedRows = $('tbody .myCheckbox:checked');

        if (selectedRows.length !== 1) {
            alert('정보는 한 개만 수정 가능합니다.');
            event.preventDefault();
            return;
        }

        // 테이블 해당 tr의 td들 가져옴
        const selectedRow = selectedRows.closest('tr');
        const itemId = selectedRow.find('td:nth-child(2)').text();
        const productName = selectedRow.find('td:nth-child(4)').text();
        const itemCode = selectedRow.find('td:nth-child(5)').text();
        const unitPrice = selectedRow.find('td:nth-child(6)').text();
        const unit = selectedRow.find('td:nth-child(7)').text();
        const remarks = selectedRow.find('td:nth-child(8) .truncate-text').text();

        // 모달 input태그에 value넣어줌
        $('#productName0').val(productName);
        $('#itemCode0').text(itemCode);
        $('#itemCodeBtn').text(itemCode);
        $('#itemCodeUpdate').val(itemCode);
        $('#unitPrice0').val(unitPrice);
        $('#unit0').val(unit);
        $('#remarks0').val(remarks);
        $('#itemId0').val(itemId);
    });

    /*상품수정*/
    $('#btn-update').on('click', function(event) {
        // 입력 필드 선택
        const inputs = $('#updateForm').find('.form-update');

        // 모든 입력 필드가 채워졌는지 확인
        for (let i = 0; i < inputs.length; i++) {
            if ($(inputs[i]).val().trim() === '') {
                event.preventDefault();
                alert('모든 필드를 작성해주세요.');
                return;
            }
        }
/*
        // 입력된 분류코드가 "C001" 형식인지 확인
        const itemCode = $('#itemCode0').val().trim();
        const regex = /^[A-Z][0-9]{3}$/;

        if (!regex.test(itemCode)) {
            const label = $('#itemCode0').siblings('.code-message');
            label.text('잘못된 형식 입니다. 영대문자+세자리 숫자 형태로 작성하시오.').css('color', 'red');
            return;
        }*/

        // 단위와 단가가 숫자인지 확인
        const unit = $('#unit0').val().trim();
        const unitPrice = $('#unitPrice0').val().trim();
        const numberRegex = /^[0-9]+$/;

        if (!numberRegex.test(unit)) {
            const label = $('#unit0').siblings('.unit-message');
            label.text('단위는 숫자만 입력 가능합니다.').css('color', 'red');
            return; // 함수 종료
        }

        if (!numberRegex.test(unitPrice)) {
            const label = $('#unitPrice0').siblings('.price-message');
            label.text('단가는 숫자만 입력 가능합니다.').css('color', 'red');
            return; // 함수 종료
        }

        // 모든 필드가 채워져 있으면 폼을 제출
        $('#updateForm').submit();
        alert('해당 상품이 수정되었습니다.');
    });
});


$(document).ready(function() {
    // 품목삭제 버튼 클릭 이벤트
    $('#btn-delete').on('click', function() {
        const selectedRows = $('tbody .myCheckbox:checked');
        // 선택된 항목이 없을 때
        if (selectedRows.length === 0) {
            alert('삭제할 품목을 선택하세요.');
            return;
        }
        // 확인 창
        if (!confirm("선택한 품목을 삭제하시겠습니까?")) {
            return;
        }

        // 선택된 모든 행에 대해 itemId를 가져오고 배열에 저장
        let itemIds = [];
        selectedRows.each(function() {
            const itemId = $(this).closest('tr').find('td:nth-child(2)').text();
            itemIds.push(itemId);
        });

        // 서버로 AJAX 요청을 보내서 선택한 품목을 삭제
        $.ajax({
            url: '/partnerStock/stockDelete',
            type: 'POST',
            data: {
                'itemIds': itemIds
            },
            traditional: true,
            success: function(response) {
                alert('품목 삭제에 성공하였습니다');
                location.href = '/partnerStock/stockList';
            },
            error: function(error) {
                alert('품목 삭제에 실패하였습니다. 다시 시도해주세요.');
            }
        });
    });
});


