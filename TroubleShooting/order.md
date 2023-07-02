

:octocat: [Main](/)
> Trouble Shooting

## 발주
- 페이지 'Reload' 시 'WebSocket'으로 구현한 알림이 사라짐
  - 'WebSocket' 전송 시 DB에 해당 알림을 저장 'Reload' 시 ajax를 이용하여 데이터를 불러와 문제 해결
- 관리자와 업체 알림 구분이 안됨
  - 'WebSocket' 전송 시 'message'의 키워드를 이용하여 구분하여 문제 해결


#### 페이지 'Reload' 시 'WebSocket'으로 구현한 알림이 사라짐
- 페이지 새로고침 시 'WebSocket'의 데이터가 유지되지 않고 사라지는 문제 발생
```java
    @MessageMapping("/message")
    @SendTo("/topic/messages")
    public ResponseMessage getMessage(final Message message) throws InterruptedException {
        Thread.sleep(1000);

        String notificationContent = message.getMessageContent();

        // 알림 내용을 데이터베이스에 저장
        try {
            saveNotificationToDatabase(notificationContent);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        System.out.println();
        return new ResponseMessage(HtmlUtils.htmlEscape(message.getMessageContent()));
    }
```

>  'message' Controller를 거처갈때 'saveNotificationToDatabase'로 'message.getMessageContent()'를 보냄

```java
 private void saveNotificationToDatabase(String content) throws Exception {
        // 알림 객체 생성
        AlarmVO alarm = new AlarmVO();
        alarm.setAlarmContent(content);
        LocalDateTime localDateTime = LocalDateTime.now();
        Date sqlDate = Date.valueOf(localDateTime.toLocalDate());
        alarm.setAlarmDate(sqlDate);
       
        // 알림을 데이터베이스에 저장
        messageService.setAlarm(alarm);
        System.out.println("messageService");
    }
```

> 'saveNotificationToDatabase'에서 'content'를 DB로 보내서 저장

```js
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
```

> 'reload'시 fetchNotifications()를 호출

#### 관리자와 업체 알림 구분이 안됨
- 관리자와 업체가 받는 알림이 각각 다른데 구분없이 모든 알림이 들어오는 문제 발생
```js
  function showMessage(message) {
    let hrefValue = "";

    if (message.includes("부족")) {
        if (message.includes("발주요청")) {
            hrefValue = "../partnerManager/partnerManagerStockList";
        } else if (message.includes("부족")) {
            hrefValue = "../stock/managerStockList";
        } else {
            hrefValue = "#!";
        }

        $("#messages").append(
            "<a class=\"dropdown-item dropdown-notifications-item\" href=\"" + hrefValue + "\">" +
            "<div class=\"dropdown-notifications-item-content-text\">" + message + "</div>" +
            "</a>"
        );
    }
}
```

> 'message'의 키워드를 이용하여 구분


