package com.dev.pms.alarm;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
@Slf4j
@RestController
public class WSController {

    @Autowired
    private WSService service;

    @PostMapping("/send-message")
    public void sendMessage(@RequestBody final Message message) {
        service.notifyFrontend(message.getMessageContent());
    }

    @PostMapping("/send-private-message/{roleName}")  // {id}는 경로 변수 자리 표시자로서 id의 값이 URL 자체에서 추출됨을 의미, URL이 /send-private-message/123인 경우 id 값은 "123"이 됨
    public void sendPrivateMessage(@PathVariable final String roleName, // @PathVariable은 URL의 {id} 값을 메소드의 id 매개변수에 바인딩하는 데 사용되는 주석 (바인딩은 url 또는 값을 매개 변수에 연결)
                                   @RequestBody final Message message) {
        service.notifyUser(roleName, message.getMessageContent());
    }
}
