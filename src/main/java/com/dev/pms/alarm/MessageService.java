package com.dev.pms.alarm;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MessageService {

    @Autowired
    private MessageDAO messageDAO;

    public int setAlarm(AlarmVO alarmVO)throws Exception{
        return messageDAO.setAlarm(alarmVO);
    }
    public List<AlarmVO> getAlarm()throws Exception{
        return messageDAO.getAlarm();
    }

}
