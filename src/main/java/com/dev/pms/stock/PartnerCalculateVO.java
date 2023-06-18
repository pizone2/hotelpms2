package com.dev.pms.stock;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Setter
@Getter
public class PartnerCalculateVO {
    private Long inventoryId;
    private Long itemId;
    private Long currentStock;
    private Long autoOrderQuantity;
    private String orderStatus;
    private String roomUsageStatus;
    private String productName;
    private String itemCode;
    private String companyName;
    private Long unitPrice;
    private Long userNum;
    private Date userDate;
    private Long amount;
    private Date regiStrationDate;
    private Long month;


    private String businessNumber;
    private  String contactName;
    private  String email;
    private  String  address;
    private  String settlementAccount;
    private  String phoneNumber;
    private  String ceoName;
    private Date registrationDate;
    private  String approval;
    private  String sectors;


    private Long unit;
    private String remarks;
    private Boolean itemUsagestatus;

    private Long itemIdSum;
    private Long total;


}
