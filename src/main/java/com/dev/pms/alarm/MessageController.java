package com.dev.pms.alarm;

import org.springframework.stereotype.Controller;

@Controller
public class MessageController {


    @sendTo
    public Message send(final Message message) throws Exception {
        return message;
    }
}
