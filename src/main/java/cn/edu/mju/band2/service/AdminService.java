package cn.edu.mju.band2.service;

import cn.edu.mju.band2.po.Admin;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AdminService {
    void save(Admin admin);
    void BatchDelete(Integer[] ids);
    void delete(Integer id);
    List<Admin> findAll();
    Admin findByName(String name);
    Admin findById(Integer id);
    List<Admin> findByDim(String admin_name);
}
