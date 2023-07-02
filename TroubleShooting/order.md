

:octocat: [Main](/)
> Trouble Shooting

## 발주
- 페이지 'Reload' 시 'WebSocket'으로 구현한 알림이 사라짐
  - 'WebSocket' 전송 시 DB에 해당 알림을 저장 'Reload' 시 ajax를 이용하여 데이터를 불러옴


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

```javascript
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


