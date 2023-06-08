package com.dev.pms.room;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
@Setter
@Getter
public class ReservedVO {

    private  Long reservationNum;
    private Date reservationDate;
    private  Long roomNumber;
    private  String roomType;
    private  String roomStatus;

}
