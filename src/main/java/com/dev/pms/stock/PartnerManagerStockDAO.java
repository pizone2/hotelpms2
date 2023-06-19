package com.dev.pms.stock;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PartnerManagerStockDAO {

    public List<ManagerStockVO> getPartnerManagerList(ManagerStockVO managerStockVO)throws Exception;

    public int updateInProgress(ManagerStockVO managerStockVO) throws Exception;

    public int updateOrderCompleted(ManagerStockVO managerStockVO) throws Exception;

    public int updateGoodStock(ManagerStockVO managerStockVO) throws Exception;

}
