package com.dev.pms.clean;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
public class CleanController {

    @Autowired
    private CleanService cleanService;
    @RequestMapping("clean/*")

    @GetMapping("cleanSchedule")
    public ModelAndView cleanSchedule(CalenderVO calenderVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<CalenderVO>calenderVOList=cleanService.getCleanList(calenderVO);
        mv.addObject("events",calenderVOList);
        mv.setViewName("clean/cleanSchedule");
        for (CalenderVO event : calenderVOList) {
            System.out.println(event.getScheduleStartdate());
        }
        return mv;
    }

    public ModelAndView updateSchedule(CalenderVO calenderVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        return mv;
    }

}
