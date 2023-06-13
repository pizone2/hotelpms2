package com.dev.pms.roomStatus;

import lombok.Data;

import java.sql.Date;

@Data
public class RoomStatusVO {
    private  String reservationNumber;
    private  Long roomNumber;
    private  String id;
    private  String roomType;
    private  String name;
    private  String reservationEmail;
    private  String guestCount;
    private Date paymentDate;
    private Date checkinDate;
    private Date checkoutDate;
    private String reservationStatus;
    private Long paymentAmount;
    private String phoneNumber;

    private String reservationDate;
    private String roomStatus;
    private String reservationNum;

    private Long checkinCount;
    private Long reservationCount;
    private Long roomStock;

}
