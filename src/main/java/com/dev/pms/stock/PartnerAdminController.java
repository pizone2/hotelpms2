package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/partnerAdmin/*")
public class PartnerAdminController {
    @Autowired
    private StockService stockService;

    @GetMapping("partnerList")
    public ModelAndView getStockList() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<PartnerVO> list = stockService.getPartnerList();
        mv.addObject("list",list);
        mv.setViewName("stock/partnerAdminList");
        return mv;
    }


    @PostMapping("partnerDelete")
    @ResponseBody
    public int stockDelete(@RequestBody List<String> businessNumbers) throws Exception{
        int result=0;
        //boolean check = false;
        log.error(":::::{}:::::",businessNumbers.get(0));
        for (String businessNumber : businessNumbers) {
            result = stockService.setPartnerDelete(businessNumber);
        }
        return result;
    }

    @PostMapping("partnerUpdate")
    @ResponseBody
    public int stockUpdate(String businessNumber) throws Exception{
        log.error(":::::{}:::::",businessNumber);
        int result = stockService.setPartnerUpdate(businessNumber);
        return result;
    }
}
