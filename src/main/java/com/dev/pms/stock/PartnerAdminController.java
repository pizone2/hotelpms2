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
}
