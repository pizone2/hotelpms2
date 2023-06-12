package com.dev.pms.roomStatus;


import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoomStatusDAO {
    public List<RoomStatusVO> getRoomStatusList(RoomStatusVO roomStatusVO)throws Exception;
    public List<RoomStatusVO> getRoomStatusListMonth(RoomStatusVO roomStatusVO)throws Exception;
    public List<RoomStatusVO> getCheckinCount(RoomStatusVO roomStatusVO)throws Exception;
    public List<RoomStatusVO> getReservationCount(RoomStatusVO roomStatusVO)throws Exception;
    public List<RoomStatusVO> getRoomStock(RoomStatusVO roomStatusVO)throws Exception;
    public List<RoomStatusVO> getRoomStatusListThreeWeeks(RoomStatusVO roomStatusVO)throws Exception;
}
