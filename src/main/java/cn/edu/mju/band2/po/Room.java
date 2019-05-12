package cn.edu.mju.band2.po;

import org.springframework.web.multipart.MultipartFile;
import java.io.File;

public class Room {
    private Integer id;
    private String room_number;
    private String room_type;
    private String room_status;
    private String room_price;
    private String room_photo;
    private Integer start;
    private Integer rows;
    private MultipartFile file;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoom_number() {
        return room_number;
    }

    public void setRoom_number(String room_number) {
        this.room_number = room_number;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public String getRoom_status() {
        return room_status;
    }

    public void setRoom_status(String room_status) {
        this.room_status = room_status;
    }

    public String getRoom_price() {
        return room_price;
    }

    public void setRoom_price(String room_price) {
        this.room_price = room_price;
    }

    public String getRoom_photo() {
        return room_photo;
    }

    public void setRoom_photo(String room_photo) {
        this.room_photo = room_photo;
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

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", room_number='" + room_number + '\'' +
                ", room_type='" + room_type + '\'' +
                ", room_status='" + room_status + '\'' +
                ", room_price='" + room_price + '\'' +
                ", room_photo='" + room_photo + '\'' +
                '}';
    }
}
