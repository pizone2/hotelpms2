package com.dev.pms.room;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

@Setter
@Getter
public class BookingVO {
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

    private RoomTypeVO roomTypeVOs;

    //통계를 위한 컬럼 변수 추가
    private Long count;
}
