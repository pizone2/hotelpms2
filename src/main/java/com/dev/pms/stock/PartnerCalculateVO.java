package com.dev.pms.stock;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
public class PartnerCalculateVO {

    private HotelStockVO hotelStockVO;
    private PartnerVO partnerVO;
    private PartnerStockVO partnerStockVO;

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

}
