package com.dev.pms.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Controller
@RequestMapping("/user/*")
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("userList")
    public ModelAndView getUserList(UserVO userVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserVO> userVOS = userService.getUserList(userVO);
        mv.addObject("userVO",userVOS);
        mv.setViewName("user/userList");
        return mv;
    }
}
