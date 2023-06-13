package com.dev.pms.room;

import com.dev.pms.user.UserVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/roomDetail/*")
public class RoomDetailController {

    @Autowired
    private RoomDetailService roomService;

    @GetMapping("resConfirmed")
    public ModelAndView getBookingList(Long roomNumber) throws Exception {
        ModelAndView mv = new ModelAndView();
        //프론트 매니저 정보
        UserVO userVO = roomService.getManagerInfo();
        //예약한 유저의 예약정보들
        BookingVO bookingVO = roomService.getResDetail(roomNumber);
        //페이지 정보
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = formatter.format(new java.util.Date());
        String pageName = "예약확정";
        mv.addObject("userVO", userVO);
        mv.addObject("bookingVO", bookingVO);
        mv.addObject("pageName", pageName);
        mv.addObject("currentDate", formattedDate);
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
        //레이트체크아웃 가능한지 AJAX JSON형태로 확인
        Long num = 2l;
        if(list.isEmpty()){
            num = 0l;
        }
        if(bookingVO!=null){
            num=1l;
        }
        return num;
    }

    //Booking테이블 인수,레이트체크아웃 저장
    //Reserved테이블 예약확정일때는 status 예약가능->예약확정 / 재실일때는 status 예약완료->재실
    //(각각 레이트 체크아웃 시 해줘야되는 작업, 일부 업데이트)
    @PostMapping("save")
    public ModelAndView setSaveCheck(BookingVO bookingVO, ReservedVO reservedVO,String pageName) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = roomService.setBookingUpdate(bookingVO);

        if(pageName.equals("예약확정")){
            result = roomService.setReservedUpdate(reservedVO);
            mv.setViewName("redirect:./resConfirmed?roomNumber="+reservedVO.getRoomNumber());
        } else if(pageName.equals("재실")){
            result = roomService.setRoomUpdate(reservedVO);
            mv.setViewName("redirect:./houseRoom?roomNumber="+reservedVO.getRoomNumber());
        }
        return mv;
    }


    //Reserved테이블 예약확정일때는 status 예약확정->재실
    //상태변환 booking의 checkindate와 checkoutdate 사이 날짜에 맞게 모두 update
    @PostMapping("checkInSave")
    public ModelAndView setStatusHouse(BookingVO bookingVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = roomService.setStatusHouse(bookingVO);
        mv.setViewName("redirect:/room/roommanager");
        return mv;
    }

    @GetMapping("houseRoom")
    public ModelAndView getRoomList(Long roomNumber) throws Exception {
        ModelAndView mv = new ModelAndView();
        //프론트 매니저 정보
        UserVO userVO = roomService.getManagerInfo();
        //예약한 유저의 예약정보들
        BookingVO bookingVO = roomService.getRoomDetail(roomNumber);
        //페이지 정보
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = formatter.format(new java.util.Date());
        String pageName = "재실";
        mv.addObject("userVO", userVO);
        mv.addObject("bookingVO", bookingVO);
        mv.addObject("pageName", pageName);
        mv.addObject("currentDate", formattedDate);
        mv.setViewName("room/resConfirmed");
        return mv;
    }

    //Reserved테이블 재실일때는 status 재실->청소요청
    //상태변환 booking의 checkindate와 checkoutdate 사이 날짜에 맞게 모두 update
    @PostMapping("cleanAskSave")
    public ModelAndView setStatusClean(BookingVO bookingVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = roomService.setCleanAsk(bookingVO);
        mv.setViewName("redirect:/room/roommanager");
        return mv;
    }

}
