let stompClient = null;
let fullText = $("#test").html();

$(document).ready(function() {
    console.log("Index page is ready");
    connect();

    $("#send").click(function() {
        sendMessage();
    });

});

function connect() {
    let socket = new SockJS('/our-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/messages', function (message) {
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

function sendMessage() {
    console.log("sending message");
    stompClient.send("/ws/message", {}, JSON.stringify({'messageContent': $("#message").val()}));
}
