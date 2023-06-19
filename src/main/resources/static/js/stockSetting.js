$(document).ready(function() {
    $('.dropdown-item').click(function() {
        let selectedRoomType = $(this).data('roomtype');
        $('#selectedRoomTypeButton').text(selectedRoomType);

        // Ajax GET 요청
        $.ajax({
            url: 'roomTypeStock',
            type: 'GET',
            data: { roomType: selectedRoomType },
            success: function(roomStockVOs) {
                // roomStockVOs는 RoomStockVO 객체의 리스트입니다.
                // 각 RoomStockVO는 inventoryId와 count를 가집니다.
                // 체크박스와 레이블을 업데이트 합니다.
                $('.myCheckbox').each(function() {
                    let checkbox = $(this);
                    let inventoryId = checkbox.val();

                    let roomStockVO = roomStockVOs.find(vo => vo.inventoryId == inventoryId);
                    if(roomStockVO) {
                        checkbox.prop('checked', true);
                        let correspondingLabel = $('label[name=stock' + checkbox.closest('.row').attr('id').substring(3) + ']');
                        correspondingLabel.text(roomStockVO.count);
                    } else {
                        checkbox.prop('checked', false);
                        let correspondingLabel = $('label[name=stock' + checkbox.closest('.row').attr('id').substring(3) + ']');
                        correspondingLabel.text(0);
                    }
                });
            },
            error: function(error) {
                // 에러 처리를 이 부분에서 하시면 됩니다.
                console.error("Error in fetching room type stocks: ", error);
            }
        });
    });
});

//객실별 재고 insert
$(document).ready(function() {
    $('.plusbtn').click(function() {
        let currentRow = $(this).closest('tr');
        let rowId = currentRow.attr('id');
        let stockLabel = $('#' + 'stock' + rowId.replace('row', ''));
        let currentStock = parseInt(stockLabel.text());
        let maxStock = parseInt(currentRow.attr('data-max-stock'));

        if(currentStock < maxStock) {
            currentStock++;
            stockLabel.text(currentStock);
        }
    });

    $('.minusbtn').click(function() {
        let currentRow = $(this).closest('tr');
        let rowId = currentRow.attr('id');
        let stockLabel = $('#' + 'stock' + rowId.replace('row', ''));
        let currentStock = parseInt(stockLabel.text());

        if(currentStock > 0) {
            currentStock--;
            stockLabel.text(currentStock);
        }
    });

    $('#btn-register').click(function() {
        let roomType = $('#selectedRoomTypeButton').text();
        let items = [];
        let hasCheckedItemWithZeroQuantity = false;
        $('.myCheckbox:checked').each(function() {
            let row = $(this).closest('tr');
            let inventoryId = $(this).val();
            let quantity = row.find('label[id^="stock"]').text();

            if (quantity === '0') {
                hasCheckedItemWithZeroQuantity = true;
                return false; // 체크된 체크박스가 0인 경우이므로 반복문 종료
            }

            items.push({inventoryId: inventoryId, quantity: quantity});
        });

        if (hasCheckedItemWithZeroQuantity) {
            alert('선택한 비품의 수량은 0이 될 수 없습니다.');
            return;
        }

        if (items.length === 0) {
            alert('비품을 선택해야 합니다.');
            return;
        }

        $.ajax({
            type: "POST",
            url: "/partnerAdmin/stockSettingInsert",
            data: JSON.stringify({roomType: roomType, items: items}),
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                if(result===1){
                    alert('객실 설정이 완료되었습니다.');
                    location.reload();
                }else {
                    alert('객실 설정 하는데 오류가 발생했습니다.');
                }

            },
            error: function(errMsg) {
                alert('에러가 발생했습니다.');
            }
        });
    });
});

