package com.dev.pms.alarm;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageDAO {

    public int setAlarm(AlarmVO alarmVO)throws Exception;
    public List<AlarmVO> getAlarm()throws Exception;

}
