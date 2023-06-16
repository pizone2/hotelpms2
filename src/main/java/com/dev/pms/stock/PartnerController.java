package com.dev.pms.stock;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/partner/*")
@Slf4j
public class PartnerController {

    @Autowired
    private StockService parthnerService;

    @GetMapping("join")
    public ModelAndView setJoin(@ModelAttribute PartnerVO partnerVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("stock/Partnerregistration");
        return mv;
    }



}
