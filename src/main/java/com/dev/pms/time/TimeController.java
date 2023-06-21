package com.dev.pms.time;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.LocalTime;


@RestController
public class TimeController {

    @GetMapping("/Time")
    public String getDesiredTime() {
        LocalTime desiredTime = TimeUtils.getDesiredTime();

        return desiredTime.toString();
    }
}