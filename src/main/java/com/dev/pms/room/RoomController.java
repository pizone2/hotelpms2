package com.dev.pms.room;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/room/*")
@Slf4j
public class RoomController {

    @Autowired
    private RoomService roomService;
    //URL 주소 변경해주기 테스트 URL room/rm
    @GetMapping ("rm")
    public ModelAndView getRealTimeRoom() throws  Exception{
        ModelAndView mv = new ModelAndView();
        //객실 호수를 받아오는 Roomlist 선언
        List<RoomVO> roomVOList = roomService.getRoomList();
        // 객실 상태를 받아오는 ReservedList 선언
        List<ReservedVO> reservedVOList = roomService.getRoomStatus();

        mv.addObject("status",reservedVOList);
        mv.addObject("room",roomVOList);
        mv.setViewName("room/roommanagement");
        return mv;





    }

}
