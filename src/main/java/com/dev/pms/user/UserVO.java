package com.dev.pms.user;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserVO {
    private String id;
    private String password;
    private String passwordCheck;
    private String phoneNumber;
    private String name;
    private String email;
    private String emailCheck;
    private String roleName;

}
