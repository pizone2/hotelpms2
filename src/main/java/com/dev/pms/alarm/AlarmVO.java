package com.dev.pms.alarm;

import lombok.Data;

import java.sql.Date;

@Data
public class AlarmVO {

    private Long alarmNum;
    private String Id;
    private String Kind;
    private String alarmContent;
    private Date alarmDate;
    private String alarmUrl;
}
