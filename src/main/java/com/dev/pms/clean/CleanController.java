package com.dev.pms.clean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CleanController {

    @Autowired
    private CleanService cleanService;
    @RequestMapping("clean/*")

    @GetMapping("cleanSchedule")
    public ModelAndView cleanSchedule(CalenderVO calenderVO) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("events", cleanService.getCleanList());
        mv.setViewName("clean/cleanSchedule");
        return mv;
    }



    public
}
