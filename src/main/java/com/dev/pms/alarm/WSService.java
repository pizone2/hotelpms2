package com.dev.pms.alarm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

@Service
public class WSService {

    private final SimpMessagingTemplate messagingTemplate;

    @Autowired
    public WSService(SimpMessagingTemplate messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    public void notifyFrontend(final String message) {
        ResponseMessage response = new ResponseMessage(message);

        messagingTemplate.convertAndSend("/topic/messages", response);
    }

    public void notifyUser(final String roleName, final String message) {
        ResponseMessage response = new ResponseMessage(message);
        messagingTemplate.convertAndSendToUser(roleName, "/topic/private-messages", response);
    }

}
