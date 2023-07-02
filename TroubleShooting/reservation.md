:octocat: [denlyou/TroubleShooting](https://github.com/denlyou/TroubleShooting)
> Trouble Shooting

## 예약
- 비로그인 시 예약처리
  - 대안 : axios 라이브러리 사용
- 시간 계산 문제
  - momentjs 라이브러리 활용
- selectbox 커스텀


#### 비로그인 시 예약처리
- 로그인을 하지않은 고객도 예약이 가능한 문제점 발견
```jsp
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<%
    // Check if the user is logged in
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    boolean loggedIn = authentication != null && authentication.isAuthenticated() &&             
                       !authentication.getPrincipal().equals("anonymousUser");
%>
    <input type="hidden" id="loggedInValue" value="<%= loggedIn %>">
```

> 'SecurityContextHolder.getContext().getAuthentication()'을 통해 현재 사용자의 인증 정보를 가져온 다음,로그인 시 'true'를
  부여,그렇지 않으면 'false'

```js
function requestPay() {
     let loggedIn = document.getElementById("loggedInValue").value === "true";

     if (loggedIn) {
        //로그인 시 결제
     } else {
        // 사용자가 로그인되어 있지 않은 경우, 로그인 창 열기
      alert("로그인 후 사용할 수 있습니다.");
      window.location.href = "../customer/login";
  }

```

> 결제버튼 클릭 시 로그인 중 이라면 결제가 정상적으로 진행되며,비로그인 상태면 예약페이지로 이동







#### 시간 계산 문제
- timezone문제로 `2010-05-24T24:00:00+0900`와 같은 시간 사용했었는데 크롬에서는 문제 없던 것이 익스에서는 제대로 동작을 안함
- moemntjs라는 좋은 라이브러리를 알게 됨 (http://momentjs.com/)
```js
moment("2010-10-20 4:30", "YYYY-MM-DD HH:mm");  // date 포멧과 시간 설정
var chdate = "2017-01-14T09:00:00+0900");
var ckdate = new Date( moment(chdate).unix()*1000 ); // unix 타임은 sec로 반환되서 1000을 계상해주어야 합
var _now = new Date();
if(ckdate.getTime() < _now.getTime()){
  alert('현재보다 과거 시간으로 설정할 수 없습니다.');
  return false;
};
```
