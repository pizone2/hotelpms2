package com.dev.pms.stock;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;


@Setter
@Getter
public class PartnerVO {
    private String businessNumber;
    private  String contactName;
    private  String companyName;
    private  String email;
    private  String  address;
    private  String settlementAccount;
    private  String phoneNumber;
    private  String ceoName;
    private Date registrationDate;
    private  Boolean approval;
    private  String sectors;
    private String uniqueCharacter;
}
