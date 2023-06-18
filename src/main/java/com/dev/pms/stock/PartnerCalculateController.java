package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/partnerCalculate/*")
public class PartnerCalculateController {

    @Autowired
    private PartnerCalculateService PartnerCalculateService;

    @GetMapping("list")
    public ModelAndView getCalculateList(@RequestParam("date") String date) throws Exception {
        ModelAndView mv = new ModelAndView();
        //String yearMonths = PartnerCalculateService.getYearMonth();
        String yearMonths = PartnerCalculateService.getYearMonth(date);
        System.out.println("컨트롤러 스트링값"+ yearMonths);
        List<PartnerCalculateVO> stockList = PartnerCalculateService.getByYearMonth(yearMonths);
        System.out.println("컨트롤러 리스트"+ stockList);
        for (PartnerCalculateVO vo : stockList) {
            System.out.println(vo.getCompanyName());
           // System.out.println(vo.getPartnerVO().getBusinessNumber());
            //System.out.println(vo.getPartnerVO().getEmail());
            //System.out.println(vo.getPartnerVO());
            System.out.println(vo);
            System.out.println(vo.getAmount());
            // 나머지 필요한 값들도 출력
        }
        mv.addObject("list", stockList);
        mv.setViewName("stock/PartnerCalculate");
        return mv;
    }


    @GetMapping("receipt")
    public ModelAndView getreceipt(PartnerCalculateVO partnerCalculateVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("stock/receipt");
        return mv;
    }



}