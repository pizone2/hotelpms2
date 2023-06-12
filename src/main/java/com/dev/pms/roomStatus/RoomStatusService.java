package com.dev.pms.roomStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomStatusService {
    @Autowired
    private RoomStatusDAO roomStatusDAO;

    public List<RoomStatusVO> getRoomStatusList(RoomStatusVO roomStatusVO)throws Exception{
        return  roomStatusDAO.getRoomStatusList(roomStatusVO);
    } public List<RoomStatusVO> getRoomStatusListMonth(RoomStatusVO roomStatusVO)throws Exception{
        return  roomStatusDAO.getRoomStatusListMonth(roomStatusVO);
    }
    public List<RoomStatusVO> getRoomStatusListThreeWeeks(RoomStatusVO roomStatusVO)throws Exception{
        return  roomStatusDAO.getRoomStatusListThreeWeeks(roomStatusVO);
    }
    public List<RoomStatusVO> getCheckinCount(RoomStatusVO roomStatusVO)throws Exception{
        return  roomStatusDAO.getCheckinCount(roomStatusVO);
    }
    public List<RoomStatusVO> getReservationCount(RoomStatusVO roomStatusVO)throws Exception{
        return  roomStatusDAO.getReservationCount(roomStatusVO);

    }  public List<RoomStatusVO> getRoomStock(RoomStatusVO roomStatusVO)throws Exception{
        return  roomStatusDAO.getRoomStock(roomStatusVO);
    }

}
