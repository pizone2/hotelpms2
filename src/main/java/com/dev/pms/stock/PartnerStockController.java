package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/partnerStock/*")
public class PartnerStockController {

    @Autowired
    private StockService partnerStockService;

    @GetMapping("stockList")
    public ModelAndView getStockList(String businessNumber) throws Exception {
        ModelAndView mv = new ModelAndView();
        businessNumber = "2618123567";
        List<PartnerStockVO> list = partnerStockService.getStockList(businessNumber);
        mv.addObject("list",list);
        mv.setViewName("stock/partnerStockList");
        return mv;
    }
    @PostMapping("stockInsert")
    public ModelAndView setPartnerStock(PartnerStockVO partnerStockVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = partnerStockService.setPartnerStock(partnerStockVO);
        mv.setViewName("redirect:/partnerStock/stockList");
        return mv;
    }

    @PostMapping("stockUpdate")
    public ModelAndView setStockUpdate(PartnerStockVO partnerStockVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = partnerStockService.setStockUpdate(partnerStockVO);
        mv.setViewName("redirect:/partnerStock/stockList");
        return mv;
    }

    @PostMapping("stockDelete")
    @ResponseBody
    public int stockDelete(@RequestParam Long itemIds[]) throws Exception{
        int result=0;
        //boolean check = false;
        log.error(":::::{}:::::",itemIds.length);
        for (Long itemId : itemIds) {
            result = partnerStockService.setStockDelete(itemId);
        }
        return result;
    }
}
