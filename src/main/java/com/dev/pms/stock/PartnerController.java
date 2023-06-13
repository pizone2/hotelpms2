package com.dev.pms.stock;


import com.dev.pms.room.BookingVO;
import com.dev.pms.user.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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


    @PostMapping ("/findBusinessNumber")
    public ResponseEntity<String> findBusinessNumber(String businessNumber) throws Exception {
        // 일치하는 값이 있는지 확인하는 로직을 구현하세요
        // 예를 들어, DB에서 해당 사업자 등록 번호를 검색하고 일치 여부를 확인하는 코드를 작성합니다.
        // 일치하는 값이 있으면 "match" 문자열을 반환하고, 일치하는 값이 없으면 "no-match" 문자열을 반환합니다.
        // 아래는 예시 코드입니다.

        boolean isMatch = parthnerService.getBusinessNumber(businessNumber);
        System.out.println(isMatch);
        if (isMatch) {
            return ResponseEntity.ok("use");
        } else {
            return ResponseEntity.ok("nouse");
        }
    }





}
