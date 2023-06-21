package com.dev.pms.alarm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

@Service
public class WSService {

    private final SimpMessagingTemplate messagingTemplate;

    @Autowired
    public WSService(SimpMessagingTemplate messagingTemplate) {
        System.out.println("df");
        this.messagingTemplate = messagingTemplate;
    }

    public void notifyFrontend(final String message) {
        ResponseMessage response = new ResponseMessage(message);
        System.out.println("dfd");
        messagingTemplate.convertAndSend("/topic/messages", response);
    }

    public void notifyUser(final String message) {
        System.out.println("dddf");
        ResponseMessage response = new ResponseMessage(message);
        messagingTemplate.convertAndSendToUser("ROLE_CLEAN", "/topic/private-messages", response);
    }

}
