package com.dev.pms.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDAO userDAO;

    public List<UserVO> getUserList(UserVO userVO) throws Exception{
        return userDAO.getUserList(userVO);
    }
}
