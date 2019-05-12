package cn.edu.mju.band2.service.impl;

import cn.edu.mju.band2.dao.OrderDao;
import cn.edu.mju.band2.po.Order;
import cn.edu.mju.band2.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    OrderDao orderDao;

    @Override
    public boolean addOrder(Order order) {
        if (orderDao.addOrder(order) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteOrder(Integer[] integers) {
        if (orderDao.deleteOrder(integers) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean updateOrder(Order order) {
        if (orderDao.updateOrder(order) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Order selectOrderById(Integer id) {
        return orderDao.selectOrderById(id);
    }

    @Override
    public List<Order> selectOrderList() {
        return orderDao.selectOrderList();
    }

    @Override
    public Integer selectOrderListCount(Order order) {
        return orderDao.selectOrderListCount(order);
    }

    @Override
    public List<Order> selectOrderListByCondition(Order order) {
        return orderDao.selectOrderListByCondition(order);
    }
}
