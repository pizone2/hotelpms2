package com.dev.pms.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {

    @Scheduled(cron = "*/3 * * * * *")
    public void updateOrderCompleted() throws Exception {
        System.out.println("테스트 테스트");

    }

}
