package com.dev.pms.security;

import com.dev.pms.user.UserDAO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Slf4j
@Component
public class UserLogoutSucessHandler implements LogoutSuccessHandler {
    @Autowired
    private UserDAO userDAO;
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        // TODO Auto-generated method stub
        log.error("=============logout success handler ================");
        log.error("============={}=============",userDAO);
        response.sendRedirect("/");
    }
}
