package com.dev.pms.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/room/*")
public class RoomController {
    @GetMapping("resConfirmed")
    public String getBookingList() throws Exception {
        return "/room/resConfirmed";
    }
}
