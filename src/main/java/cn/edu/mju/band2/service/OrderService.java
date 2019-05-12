package cn.edu.mju.band2.service;

import cn.edu.mju.band2.po.Order;
import org.springframework.stereotype.Service;

import java.util.List;

public interface OrderService {
    boolean addOrder(Order order);
    boolean deleteOrder(Integer[] integers);
    boolean updateOrder(Order order);
    Order selectOrderById(Integer id);
    List<Order> selectOrderList();
    Integer selectOrderListCount(Order order);
    List<Order> selectOrderListByCondition(Order order);
}
