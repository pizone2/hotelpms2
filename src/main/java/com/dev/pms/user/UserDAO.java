package com.dev.pms.user;

import com.dev.pms.room.BookingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface UserDAO {
    public List<UserVO>getUserList(UserVO userVO)throws Exception;

    public UserVO getLogin(UserVO userVO) throws Exception;

    public List<BookingVO> getUserBookingList(BookingVO bookingVO) throws Exception;

}
