package com.dev.pms.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/partnerManager/*")
public class PartnerManagerStockController {
    @Autowired
    private PartnerManagerStockService partnerManagerStockService;




    @GetMapping("partnerManagerStockList")
    public ModelAndView getPartnerManagerList(ManagerStockVO managerStockVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<ManagerStockVO> managerStockVOS = partnerManagerStockService.getPartnerManagerList(managerStockVO);
        mv.addObject("partnerManagerList",managerStockVOS);
        mv.setViewName("stock/partnerManagerStockList");
        return mv;
    }

    @PostMapping("/updateInProgress")
    public ModelAndView updateInProgress(ManagerStockVO managerStockVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = partnerManagerStockService.updateInProgress(managerStockVO);
        return mv;
    }

    @ResponseBody
    @GetMapping("/updateTable")
    public ModelAndView updateTable (ManagerStockVO managerStockVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<ManagerStockVO> managerStockVOS = partnerManagerStockService.getPartnerManagerList(managerStockVO);
        mv.addObject("partnerManagerList",managerStockVOS);
        mv.setViewName("/temp/partnerManagerStockAjax");
        return mv;
    }


}
