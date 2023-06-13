package com.dev.pms.stock;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class ParthnerService {

    @Autowired
    private ParthnerDAO parthnerDAO;


    public PartnerVO getBusinessNumber(PartnerVO partnerVO) throws Exception{
        return parthnerDAO.getBusinessNumber(partnerVO);
    }

}
