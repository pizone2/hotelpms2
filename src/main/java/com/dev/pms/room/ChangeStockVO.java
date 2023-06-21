package com.dev.pms.room;

import lombok.Data;

import java.util.List;

@Data
public class ChangeStockVO {
    private Long inventoryId;
    private Long itemId;
    private Long currentStock;
    private Long autoOrderQuantity;
    private String orderStatus;
    private String roomUsageStatus;
    private String productName;
    private String itemCode;
    private Long unitPrice;
    private Long quantity;


}
