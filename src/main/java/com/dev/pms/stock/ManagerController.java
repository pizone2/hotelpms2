package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/stock/*")
public class ManagerController {



        @Autowired
        private ManagerService managerService;

        @GetMapping("managerStockList")
        public ModelAndView getStockList(ManagerStockVO managerStockVO) throws Exception{
            ModelAndView mv = new ModelAndView();

            List<ManagerStockVO> stockList = managerService.getStockList(managerStockVO);


            mv.addObject("stockList",stockList);
            mv.setViewName("stock/managerStockList");
            return mv;
        }

    @PostMapping("setQuantity")
    public String setQuantity(ManagerStockVO managerStockVO) throws Exception {
        // 전송된 데이터 처리
        Long quantity = managerStockVO.getQuantity();
        List<String> itemIds = managerStockVO.getItemIds();

        for (String itemId : itemIds){
            managerStockVO.setQuantity(quantity);
            managerStockVO.setItemId(Long.valueOf(itemId));

            managerService.setQuantity(managerStockVO);
        }
        return "success";
    }

    @PostMapping("orderStatus")
    public String setOrderStatus(ManagerStockVO managerStockVO) throws Exception {
        // 전송된 데이터 처리
       managerService.setOrderStatus(managerStockVO);

        return "success";
    }

    @GetMapping("todaySales")
    public ModelAndView getTodaySales(StatisticsVO statisticsVO) throws Exception{
        ModelAndView mv = new ModelAndView();

        List<StatisticsVO> statisticsVOs = managerService.getTodaySales(statisticsVO);


        mv.addObject("statisticsVO",statisticsVOs);
        mv.setViewName("stock/todaySales");
        return mv;
    }








}


