package cn.edu.mju.band2.po;

public class LoginUser {

    private String loginUserId;

    private String loginUserPwd;

    public LoginUser() {
    }

    public String getLoginUserId() {
        return loginUserId;
    }

    public void setLoginUserId(String loginUserId) {
        this.loginUserId = loginUserId;
    }

    public String getLoginUserPwd() {
        return loginUserPwd;
    }

    public void setLoginUserPwd(String loginUserPwd) {
        this.loginUserPwd = loginUserPwd;
    }

    @Override
    public String toString() {
        return "LoginUser{" +
                "loginUserId='" + loginUserId + '\'' +
                ", loginUserPwd='" + loginUserPwd + '\'' +
                '}';
    }
}
