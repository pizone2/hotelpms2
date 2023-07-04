package com.dev.pms.stock;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PartnerService {

    @Autowired
    private PartnerDAO partnerDAO;

    @Autowired
    private StockDAO stockDAO;

    public boolean getBusinessNumber(String businessNumber) throws Exception {
        // DAO를 사용하여 DB에서 사업자 등록 번호를 검색하고 일치 여부를 확인하는 로직을 구현합니다.
        // 예시로 PartnerDAO의 메서드를 호출하여 구현합니다.
        PartnerVO partner = partnerDAO.getBusinessNumber(businessNumber);

        return partner != null; // partner가 null이면 일치하는 값이 없는 것으로 판단합니다.
    }

    public int setPartner(PartnerVO partnerVO) throws Exception {
        if(partnerVO.getSectors().equals("ROLE_STOCK")){
            String uniqueCharacter = generateUniqueCharacter();
            partnerVO.setUniqueCharacter(uniqueCharacter);
            log.error(":::::::{}::::::::",partnerVO.getUniqueCharacter());
        }
        return  partnerDAO.setPartner(partnerVO);
    }

    private String generateUniqueCharacter() throws Exception{
        // 로직은 파트너 수에 따라 고유 문자를 생성합니다.
        // 예를 들어, ASCII 코드를 이용하여 'A'부터 시작해 파트너 수를 추가하여 문자를 생성합니다.
        Integer count = stockDAO.countPartners();
        char uniqueCharacter = (char) ('A' + count);
        return String.valueOf(uniqueCharacter);
    }

}