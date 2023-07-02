
:octocat: [Main](/)
> Trouble Shooting

## 예약리스트
- 환불 실패
  -  실패 시 반환되는 'Response Code'와 'message'를 분석 후 API제공 홈페이지를 이용하여 문제 해결


#### 환불 실패
- 예약리스트에서 환불이 되지않는 문제 발생
```js
function cancelPayments(reservationNumber,checkinDate,checkoutDate){
    alert("정말로 환불 하시겠습니까?")
    $.ajax({
        type:"POST",
        url:"/pay/cancelPayments",
        data: {
            'reservationNumber':reservationNumber,
            'checkinDate': checkinDate,
            'checkoutDate': checkoutDate
        },
        success: function(result){
            alert("결제금액 환불완료");
            location.href = "./paymentList";

        },
        error: function(result){
            alert("결제금액 환불못함. 이유: "+result.responseText);
        }
    });
}
```

> 해당 코드에서 'result.responseText'로 '취소할 imp_uid를 지정해주셔야합니다.'라는 'message'와 200이라는 'Response Code'를 받음

```java
    @PostMapping("/cancelPayments")
    public ModelAndView cancelPayments(PayVO payVO) throws Exception {
        System.out.println("ControllerTest"+payVO.getReservationNumber());

        String reservationNumber = payVO.getReservationNumber();
        CancelData data = new CancelData(reservationNumber, false); // merchant_uid에 값을 설정하는 경우

        System.out.println(reservationNumber);

        IamportResponse<Payment> cancel = iamportClientApi.cancelPaymentByImpUid(data);//취소

        ModelAndView modelAndView = new ModelAndView("common/ajaxResult");
        modelAndView.addObject("cancelResponse", cancel);

        payService.setPayDelete(payVO);
        return modelAndView;
    }

```

> API제공 홈페이지에서 메시지와 코드 분석 후 'imp_uid'대신 'merchant_uid'사용시 추가 로직이 필요함을 확인, Controller에서
> 'CancelData data = new CancelData(reservationNumber, false);' 로직추가
> * imp_uid = 취소할 거래의 아임포트 고유번호
> * merchant_uid = 가맹점에서 전달한 거래 고유번호



