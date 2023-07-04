package com.dev.pms.alarm;

import com.dev.pms.clean.CalenderVO;
import com.dev.pms.clean.CleanService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

import java.security.Principal;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Controller

public class MessageController {
    @Autowired
    private CleanService cleanService;
    @Autowired
    private MessageService messageService;


    @GetMapping("/alarm/dbAlarm")
    @ResponseBody
    public List<AlarmVO> fetchNotifications() throws Exception {
        List<AlarmVO> notifications = messageService.getAlarm();
        return notifications;
    }


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


    @MessageMapping("/private-message")  // 클라이언트로부터 "/private-message" 주소로 프라이빗 메시지가 도착했을 때 이 메서드가 실행
    @SendToUser("/topic/private-messages")  // 이 메서드에서 반환되는 값을 해당 사용자의 "/topic/private-messages" 주소로 보냄   SendToUser 이 어노테이션은 메시지를 특정 사용자에게 전송하는 역할
    public ResponseMessage getPrivateMessage(final Message message,
                                             final Principal principal,CalenderVO calenderVO) throws Exception {
        Thread.sleep(1000);
        CalenderVO todayCalender = cleanService.getTodayClean(calenderVO);
        Long today = todayCalender.getScheduleNumber();

        String notificationContent = "청소 " + today + "팀: " + message.getMessageContent();

        // 알림 내용을 데이터베이스에 저장
        saveNotificationToDatabase(notificationContent);


        System.out.println("1");
        log.error("1");
        log.debug("1212312312312312312");
        return new ResponseMessage(HtmlUtils.htmlEscape("청소"+ today + "팀 : " + message.getMessageContent())
        );
    }


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


}


