package com.dev.pms.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HoneController {
    @GetMapping("/")
    public String home() throws  Exception{
        return "index";
    }

    @GetMapping("chart")
    public String chart() throws Exception{
        return "chart";
    }


}
