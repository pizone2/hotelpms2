package com.dev.pms.scheduler;

import com.dev.pms.stock.ManagerStockVO;
import com.dev.pms.stock.PartnerManagerStockService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import javax.swing.*;
@Slf4j
@Component
public class Scheduler {

    private PartnerManagerStockService partnerManagerStockService;

    public Scheduler(PartnerManagerStockService partnerManagerStockService) {
        this.partnerManagerStockService = partnerManagerStockService;
    }

    @Scheduled(cron = "*/10 * * * * *")
    public void updateOrderCompleted() throws Exception {
        ModelAndView mv = new ModelAndView();
        ManagerStockVO managerStockVO = new ManagerStockVO();
        int result = partnerManagerStockService.updateOrderCompleted(managerStockVO);

        System.out.println("테스트 테스트");

    }

    // 페이지 새로고침

}
