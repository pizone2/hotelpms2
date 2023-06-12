package com.dev.pms.room;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Slf4j
@RequestMapping("/smsMessage/*")
public class SmsMessageController {
    final DefaultMessageService messageService;

    public SmsMessageController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSU8MPWGWLNETTO", "WJIC3TC8LZAQWYUIGBHWGEEKXRQIYJ6D", "https://api.coolsms.co.kr");
    }


    @PostMapping("ressend")
    public ModelAndView sendOne(String resTextarea, BookingVO bookingVO, String pageName) {
        ModelAndView mv = new ModelAndView();
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01079328558");
        message.setTo(bookingVO.getPhoneNumber());
        message.setText(resTextarea);
        log.error(":::::::pageName:{}::::::::",pageName);
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        log.error(":::::::response:{}::::::::",response);
        if(pageName.equals("예약확정")){
            mv.setViewName("redirect:/roomDetail/resConfirmed?roomNumber="+bookingVO.getRoomNumber());
        } else if(pageName.equals("재실")){
            mv.setViewName("redirect:/roomDetail/houseRoom?roomNumber="+bookingVO.getRoomNumber());
        }
        return mv;
    }

}
