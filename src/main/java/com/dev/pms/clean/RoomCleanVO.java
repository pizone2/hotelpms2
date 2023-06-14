package com.dev.pms.clean;

import lombok.Data;

import java.sql.Date;

@Data
public class RoomCleanVO {
    private Long cleanNum;
    private Long roomNumber;
    private Long scheduleNumber;
    private Date dateOfRegistration;
    private String confirmationStatus;
    private String note;
}
