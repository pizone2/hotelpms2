package com.dev.pms.home;

import com.dev.pms.room.RoomTypeVO;
import lombok.Data;

import java.sql.Date;

@Data
public class HomeVO {
    private String roomType;
    private  Long todaySales;




    //HEEJIN
    private  String reservationNumber;
    private  Long roomNumber;
    private  String id;
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
