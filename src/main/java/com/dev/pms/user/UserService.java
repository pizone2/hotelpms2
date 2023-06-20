package com.dev.pms.user;

import com.dev.pms.room.BookingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public List<UserVO> getUserList(UserVO userVO) throws Exception{
        return userDAO.getUserList(userVO);
    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

        UserVO userVO = new UserVO();
        userVO.setId(id);
        try {
            userVO = userDAO.getLogin(userVO);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // TODO Auto-generated method stub
        return userVO;
    }

    public List<BookingVO>getUserBookingList(BookingVO bookingVO) throws Exception {
        return userDAO.getUserBookingList(bookingVO);
    }
}
