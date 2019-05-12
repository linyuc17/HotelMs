package cn.edu.mju.band2.dao;

import cn.edu.mju.band2.po.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * @author 林峰阿
 */

public interface AdminDao {
    void insert(Admin admin);
    void BatchDelete(Integer[] ids);
    void delete(Integer id);
    void update(Admin admin);
    List<Admin> findAll();
    Admin findByName(String name);
    Admin findById(Integer id);
    List<Admin> findByDim(String admin_name);

}
