package cn.edu.mju.band2.po;

import org.springframework.web.multipart.MultipartFile;

public class Message {
    private Integer message_id;
    private String message_username;
    private String message_user_photo;
    private String message_date;
    private String message_content;
    private Integer message_like;
    private String message_content_photo;
    private Integer start;
    private Integer rows;
    private MultipartFile file;
    public Message(Integer message_id, Integer message_like){
        this.message_id = message_id;
        this.message_like = message_like;
    }
    public Message(){}

    public Integer getMessage_id() {
        return message_id;
    }

    public void setMessage_id(Integer message_id) {
        this.message_id = message_id;
    }

    public String getMessage_username() {
        return message_username;
    }

    public void setMessage_username(String message_username) {
        this.message_username = message_username;
    }

    public String getMessage_user_photo() {
        return message_user_photo;
    }

    public void setMessage_user_photo(String message_user_photo) {
        this.message_user_photo = message_user_photo;
    }

    public String getMessage_date() {
        return message_date;
    }

    public void setMessage_date(String message_date) {
        this.message_date = message_date;
    }

    public String getMessage_content() {
        return message_content;
    }

    public void setMessage_content(String message_content) {
        this.message_content = message_content;
    }

    public Integer getMessage_like() {
        return message_like;
    }

    public void setMessage_like(Integer message_like) {
        this.message_like = message_like;
    }

    public String getMessage_content_photo() {
        return message_content_photo;
    }

    public void setMessage_content_photo(String message_content_photo) {
        this.message_content_photo = message_content_photo;
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
        return "Message{" +
                "message_id=" + message_id +
                ", message_username='" + message_username + '\'' +
                ", message_user_photo='" + message_user_photo + '\'' +
                ", message_date='" + message_date + '\'' +
                ", message_content='" + message_content + '\'' +
                ", message_like='" + message_like + '\'' +
                ", message_content_photo='" + message_content_photo + '\'' +
                '}';
    }
}
