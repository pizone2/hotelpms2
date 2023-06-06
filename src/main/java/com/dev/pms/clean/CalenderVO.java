package com.dev.pms.clean;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;


@Getter
@Setter
public class CalenderVO {
    private Date scheduleStartdate;
    private Date scheduleEnddate;
    private Long scheduleNumber;
    private Long serialNum;
}
