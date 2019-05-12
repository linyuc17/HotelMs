package cn.edu.mju.band2.service;

import cn.edu.mju.band2.po.Staff;
import cn.edu.mju.band2.utils.Params;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IStaffService {
    void save(Staff staff);
    void BatchDelete(Integer[] ids);
    void delete(Integer id);
    List<Staff> findAll();
    Staff findByName(String name);
    Staff findById(Integer id);
    List<Staff> findByPage(@Param("start") int start, @Param("perPageStaff") int perPageStaff) throws Exception;
    Integer staffCount();
    PageInfo<Staff> finds(Params params);
    List<Staff> findsByDim(String staff_name);
}
