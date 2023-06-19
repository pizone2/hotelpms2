package com.dev.pms.room;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public class HotelStockVO {
    private Long inventoryId;
    private Long itemId;
    private Long currentStock;
    private Long autoOrderQuantity;
    private String orderStatus;
    private Long roomUsageStatus;

}