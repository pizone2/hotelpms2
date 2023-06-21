package com.dev.pms.stock;


import com.dev.pms.room.BookingVO;
import com.dev.pms.room.ReservedVO;
import com.dev.pms.user.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.javassist.bytecode.ClassFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.security.PublicKey;
import java.util.Collection;

@Controller
@RequestMapping("/partner/*")
@Slf4j
public class PartnerController {

    @Autowired
    private PartnerService partnerService;

    // 사업자 등록 페이지
    @GetMapping("join")
    public ModelAndView setJoin(PartnerVO partnerVO) throws Exception{
        ModelAndView mv = new ModelAndView();
 /*       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName();
        System.out.println(name);*/
        mv.setViewName("stock/Partnerregistration");
        return mv;
    }

    //사업자 정보를 DB에 인서트
   /* @PostMapping("join")
    public ModelAndView setPartner(PartnerVO partnerVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = partnerService.setPartner(partnerVO);;

        mv.setViewName("redirect:/") ;
        return mv;
    }*/
    @PostMapping("join")
    public ModelAndView setPartner(PartnerVO partnerVO, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = partnerService.setPartner(partnerVO);
        mv.setViewName("/partnerAdmin/partnerList");
        return mv;
    }


    //사업자등록번호가 DB에 존재하는지 확인하는 기능
    @PostMapping ("/findBusinessNumber")
    public ResponseEntity<String> findBusinessNumber(String businessNumber) throws Exception {

        boolean isMatch = partnerService.getBusinessNumber(businessNumber);
        System.out.println(isMatch);
        if (isMatch) {
            return ResponseEntity.ok("use");
        } else {
            return ResponseEntity.ok("nouse");
        }
    }





}
