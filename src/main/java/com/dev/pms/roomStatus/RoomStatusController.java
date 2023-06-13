package com.dev.pms.roomStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/roomStatus/*")
public class RoomStatusController {
    @Autowired
    private RoomStatusService roomStatusService;

    @GetMapping("/roomStatusList")
    public ModelAndView getRoomStatusList(RoomStatusVO roomStatusVO)throws Exception{
        ModelAndView mv = new ModelAndView();

        List<RoomStatusVO> list = roomStatusService.getRoomStatusList(roomStatusVO);
        List<RoomStatusVO> checkinCount = roomStatusService.getCheckinCount(roomStatusVO);
        List<RoomStatusVO> reservationCount = roomStatusService.getReservationCount(roomStatusVO);
        List<RoomStatusVO> roomStock = roomStatusService.getRoomStock(roomStatusVO);

        mv.addObject("roomStatusVO",list);
        mv.addObject("checkinCount",checkinCount);
        mv.addObject("reservationCount",reservationCount);
        mv.addObject("roomStock",roomStock);
        mv.setViewName("roomStatus/roomStatusList");
        return mv;
    }

    @GetMapping("/roomStatusMonthList")
    public ModelAndView getRoomStatusMonthList(RoomStatusVO roomStatusVO)throws Exception{
        ModelAndView mv = new ModelAndView();


        List<RoomStatusVO> monthList = roomStatusService.getRoomStatusListMonth(roomStatusVO);
        List<RoomStatusVO> checkinCount = roomStatusService.getCheckinCount(roomStatusVO);
        List<RoomStatusVO> reservationCount = roomStatusService.getReservationCount(roomStatusVO);
        List<RoomStatusVO> roomStock = roomStatusService.getRoomStock(roomStatusVO);


        mv.addObject("roomStatusMonthListVO",monthList);
        mv.addObject("checkinCount",checkinCount);
        mv.addObject("reservationCount",reservationCount);
        mv.addObject("roomStock",roomStock);
        mv.setViewName("roomStatus/roomStatusMonthList");
        return mv;

    }    @GetMapping("/roomStatusThreeWeeksList")
    public ModelAndView getRoomStatusListThreeWeeks(RoomStatusVO roomStatusVO)throws Exception{
        ModelAndView mv = new ModelAndView();


        List<RoomStatusVO> threeWeeks = roomStatusService.getRoomStatusListThreeWeeks(roomStatusVO);
        List<RoomStatusVO> checkinCount = roomStatusService.getCheckinCount(roomStatusVO)   ;
        List<RoomStatusVO> reservationCount = roomStatusService.getReservationCount(roomStatusVO);
        List<RoomStatusVO> roomStock = roomStatusService.getRoomStock(roomStatusVO);


        mv.addObject("roomStatusThreeWeeksListVO",threeWeeks);
        mv.addObject("checkinCount",checkinCount);
        mv.addObject("reservationCount",reservationCount);
        mv.addObject("roomStock",roomStock);
        mv.setViewName("roomStatus/roomStatusThreeWeeksList");
        return mv;
    }



}
