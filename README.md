# :bell: 호텔 PMS 
## :blue_book: 목차

- :woman: [팀원](#팀원소개)
- :page_facing_up: [개요](#개요)
- :hammer: [기술 및 도구](#:hammer:-기술-및-도구)
- :computer: [기능구현](#기능구현)
  - [예약 사이트](#1.예약-사이트)
    - 로그인 및 회원가입
    - 마이페이지
    - 예약캘린더
    - 결제 
  - [호텔 PMS](#2.호텔-PMS)
    - 관리자(및 매니저)
    - 상품 판매
    - 용역 서비스
- :golf: [배포](#배포)
- :rotating_light: [Troubleshooting](#troubleshooting)



## :woman: 팀원소개
> **팀장:** 김민지
> 
> 예약사이트: 메인페이지, 일반 회원가입, 카카오 소셜 로그인(API), 일반 로그인, 다국어 설정, 전체예약캘린더
> 
> 호텔 PMS  : 메인페이지, 예약확정&재실 모듈, 문자발송 API, 업체별 품목 리스트, 관리자 업체 리스트, 객실 별 소모품 설정,통계(월별 및 객실별 매출통계)
>

> **팀원:** 김동현
>
> 

> **팀원:** 김희진
>
> 

> **팀원:** 김진서
> 
> 예약사이트: 결제 및 환불(API), 약관동의, 예약정보 및 결제내역페이지, 예약할인
> 
> 호텔 PMS  : 객실현황(간트차트), 알림(WebSocket), 발주(관리자 -> 업체), 객실 청소상태 보고 및 확인, 재고리스트, 객실설정, 통계(일별              및 객실별 매출통계)
>


## :page_facing_up: 개요
<p align="center">
  <br>
  <img src="src/main/resources/static/images/login/logo.svg" width="500" height="200">
  <br>
</p>

> **프로젝트:** 예약 사이트 & 호텔 PMS
>
> **기획 및 제작:** 김민지,김동현,김희진,김진서
>
> **분류:** 팀 프로젝트
>
> **제작 기간:** 2023.05.17 ~ 06.22
>
> **배포일:** 2023
>
> **사용 기술:** SPRING BOOT
>
> **문의:** kimmin7932@gmail.com

## :hammer: 기술 및 도구

|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JS, CSS3, JQuery|
|BackEnd|Java(JDK 1.8), Servlet, Spring, Mybatis|
|OS|Windows 10, MacOS|
|Libray&API|Spring Security, Validation, MailSender, Apache Commons FileUpload, WebSocket, Lombok, Fullcalendar, Kakaomap, KakaoLogin, Apache Poi
|IDE|IntelliJ, VisualStudio, DBeaver|
|Server|Tomcat(v8.5)|
|Document|Google Drive, KakaoOven, ERDCloud, EdrawMind|
|CI|Github|
|DateBase|AWS RDS, Oracle, Docker|
## :computer: 기능구현
### 1.예약 사이트

  #### 1-1. 다국어
   <img src="src/main/resources/static/images/gif/다국어.gif">

  - en 클릭 시 header, body, footer 등 언어가 모두 영어로 변경
  - ko 클릭시 이하 동문 모두 한국어로 변경 
  - 반응형 웹을 고려하여 모바일로 접근 시 네비게이션 메뉴 변경, 동일하게 다국어 지원

  #### 1-1. 예약
   <img src="src/main/resources/static/images/gif/Jun-30-2023%2021-29-43.gif">

  - PG 결제 연동 API를 사용하여 결제 기능 구현
  - 결제 후 결제 및 예약정보를 확인 할 수 있으며 환불 가능
  - 첫 예약 시 10% 할인 적용
  - 비로그인시 로그인 페이지로 이동하며  약관동의에 체크 완료 시 결제가능
   
  #### 1-2. 예약리스트
   <img src="src/main/resources/static/images/gif/Jul-01-2023 00-30-53.gif">

  - 예약 상세정보들을 확인 할 수 있으며 환불 가능
  - 예약리스트에 예약중인 객실이 없으면 예약페이지로 이동 링크 생성
  
### 2.호텔 PMS 

  #### 2-1. 객실현황
   <img src="src/main/resources/static/images/gif/Jul-01-2023 17-03-57.gif">
  
  - 2,3,4주 단위로 객실현황을 확인 할 수 있음
  - 타입,룸,날짜 별로 객실상태를 확인 할 수 있으며 튤팁을 활용하여 예약정보를 확인 할 수 있음
    
  #### 2-2. 객실청소상태 보고 및 확인
  <img src="src/main/resources/static/images/gif/Jul-01-2023 17-23-18.gif">

  - 청소담당자는 청소 후 청소상태를 보고 할 수 있으며 관리자는 청소상태를 확인 할 수 있음
  - 객실청소 확인 시 확인여부 변경 (미확인->확인)
    
  #### 2-3. 재고리스트
  <img src="src/main/resources/static/images/gif/Jul-01-2023 19-59-28.gif">

  - 재고수량이 자동발주수량이하로 떨어지면 발주상태는 '양호'에서 '재고부족'으로 변경되며
    관리자에게 알림 발송 ( 3번 상품의 재고가 부족합니다.)
  - 자동발주수량 수정가능
    
  #### 2-4. 발주
 <img src="src/main/resources/static/images/gif/Jul-01-2023 20-05-32.gif">

  - 관리자가 '재고부족' 알림 클릭시 재고리스트 페이지로 이동하며 재고부족 상품을 클릭하면 발주상태가 
    '발주요청'으로 바뀌고 해당 업체로 '발주요청' 알림이 발송 
  - 업체가 '발주요청' 알림클릭 시 업체별 재고 관리 리스트로 이동 후 업체는 해당 상품을 발주가능
  
  #### 2-5. 객실설정
 <img src="src/main/resources/static/images/gif/Jul-01-2023 15-49-57.gif">

  - 객실타입별로 인원 및 가격을 수정 가능

 #### 2-5. 매출분석(일별)
 <img src="src/main/resources/static/images/gif/Jul-02-2023 23-04-50.gif">

  - 객실별 예약 및 매출통계 확인 가능
 


## :golf: 배포
## :rotating_light: Troubleshooting

- [예약](TroubleShooting/reservation.md)
>- 비로그인 시 예약처리
>- 결제금액 오류
- [예약리스트](TroubleShooting/reservationList.md)
>- 환불 실패
- [객실현황](TroubleShooting/roomStatus.md)
>- 간트차트의 테이블 고장
- [객실청소상태 보고 및 확인](TroubleShooting/roomCleaningStatus.md)
>- 객실청소상태 확인 시 사진파일 로드 X
- [발주](TroubleShooting/order.md)
>- 페이지 'Reload' 시 'WebSocket'으로 구현한 알림이 사라짐
>- 관리자와 업체 알림 구분이 안됨
