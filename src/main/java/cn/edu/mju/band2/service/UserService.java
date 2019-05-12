package cn.edu.mju.band2.service;

import cn.edu.mju.band2.po.LoginUser;
import cn.edu.mju.band2.po.User;
import java.util.List;

/**
 * @author zrb
 * */
public interface UserService {
    boolean addUser(User user);
    boolean deleteUser(Integer[] integers);
    boolean updateUser(User user);
    User selectUserById(Integer id);
    List<User> selectUserList();
    Integer selectUserListCount(User user);
    List<User> selectUserListByCondition(User user);
    // 身份验证
    boolean LoginCheck(LoginUser loginUser);
}
