package com.dev.pms.clean;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CleanDAO {

    public List<CalenderVO>getCleanList(CalenderVO calenderVO)throws Exception;
    public List<RoomCleanVO>getRoomCleanList(RoomCleanVO roomCleanVO)throws  Exception;
    public int insertSchedule(CalenderVO calenderVO)throws Exception;
    public int deleteSchedule(CalenderVO calenderVO)throws Exception;
    public int insertFile(FileVO fileVO)throws Exception;
    public int setRoomClean(RoomCleanVO roomCleanVO)throws Exception;
    public int updateCleanNum()throws Exception;
}
