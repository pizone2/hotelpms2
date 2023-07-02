:octocat: [Main](../../)
> Trouble Shooting

## 예약
- 비로그인 시 예약처리
  -  'Authentication'와 'SecurityContextHolder'를 이용하여 해결
- 결제금액 오류
  -  'toLocaleString()'로 대체하여 해결



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

> JSP에서 'SecurityContextHolder.getContext().getAuthentication()'을 통해 현재 사용자의 인증 정보를 가져온 다음,로그인 시 'true'를 부여,그렇지 않으면 'false'를 input 값에 넣음

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

> JS파일에서 결제버튼 클릭 시 로그인 중 이라면 결제가 정상적으로 진행되며,비로그인 상태면 예약페이지로 이동




#### 결제금액 오류
- 결제금액이 천 단위 이하 금액은 책정되지 않는 문제발생
```jsp
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:formatNumber value="" pattern="#,###"/>원
```

>  JSP파일에서 천 단위 구분 기호를 추가 한 뒤 결제금액을 계산해서 문제 발생

```js
  // //총합계금액 삽입해주기
    $("#paymentAmount").val(f);
    $("#paymentAmount1").text((f).toLocaleString()+'원');
    $("#discount").text('-'+(calculatedF).toLocaleString()+'원');
    $("#paymentAmount2").text((f-calculatedF).toLocaleString()+'원');
```

> JS파일에서 결제금액 계산 후 천 단위 기호를 추가하여 문제 해결
