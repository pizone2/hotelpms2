package com.dev.pms.stock;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
public class PartnerStockVO {
    private Long itemId;
    private String businessNumber;
    private String productName;
    private String itemCode;
    private Long unit;
    private Long unitPrice;
    private Date registrationDate;
    private String remarks;
    private Boolean itemUsagestatus;
}
