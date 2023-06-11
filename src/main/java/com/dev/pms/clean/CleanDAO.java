package com.dev.pms.clean;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CleanDAO {

    public List<CalenderVO>getCleanList(CalenderVO calenderVO)throws Exception;

    public int insertSchedule(CalenderVO calenderVO)throws Exception;
    public int deleteSchedule(CalenderVO calenderVO)throws Exception;
}
