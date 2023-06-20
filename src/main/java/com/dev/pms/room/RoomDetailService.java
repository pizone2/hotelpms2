package com.dev.pms.room;

import com.dev.pms.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomDetailService {
    @Autowired
    private RoomDetailDAO roomDAO;


    public BookingVO getResDetail(Long aLong) throws  Exception{
        return roomDAO.getResDetail(aLong);
    }

    public BookingVO getRoomDetail(Long aLong) throws  Exception{
        return roomDAO.getRoomDetail(aLong);
    }

    public UserVO getManagerInfo() throws Exception {
        return roomDAO.getManagerInfo();
    }

    public List<BookingVO> getResDate(BookingVO bookingVO) throws Exception{
        return roomDAO.getResDate(bookingVO);
    }

    public BookingVO getResNowDate(BookingVO bookingVO) throws Exception{
        return roomDAO.getResNowDate(bookingVO);
    }

    public int setBookingUpdate(BookingVO bookingVO) throws Exception{
        return roomDAO.setBookingUpdate(bookingVO);
    }

    public int setReservedUpdate(ReservedVO reservedVO) throws Exception{
        return roomDAO.setReservedUpdate(reservedVO);
    }

    public int setRoomUpdate(ReservedVO reservedVO) throws Exception{
        return roomDAO.setRoomUpdate(reservedVO);
    }

    public int setStatusHouse(BookingVO bookingVO) throws Exception{
        int result = roomDAO.setStatusHouse(bookingVO);
        if(result>=1){
            result = roomDAO.setStockOut(bookingVO);
        }
        List<ChangeStockVO> stockList = roomDAO.getStockList();

        for (ChangeStockVO stock : stockList) {
            Long inventoryId = stock.getInventoryId();
            Long currentStock = stock.getCurrentStock();
            Long autoOrderQuantity = stock.getAutoOrderQuantity();
            String orderStatus = stock.getOrderStatus();
            if ((currentStock == null || currentStock < autoOrderQuantity) && "양호".equals(orderStatus)) {
                roomDAO.setOrderStatus(stock);
            }

        }

        System.out.println("StatusTest");


        return result;
    }

    public int setCleanAsk(BookingVO bookingVO) throws Exception {
        return roomDAO.setCleanAsk(bookingVO);
    }
}
