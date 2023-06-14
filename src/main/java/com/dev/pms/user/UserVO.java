package com.dev.pms.user;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

@Setter
@Getter
public class UserVO implements UserDetails {
    private String id;
    private String password;
    private String passwordCheck;
    private String phoneNumber;
    private String name;
    private String email;
    private String emailCheck;
    private String roleName;

    private Map<String,Object> attributes;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // 사용자의 권한을 반환
        // 여기서는 간단히 "ROLE_USER" 권한을 부여
        return Collections.singletonList(new SimpleGrantedAuthority("ROLE_MEMBER"));
    }

    @Override
    public String getUsername() {
        return id;
    }
    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        // 계정의 만료 여부
        // true : 만료가 안됨
        // false: 만료 됨, 로그인 안됨
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        // 계정의 잠김 여부
        // true : 잠기지 않음
        // false: 잠김
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        // password 만료 여부
        // true : 만료 안됨
        // false: 만료 됨, 로그인 안됨
        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        // 계정 사용 여부
        // true = 1: 계정 활성화
        // false = 0: 계정 비활성화, 로그인 안됨
        return true;
    }
}
