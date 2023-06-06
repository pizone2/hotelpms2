package com.dev.pms.clean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CleanController {

    @RequestMapping("clean/*")

    @GetMapping("cleanSchedule")
    public String cleanSchedule() {
        return "clean/cleanSchedule";
    }
}
