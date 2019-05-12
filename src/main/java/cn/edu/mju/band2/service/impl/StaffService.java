package cn.edu.mju.band2.service.impl;

import cn.edu.mju.band2.dao.StaffDao;
import cn.edu.mju.band2.po.Staff;
import cn.edu.mju.band2.service.IStaffService;
import cn.edu.mju.band2.utils.Params;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Properties;

@Service
public class StaffService implements IStaffService {
    @Autowired
    private StaffDao staffDao;

    @Override
    public void save(Staff staff) {
        System.out.println(staff.getStaff_id());
        if(staff.getStaff_id()!=null){
            System.out.println(staff.getStaff_id());
            staffDao.update(staff);
        }else{
            staffDao.insert(staff);
        }
    }

    @Override
    public void BatchDelete(Integer[] ids) {
        staffDao.BatchDelete(ids);
    }

    @Override
    public void delete(Integer id) {
        staffDao.delete(id);
    }

    @Override
    public List<Staff> findAll() {
        return staffDao.findAll();
    }

    @Override
    public Staff findByName(String name) {
        return staffDao.findByName(name);
    }

    @Override
    public Staff findById(Integer id) {
        return staffDao.findById(id);
    }

    @Override
    public List<Staff> findByPage(int start, int perPageStaff) throws Exception {
        List<Staff> list = staffDao.findByPage(start,perPageStaff);
        return list;
    }

    @Override
    public Integer staffCount() {
        return staffDao.staffCount();
    }

    public PageHelper pageHelper(){
        PageHelper pageHelper = new PageHelper();
        Properties properties = new Properties();
        properties.setProperty("offsetAsPageNum","true");
        properties.setProperty("rowBoundsWithCount","true");
        properties.setProperty("reasonable","true");
        properties.setProperty("dialect","mysql");
        pageHelper.setProperties(properties);
        return pageHelper;
    }
    @Override
    public PageInfo<Staff> finds(Params params) {
        Integer pageNo = params.getPageNo();
        int pageSize = params.getPageSize();
        PageHelper.startPage(pageNo, pageSize);

        List<Staff> staffs = staffDao.findAll();
        PageInfo<Staff> pageInfo = new PageInfo<Staff>(staffs);
        return pageInfo;
    }

    @Override
    public List<Staff> findsByDim(String staff_name) {
        return staffDao.findsByDim(staff_name);
    }
}
