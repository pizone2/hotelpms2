package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Slf4j
@RequestMapping("/partnerStock/*")
public class PartnerStockController {

    @Autowired
    private PartnerStockService partnerStockService;

    @GetMapping("stockList")
    public ModelAndView getStockList() throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("stock/partnerStockList");
        return mv;
    }
}
