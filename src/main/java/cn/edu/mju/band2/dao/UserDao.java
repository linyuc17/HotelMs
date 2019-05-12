package cn.edu.mju.band2.dao;

import cn.edu.mju.band2.po.User;

import java.util.List;

/**
 * @author  zrb
 * 用户的DAO层接口
 * */
public interface UserDao{
    int addUser(User user);
    int deleteUser(Integer[] integers);
    int updateUser(User user);
    User selectUserById(Integer id);
    List<User> selectUserList();
    Integer selectUserListCount(User user);
    List<User> selectUserListByCondition(User user);
}
