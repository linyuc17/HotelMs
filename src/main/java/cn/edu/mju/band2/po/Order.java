package cn.edu.mju.band2.po;

import java.sql.Timestamp;

/**
 * @author zrb
 * 订单的持久化类
 */
public class Order {
    private Integer orderId;
    private Integer userId;
    private Integer roomId;
    private Integer adminId;
    private Integer roomType;
    /** 0:处理中 9:处理完*/
    private Integer orderStatus;
    private Timestamp orderDate;
    private Integer start;
    private Integer rows;
    private String startDate;
    private String endDate;

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", roomId=" + roomId +
                ", adminId=" + adminId +
                ", roomType=" + roomType +
                ", orderStatus=" + orderStatus +
                ", orderDate=" + orderDate +
                ", start=" + start +
                ", rows=" + rows +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                '}';
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
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

    public Order(Integer orderId, Integer userId, Integer roomId, Integer roomType, Integer adminId, Timestamp orderDate, Integer orderStatus, Integer start, Integer rows) {
        this.orderId = orderId;
        this.userId = userId;
        this.roomId = roomId;
        this.adminId = adminId;
        this.roomType = roomType;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.start = start;
        this.rows = rows;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getRoomType() {
        return roomType;
    }

    public void setRoomType(Integer roomType) {
        this.roomType = roomType;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public Order() {
    }

    public Order(Integer orderId, Integer userId, Integer roomId, Integer adminId, Integer roomType, Integer orderStatus, Timestamp orderDate) {
        this.orderId = orderId;
        this.userId = userId;
        this.roomId = roomId;
        this.adminId = adminId;
        this.roomType = roomType;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
    }
}
