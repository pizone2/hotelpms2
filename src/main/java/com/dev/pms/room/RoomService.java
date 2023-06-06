package com.dev.pms.room;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class RoomService {
    @Autowired
    private RoomDAO roomDAO;


    public List<RoomVO> getRoomList() throws Exception{
        return roomDAO.getRoomList();
    }

    public List<ReservedVO> getRoomStatus() throws Exception{
        return roomDAO.getRoomStatus();
    }

}
