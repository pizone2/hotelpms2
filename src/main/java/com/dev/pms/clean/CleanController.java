package com.dev.pms.clean;

import com.dev.pms.room.ReservedVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/clean/*")
public class CleanController {

    @Autowired
    private CleanService cleanService;


    @GetMapping("/cleanSchedule")
    public ModelAndView cleanSchedule(CalenderVO calenderVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<CalenderVO>calenderVOList=cleanService.getCleanList(calenderVO);
        List<ReservedVO>RequestClean =cleanService.getRequestClean(calenderVO);
        mv.addObject("events",calenderVOList);
        mv.addObject("request",RequestClean);
        mv.setViewName("clean/cleanSchedule");

        return mv;
    }

    @GetMapping("roomClean")
    public  ModelAndView getRoomCleanList(RoomCleanVO roomCleanVO)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<RoomCleanVO> roomCleanList = cleanService.getRoomCleanList(roomCleanVO);
        mv.addObject("roomCleanVO",roomCleanList);
        mv.setViewName("clean/roomClean");

        return mv;
    }




    @PostMapping("insertSchedule")
    public ModelAndView insertSchedule(CalenderVO calenderVO) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = cleanService.insertSchedule(calenderVO);
        mv.setViewName("redirect:/clean/cleanSchedule");
        return mv;
    }
    @PostMapping("/deleteSchedule")
    public ModelAndView deleteSchedule(CalenderVO calenderVO)throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = cleanService.deleteSchedule(calenderVO);
        return mv;
    }

    @PostMapping ("/updateCleaningInProgress")
    public ModelAndView updateCleaningInProgress(ReservedVO reservedVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = cleanService.updateCleaningInProgress(reservedVO);
        return mv;
    }

    @PostMapping("/cleaningComplete")
    public ModelAndView CleaningComplete(ReservedVO reservedVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = cleanService.CleaningComplete(reservedVO);
        return mv;
    }
    @GetMapping("/upload")
    public String testUploadForm() {

        return "test/uploadTest";
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile multipartFile,RoomCleanVO roomCleanVO) throws Exception {
        cleanService.setRoomClean(roomCleanVO);
        cleanService.saveFile(multipartFile);


        System.out.println(roomCleanVO.getNote());
        System.out.println(roomCleanVO.getRoomNumber());
        System.out.println(roomCleanVO.getScheduleNumber());


//        for (MultipartFile filesd : files) {
//            cleanService.saveFile(filesd);
//        }

        return "redirect:/";
    }   @PostMapping("/cleanStatus")
    public String insertSchedule(RoomCleanVO roomCleanVO) throws Exception {
        cleanService.setCleanStatus(roomCleanVO);

        return "redirect:/";
    }







}
