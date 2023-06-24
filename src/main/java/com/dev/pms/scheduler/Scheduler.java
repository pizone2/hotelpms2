package com.dev.pms.scheduler;

import com.dev.pms.clean.CleanService;
import com.dev.pms.room.BookingVO;
import com.dev.pms.room.ReservedVO;
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
    private CleanService cleanService;
    public Scheduler(PartnerManagerStockService partnerManagerStockService,CleanService cleanService) {
        this.partnerManagerStockService = partnerManagerStockService;
        this.cleanService = cleanService;
    }

    //매일 오전9시 발주완료 변경
//    @Scheduled(cron = "0 0 9 * * *")
    @Scheduled(cron = "*/10 * * * * *")
    public void updateOrderCompleted() throws Exception {
        ManagerStockVO managerStockVO = new ManagerStockVO();
        int result = partnerManagerStockService.updateOrderCompleted(managerStockVO);
        int result2 = partnerManagerStockService.updateOrderCompleted2(managerStockVO);
        int result3 = partnerManagerStockService.updateOrderCompleted3(managerStockVO);

        //발주중이 발주 완료로 변경되면 값도 변경되겠금 구현
        System.out.println("테스트 테스트");

    }
    // 매일 2시에 변경(퇴실 시간 2시였던가?)
//    @Scheduled(cron = "*/10 * * * * *" )
    public void updateCheckout() throws Exception {
        BookingVO bookingVO = new BookingVO();
        int result = cleanService.updateCheckout(bookingVO);
        System.out.println("퇴실퇴실");
    }
    // 2시 10분에 퇴실 방 청소 요청으로 변경(퇴실후 10분뒤)
    @Scheduled(cron = "*/10 * * * * *")
    public void updateCheckoutCleaning() throws Exception {
        ReservedVO reservedVO = new ReservedVO();
        int result = cleanService.updateCheckoutCleaning(reservedVO);
        System.out.println("퇴실 후 청소요청");

    }
}
