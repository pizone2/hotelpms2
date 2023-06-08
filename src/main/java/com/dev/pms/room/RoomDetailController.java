package com.dev.pms.room;

import com.dev.pms.user.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/roomDetail/*")
public class RoomDetailController {

    @Autowired
    private RoomDetailService roomService;

    @GetMapping("resConfirmed")
    public ModelAndView getBookingList() throws Exception {
        ModelAndView mv = new ModelAndView();
        //프론트 매니저 정보
        UserVO userVO = roomService.getManagerInfo();
        //예약한 유저의 예약정보들
        BookingVO bookingVO = roomService.getResDetail(105l);
        //페이지 정보
        String pageName = "예약확정";
        mv.addObject("userVO", userVO);
        mv.addObject("bookingVO", bookingVO);
        mv.addObject("pageName", pageName);
        mv.setViewName("room/resConfirmed");
        return mv;
    }

    @PostMapping("saveCheck")
    @ResponseBody
    public Long setSaveCheck(Date checkoutDate,Long roomNumber) throws Exception{
        BookingVO bookingVO = new BookingVO();
        bookingVO.setCheckoutDate(checkoutDate);
        bookingVO.setRoomNumber(roomNumber);
        List<BookingVO> list = roomService.getResDate(bookingVO);
        bookingVO = roomService.getResNowDate(bookingVO);
        for(BookingVO vo:list){
            log.error("========{}=======",vo.getCheckoutDate());
        }
        //num이 0이면 레이트 체크아웃 가능한 날짜+인수수정(현재날짜보다 큼), 1이면 당일 날짜+인수수정(현재날짜), 2이면 레이트 체크아웃 불가능한 날짜(현재날짜보다 작음)
        //경우의 수 다시 생각해보기 설명이랑 코드랑 다름
        Long num = 2l;
        if(list.isEmpty()){
            num = 0l;
        }
        if(bookingVO!=null){
            num=1l;
        }
        return num;
    }

    @PostMapping("save")
    public ModelAndView setSaveCheck(BookingVO bookingVO, ReservedVO reservedVO,String pageName) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = roomService.setBookingUpdate(bookingVO);

        if(pageName.equals("예약확정")){
            result = roomService.setReservedUpdate(reservedVO);
            mv.setViewName("redirect:./resConfirmed");
        } else if(pageName.equals("재실")){
            result = roomService.setRoomUpdate(reservedVO);
            mv.setViewName("redirect:./houseRoom");
        }
        return mv;
    }

    // 위에랑 똑같이 청소요청이랑 재실이랑 구분해서 status 업데이트 시켜주는거 작업해주기
    @PostMapping("checkInSave")
    public ModelAndView setStatusHouse(BookingVO bookingVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = roomService.setStatusHouse(bookingVO);
        mv.setViewName("redirect:/room/roommanager");
        return mv;
    }

    @GetMapping("houseRoom")
    public ModelAndView getRoomList() throws Exception {
        ModelAndView mv = new ModelAndView();
        //프론트 매니저 정보
        UserVO userVO = roomService.getManagerInfo();
        //예약한 유저의 예약정보들
        BookingVO bookingVO = roomService.getRoomDetail(105l);
        //페이지 정보
        String pageName = "재실";
        mv.addObject("userVO", userVO);
        mv.addObject("bookingVO", bookingVO);
        mv.addObject("pageName", pageName);
        mv.setViewName("room/resConfirmed");
        return mv;
    }

    @PostMapping("cleanAskSave")
    public ModelAndView setStatusClean(BookingVO bookingVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = roomService.setCleanAsk(bookingVO);
        mv.setViewName("redirect:/room/roommanager");
        return mv;
    }
}
