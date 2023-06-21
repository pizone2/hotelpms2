package com.dev.pms.security;

import com.dev.pms.user.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.Set;

// 아직 구현할 생각없음 - 아이디 기억하기 체크
@Slf4j
public class UserSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = authentication.getPrincipal();
        if (principal instanceof UserVO) {
            UserVO user = (UserVO) principal;
            if (user.getRoleName().equals("ROLE_CLEAN")) {
                response.sendRedirect("/clean/cleanSchedule");

            } else if (user.getRoleName().equals("ROLE_STOCK")) {
                response.sendRedirect("/partnerStock/stockList");
            } else {
                response.sendRedirect("/");
            }
        }
    }
}