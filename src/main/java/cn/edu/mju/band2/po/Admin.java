package cn.edu.mju.band2.po;

import org.springframework.web.multipart.MultipartFile;

public class Admin {
    private Integer admin_id;
    private String admin_password;
    private String admin_name;
    private String identity_number;
    private byte admin_gender;
    private String admin_photo;
    private String admin_phone;
    private byte admin_status;
    private String admin_email;
    private MultipartFile file;

    public Admin() {
    }


    public Admin(Integer admin_id, String admin_password, String admin_name, String identity_number, byte admin_gender, String admin_photo, String admin_phone, byte admin_status, String admin_email, MultipartFile file) {
        this.admin_id = admin_id;
        this.admin_password = admin_password;
        this.admin_name = admin_name;
        this.identity_number = identity_number;
        this.admin_gender = admin_gender;
        this.admin_photo = admin_photo;
        this.admin_phone = admin_phone;
        this.admin_status = admin_status;
        this.admin_email = admin_email;
        this.file = file;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public byte getAdmin_status() {
        return admin_status;
    }

    public void setAdmin_status(byte admin_status) {
        this.admin_status = admin_status;
    }

    public Integer getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(Integer admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getIdentity_number() {
        return identity_number;
    }

    public void setIdentity_number(String identity_number) {
        this.identity_number = identity_number;
    }

    public byte getAdmin_gender() {
        return admin_gender;
    }

    public void setAdmin_gender(byte admin_gender) {
        this.admin_gender = admin_gender;
    }

    public String getAdmin_photo() {
        return admin_photo;
    }

    public void setAdmin_photo(String admin_photo) {
        this.admin_photo = admin_photo;
    }

    public String getAdmin_phone() {
        return admin_phone;
    }

    public void setAdmin_phone(String admin_phone) {
        this.admin_phone = admin_phone;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_id=" + admin_id +
                ", admin_password='" + admin_password + '\'' +
                ", admin_name='" + admin_name + '\'' +
                ", identity_number='" + identity_number + '\'' +
                ", admin_gender=" + admin_gender +
                ", admin_photo='" + admin_photo + '\'' +
                ", admin_phone='" + admin_phone + '\'' +
                ", admin_status=" + admin_status +
                ", admin_email='" + admin_email + '\'' +
                ", file=" + file +
                '}';
    }
}
