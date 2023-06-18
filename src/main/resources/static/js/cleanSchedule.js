$(document).ready(function() {
    // #insertSchedule 폼의 버튼 눌렀을 때 이벤트
    updateCardContainer();

    $('#insertSchedule').submit(function(event) {
        event.preventDefault();

        let startDate = $('#exampleFormControlInput1').val();
        let endDate = $('#exampleFormControlInput2').val();

       //데이터 저장
       let requestData = {
            scheduleStartdate: startDate,
            scheduleEnddate: endDate
        };

        //날짜 검증 ajax
        $.ajax({
            type: 'POST',
            url: '/clean/cleanScheduleCheck',
            data: JSON.stringify(requestData),
            contentType: 'application/json',
            success: function(response) {
                if (response.result > 0) {
                    //결과 값이 0보다 크면 경고창
                    alert('해당 날짜에 이미 청소팀이 존재합니다.');
                } else {
                    // 없을경우 통과
                    $('#insertSchedule').off('submit').submit();
                }
            },
            error: function(xhr, status, error) {
                console.log('등록실패' + error);
                alert('등록실패.');
                console.log(requestData)
            }
        });
    });
});



function updateCardContainer() {
    $.ajax({
        url: '/clean/cleanCheckList',
        method: 'GET',
        success: function (checkList) {

            $('#checkList').html(checkList);
        },
        error: function (error) {
            console.error('Error:', error);
        }
    });
}


// setInterval(updateCardContainer, 3000);






function CleaningInProgress(roomNumber) {
    // Perform an AJAX request to update the data on the server
    // Example using jQuery:
    $.ajax({
        url:'/clean/updateCleaningInProgress',
        method: 'POST',
        data: {
            roomNumber: roomNumber,
        },
        success: function(response) {
            // Handle the success response
            console.log('Cleaning request sent');
        },
        error: function(error) {
            // Handle the error
            console.error('An error occurred while sending the cleaning request');
        }
    });
}



function CleaningComplete(roomNumber) {
    // Perform an AJAX request to update the data on the server
    // Example using jQuery:
    $.ajax({
        url: '/clean/cleaningComplete',
        method: 'POST',
        data: {
            roomNumber: roomNumber,
        },
        success: function(response) {
            // Handle the success response
            console.log('변경완료(재실)');
        },
        error: function(error) {
            // Handle the error
            console.error('An error occurred while marking the cleaning as complete');
        }
    });
}