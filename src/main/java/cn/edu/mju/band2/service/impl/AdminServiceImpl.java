package cn.edu.mju.band2.service.impl;

import cn.edu.mju.band2.dao.AdminDao;
import cn.edu.mju.band2.po.Admin;
import cn.edu.mju.band2.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public void save(Admin admin) {
        if(admin.getAdmin_id()!=null){
            adminDao.update(admin);
        }else{
            adminDao.insert(admin);
        }
    }

    @Override
    public void BatchDelete(Integer[] ids) {
        adminDao.BatchDelete(ids);
    }

    @Override
    public void delete(Integer id) {
        adminDao.delete(id);
    }

    @Override
    public List<Admin> findAll() {
        return adminDao.findAll();
    }

    @Override
    public Admin findByName(String name) {
        return adminDao.findByName(name);
    }

    @Override
    public Admin findById(Integer id) {
        return adminDao.findById(id);
    }
    @Override
    public List<Admin> findByDim(String admin_name) {
        return adminDao.findByDim(admin_name);
    }
}
