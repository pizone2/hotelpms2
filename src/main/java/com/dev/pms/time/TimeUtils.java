package com.dev.pms.time;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.time.LocalTime;
import java.util.TimeZone;

public class TimeUtils {
    public static LocalTime getDesiredTime() {
        return LocalTime.of(15, 34); // Set the desired time as 3:34 PM (24-hour format)
    }
}
