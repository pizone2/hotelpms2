package com.dev.pms.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 아직 구현할 생각없음 - 아이디 기억하기 체크
@Slf4j
public class UserSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        log.error("===============login 성공 후 실행 =======================");
        //로그인 성공했을때 쿠키를 만들어 사용자에게 보냄
        //해당 쿠키가 있으면 뿌려줌
        String remember = request.getParameter("remember");

        log.error("======{}========",remember);

        if(remember !=null && remember.equals("remember")) {

            Cookie cookie = new Cookie("remember",authentication.getName());
            cookie.setMaxAge(60*60*24);

            response.addCookie(cookie);
        } else {
            Cookie[] cookies  =request.getCookies();
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("remember")) {
                    cookie.setMaxAge(0);

                    response.addCookie(cookie);
                }
            }
        }

        response.sendRedirect("/");
    }

}