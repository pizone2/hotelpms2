$(document).ready(function() {
    // updateTable();


});
//얼럿창 버그로...
function reloadPageInProgress() {
    location.reload();
    location.reload();
    alert("발주중 상태로 변경합니다.")

}

function reloadPageGoodStock() {
    location.reload();
    location.reload();
    alert("양호 상태로 변경합니다.")

}

// setInterval(updateTable, 3000);
function updateInProgress(inventoryId) {

    $.ajax({
        url:'/partnerManager/updateInProgress',
        method:'POST',
        data: {
            inventoryId:inventoryId,
        },
        success: function(response) {
            console.log(inventoryId)
            console.log('발주중 성공')
        },
        error: function(error) {
            console.log(inventoryId)
            console.error('발주중 실패');
        }
    });
}

function updateGoodStock(inventoryId) {

    $.ajax({
        url:'/partnerManager/updateGoodStock',
        method:'POST',
        data: {
            inventoryId:inventoryId,
        },
        success: function(response) {
            console.log(inventoryId)
            console.log('양호 성공')
        },
        error: function(error) {
            console.log(inventoryId)
            console.error('양호 실패');
        }
    });
}


// function updateTable() {
//     $.ajax({
//         url: '/partnerManager/updateTable',
//         method: 'GET',
//         success: function (updateTable) {
//
//             $('#updateTable').html(updateTable);
//         },
//         error: function (error) {
//             console.error('Error:', error);
//         }
//     });
// }

