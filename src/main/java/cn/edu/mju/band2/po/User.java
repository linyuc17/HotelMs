package cn.edu.mju.band2.po;
/**
 * @author  zrb
 * 用户的持久化类
 * */
public class User {
    private Integer userId;
    private String userPassword;
    private String userName;
    private String identityNumber;
    private String userPhone;
    private Integer userGender;
    private String userPhoto;
    private Integer userStatus;
    private Integer start;
    private Integer rows;

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userPassword='" + userPassword + '\'' +
                ", userName='" + userName + '\'' +
                ", identityNumber='" + identityNumber + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", userGender=" + userGender +
                ", userPhoto='" + userPhoto + '\'' +
                ", userStatus=" + userStatus +
                ", start=" + start +
                ", rows=" + rows +
                '}';
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public User(Integer userId, String userPassword, String userName, String identityNumber, String userPhone, Integer userGender, String userPhoto, Integer userStatus, Integer start, Integer rows) {
        this.userId = userId;
        this.userPassword = userPassword;
        this.userName = userName;
        this.identityNumber = identityNumber;
        this.userPhone = userPhone;
        this.userGender = userGender;
        this.userPhoto = userPhoto;
        this.userStatus = userStatus;
        this.start = start;
        this.rows = rows;
    }

    public User() {
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public Integer getUserGender() {
        return userGender;
    }

    public void setUserGender(Integer userGender) {
        this.userGender = userGender;
    }

    public String getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(String userPhoto) {
        this.userPhoto = userPhoto;
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public User(Integer userId, String userPassword, String userName,
                String identityNumber, String userPhone, Integer userGender, String userPhoto, Integer userStatus) {
        this.userId = userId;
        this.userPassword = userPassword;
        this.userName = userName;
        this.identityNumber = identityNumber;
        this.userPhone = userPhone;
        this.userGender = userGender;
        this.userPhoto = userPhoto;
        this.userStatus = userStatus;
    }
}
