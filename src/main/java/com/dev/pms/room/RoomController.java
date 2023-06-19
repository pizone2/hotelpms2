package com.dev.pms.room;

import com.dev.pms.stock.ManagerStockVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/room/*")
@Slf4j
public class RoomController {

    @Autowired
    private RoomService roomService;
    //URL 주소 변경해주기 테스트 URL room/rm
    @GetMapping ("roommanager")
    public ModelAndView getRealTimeRoom() throws  Exception{
        ModelAndView mv = new ModelAndView();
        //객실 호수를 받아오는 Roomlist 선언
        List<RoomVO> roomVOList = roomService.getRoomList();
        // 객실 상태를 받아오는 ReservedList 선언
        List<ReservedVO> reservedVOList = roomService.getRoomStatus();

        mv.addObject("status",reservedVOList);
        mv.addObject("room",roomVOList);
        mv.setViewName("room/roommanagement");
        return mv;
    }

    @GetMapping("roomSettingList")
    public ModelAndView getRoomSetting()throws Exception{
        ModelAndView mv = new ModelAndView();

        List<RoomTypeVO> roomSetting = roomService.getRoomSetting();

        mv.addObject("roomSetting",roomSetting);
        mv.setViewName("room/roomSetting");
        return mv;
    }

    @PostMapping("roomSetting")
    public String setQuantity(RoomTypeVO roomTypeVO) throws Exception {
        // 전송된 데이터 처리
        Long capacity = roomTypeVO.getCapacity();
        Long roomPrice = roomTypeVO.getRoomPrice();
        List<String> roomTypes = roomTypeVO.getRoomTypes();




        for (String roomType : roomTypes){
            roomTypeVO.setCapacity(capacity);
            roomTypeVO.setRoomPrice(roomPrice);
            roomTypeVO.setRoomType(roomType);
            System.out.println("capacity: "+capacity);
            System.out.println("roomPrice: "+roomPrice);
            System.out.println("roomType:"+roomType);
            roomService.setRoomSetting(roomTypeVO);

        }
        // 처리 로직 수행

        return "success";
    }

}
