package cn.edu.mju.band2.po;

import org.springframework.web.multipart.MultipartFile;

public class Staff {
    private Integer staff_id;
    private String staff_name;
    private String identity_number;
    private String staff_phone;
    private byte staff_gender;
    private String staff_photo;
    private byte staff_status;
    private MultipartFile file;

    public Staff() {
    }

    public Staff(Integer staff_id, String staff_name, String identity_number, String staff_phone, byte staff_gender, String staff_photo, byte staff_status, MultipartFile file) {
        this.staff_id = staff_id;
        this.staff_name = staff_name;
        this.identity_number = identity_number;
        this.staff_phone = staff_phone;
        this.staff_gender = staff_gender;
        this.staff_photo = staff_photo;
        this.staff_status = staff_status;
        this.file = file;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(Integer staff_id) {
        this.staff_id = staff_id;
    }

    public String getStaff_name() {
        return staff_name;
    }

    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }

    public String getIdentity_number() {
        return identity_number;
    }

    public void setIdentity_number(String identity_number) {
        this.identity_number = identity_number;
    }

    public String getStaff_phone() {
        return staff_phone;
    }

    public void setStaff_phone(String staff_phone) {
        this.staff_phone = staff_phone;
    }

    public byte getStaff_gender() {
        return staff_gender;
    }

    public void setStaff_gender(byte staff_gender) {
        this.staff_gender = staff_gender;
    }

    public String getStaff_photo() {
        return staff_photo;
    }

    public void setStaff_photo(String staff_photo) {
        this.staff_photo = staff_photo;
    }

    public byte getStaff_status() {
        return staff_status;
    }

    public void setStaff_status(byte staff_status) {
        this.staff_status = staff_status;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "staff_id=" + staff_id +
                ", staff_name='" + staff_name + '\'' +
                ", identity_number='" + identity_number + '\'' +
                ", staff_phone='" + staff_phone + '\'' +
                ", staff_gender=" + staff_gender +
                ", staff_photo='" + staff_photo + '\'' +
                ", staff_status=" + staff_status +
                ", file=" + file +
                '}';
    }
}
