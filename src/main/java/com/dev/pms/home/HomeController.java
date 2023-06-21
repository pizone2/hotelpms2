package com.dev.pms.home;

import com.dev.pms.stock.StatisticsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/*")
public class HomeController {

    @Autowired
    private HomeService homeService;

    @GetMapping("/")
    public String home() throws  Exception{
        return "index";
    }

    @GetMapping("todaySales")
    public ModelAndView getTodaySales(HomeVO homeVO) throws Exception{
        ModelAndView mv = new ModelAndView();

        List<HomeVO> statisticsVOs = homeService.getTodaySales(homeVO);


        mv.addObject("statisticsVO",statisticsVOs);
        mv.setViewName("todaySales");
        return mv;
    }



}
