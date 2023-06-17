package com.dev.pms.room;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class RoomTypeVO {

    private String roomType;
    private  Long capacity;
    private  Long roomPrice;
    private List<String> roomTypes;

}
