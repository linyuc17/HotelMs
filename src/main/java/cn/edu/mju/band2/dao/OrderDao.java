package cn.edu.mju.band2.dao;

import cn.edu.mju.band2.po.Order;

import java.util.List;

/**
 * @author  zrb
 * 订单的DAO层接口
 * */
public interface OrderDao {
    int addOrder(Order order);
    int deleteOrder(Integer[] integers);
    int updateOrder(Order order);
    Order selectOrderById(Integer id);
    List<Order> selectOrderList();
    Integer selectOrderListCount(Order order);
    List<Order> selectOrderListByCondition(Order order);
}
