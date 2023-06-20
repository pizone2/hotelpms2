package com.dev.pms.room;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface RoomDAO {

    public List<RoomVO> getRoomList() throws Exception;

    public List<ReservedVO> getRoomStatus() throws Exception;

    public List<RoomTypeVO> getRoomSetting() throws Exception;

    public int setRoomSetting(RoomTypeVO roomTypeVO) throws Exception;
    public int setAlarm(ChangeStockVO changeStockVO) throws Exception;
}

