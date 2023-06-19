package com.dev.pms.stock;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomStockVO {
    private String roomType;
    private Long inventoryId;
    private Long count;
}
