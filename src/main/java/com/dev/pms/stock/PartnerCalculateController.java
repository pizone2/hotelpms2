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

/*
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
        mv.addObject("yearMonths", yearMonths);

        mv.setViewName("stock/PartnerCalculate");
        return mv;
    }
*/
@GetMapping("list")
public ModelAndView getCalculateList(@RequestParam("date") String date) throws Exception {
    ModelAndView mv = new ModelAndView();
    String yearMonths = PartnerCalculateService.getYearMonth(date);
    System.out.println("컨트롤러 스트링값: " + yearMonths);

    // yearMonth 변수 생성
    String yearMonth = yearMonths.substring(5); // 2023-06의 마지막 두 문자인 "06"을 추출
    System.out.println("yearMonth 변수: " + yearMonth);

    List<PartnerCalculateVO> stockList = PartnerCalculateService.getByYearMonth(yearMonths);
    System.out.println("컨트롤러 리스트: " + stockList);


    mv.addObject("list", stockList);
    mv.addObject("yearMonths", yearMonths); //2023-06 데이터를 넘김
    mv.addObject("yearMonth", yearMonth); // 06 데이터만 출력

    mv.setViewName("stock/PartnerCalculate");
    return mv;
}


    @GetMapping("receipt")
    public ModelAndView getReceipt(@RequestParam("date") String date, @RequestParam("businessNumber") String businessNumber) throws Exception {
        ModelAndView mv = new ModelAndView();
        String yearMonths = PartnerCalculateService.getYearMonth(date);
        System.out.println("컨트롤러 스트링값: " + yearMonths);

        System.out.println("컨트롤러 사업자  번호 리스트: " + businessNumber);
        List<PartnerCalculateVO> receiptList = PartnerCalculateService.getByReceipt(yearMonths,businessNumber);
        System.out.println("컨트롤러 리스트: " + receiptList);

        mv.addObject("list",receiptList);
        mv.setViewName("stock/receipt");
        return mv;
    }



}