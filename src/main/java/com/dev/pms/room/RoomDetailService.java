package com.dev.pms.room;

import com.dev.pms.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomDetailService {
    @Autowired
    private RoomDetailDAO roomDAO;

    public BookingVO getResDetail(Long aLong) throws  Exception{
        return roomDAO.getResDetail(aLong);
    }

    public BookingVO getRoomDetail(Long aLong) throws  Exception{
        return roomDAO.getRoomDetail(aLong);
    }

    public UserVO getManagerInfo() throws Exception {
        return roomDAO.getManagerInfo();
    }

    public List<BookingVO> getResDate(BookingVO bookingVO) throws Exception{
        return roomDAO.getResDate(bookingVO);
    }

    public BookingVO getResNowDate(BookingVO bookingVO) throws Exception{
        return roomDAO.getResNowDate(bookingVO);
    }

    public int setBookingUpdate(BookingVO bookingVO) throws Exception{
        return roomDAO.setBookingUpdate(bookingVO);
    }

    public int setReservedUpdate(ReservedVO reservedVO) throws Exception{
        return roomDAO.setReservedUpdate(reservedVO);
    }

    public int setRoomUpdate(ReservedVO reservedVO) throws Exception{
        return roomDAO.setRoomUpdate(reservedVO);
    }

    public int setStatusHouse(BookingVO bookingVO) throws Exception{
        return roomDAO.setStatusHouse(bookingVO);
    }

    public int setCleanAsk(BookingVO bookingVO) throws Exception {
        return roomDAO.setCleanAsk(bookingVO);
    }
}
