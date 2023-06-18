$(document).ready(function() {
    // updateTable();



});

function reloadPage() {
    location.reload();
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
            console.log('발주중 성공');
        },
        error: function(error) {
            console.log(inventoryId)
            console.error('발주중 실패');
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

