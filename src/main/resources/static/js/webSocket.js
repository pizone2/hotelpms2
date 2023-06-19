let stompClient = null;
let fullText = $("#test").html();

$(document).ready(function() {
    console.log("Index page is ready");
    connect();

    $("#send").click(function() {
        sendMessage();
    });

    $("#send-private").click(function() {
        sendPrivateMessage();
    });

    // 페이지가 로드될 때 서버로부터 저장된 알림을 받아 표시
    fetchNotifications();

    // $("#btn-cleanask").click(function() {
    //     cleanaskSendMessage();
    // });

});

function connect() {
    let socket = new SockJS('/our-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);

        stompClient.subscribe('/topic/messages', function (message) {
            showMessage(JSON.parse(message.body).content);
        });
        stompClient.subscribe('/user/topic/private-messages', function (message) {
            showMessage(JSON.parse(message.body).content);
        });
    });
}

function showMessage(message) {
    $("#messages").append(
        "<a class=\"dropdown-item dropdown-notifications-item\" href=\"#!\">" +
        "<div class=\"dropdown-notifications-item-content-text\">" + message + "</div>" +
        "</a>"
    );
}

function fetchNotifications() {

    $.ajax({
        url: '/alarm/dbAlarm',  // 알림을 조회하는 API 엔드포인트
        type: 'GET',
        success: function (response) {
            // 조회된 알림을 화면에 표시
            response.forEach(function (notification) {
                showMessage(notification.alarmContent);
            });
        },
        error: function (error) {
            console.error('Failed to fetch notifications:', error);

        }
    });
}

function cleanaskSendMessage() {
    console.log("cleanaskSendMessage");
    stompClient.send("/ws/private-message", {}, JSON.stringify({'messageContent': "객실 청소요청이 들어왔습니다."}));
}

function sendPrivateMessage() {
    console.log("sending private message");
    stompClient.send("/ws/private-message", {}, JSON.stringify({'messageContent': "객실 청소요청이 들어왔습니다."}));
}

function sendMessage() {
    console.log("sending message");
    stompClient.send("/ws/message", {}, JSON.stringify({'messageContent': $("#message").val()}));
}
