package com.dev.pms.stock;


import com.dev.pms.room.BookingVO;
import com.dev.pms.user.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.PublicKey;

@Controller
@RequestMapping("/partner/*")
@Slf4j
public class PartnerController {

    @Autowired
    private ParthnerService parthnerService;

    @GetMapping("join")
    public ModelAndView setJoin(PartnerVO partnerVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("stock/Partnerregistration");
        return mv;
    }

   @GetMapping("findBusinessNumber")
    public ModelAndView findBusinessNumber(PartnerVO partnerVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        PartnerVO pa = parthnerService.getBusinessNumber(partnerVO);
        mv.addObject("result",pa);
        mv.setViewName("stock/Partnerregistration");
        return mv;
    }




//    @GetMapping("join")
//    public ModelAndView getBusinessNumberList() throws Exception {
//        ModelAndView mv = new ModelAndView();
//        //UserVO userVO = roomService.getManagerInfo();
//        //예약한 유저의 예약정보들
//        //BookingVO bookingVO = roomService.getResDetail(105l);
//        //mv.addObject("userVO", userVO);
//        //mv.addObject("bookingVO", bookingVO);
//        mv.setViewName("stock/Partnerregistration");
//        return mv;
//    }


}
