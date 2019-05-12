package cn.edu.mju.band2.service.impl;

import cn.edu.mju.band2.dao.UserDao;
import cn.edu.mju.band2.po.LoginUser;
import cn.edu.mju.band2.po.User;
import cn.edu.mju.band2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public boolean addUser(User user) {
        if (userDao.addUser(user) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteUser(Integer[] integers) {
        if (userDao.deleteUser(integers) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        if (userDao.updateUser(user) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public User selectUserById(Integer id) {

        return userDao.selectUserById(id);
    }

    @Override
    public List<User> selectUserList() {
        return userDao.selectUserList();
    }

    @Override
    public Integer selectUserListCount(User user) {
        return userDao.selectUserListCount(user);
    }

    @Override
    public List<User> selectUserListByCondition(User user) {
        return userDao.selectUserListByCondition(user);
    }

    @Override
    public boolean LoginCheck(LoginUser loginUser) {
        Integer loginId = Integer.valueOf(loginUser.getLoginUserId());
        String loginPwd = loginUser.getLoginUserPwd();
        User u = userDao.selectUserById(loginId);
        if (u != null && loginPwd.equals(u.getUserPassword())) {
            return true;
        }
        return false;
    }
}
