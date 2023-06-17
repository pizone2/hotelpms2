package com.dev.pms.room;

import com.dev.pms.user.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoomDetailDAO {
    public BookingVO getResDetail(Long aLong) throws Exception;

    public UserVO getManagerInfo() throws  Exception;

    public List<BookingVO> getResDate(BookingVO bookingVO) throws Exception;

    public BookingVO getResNowDate(BookingVO bookingVO) throws Exception;

    public int setBookingUpdate(BookingVO bookingVO) throws Exception;

    public int setReservedUpdate(ReservedVO reservedVO) throws Exception;

    public int setStatusHouse(BookingVO bookingVO) throws Exception;



}
