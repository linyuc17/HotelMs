package cn.edu.mju.band2.dao;

import cn.edu.mju.band2.po.Staff;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 林峰阿
 */

public interface StaffDao {
    void insert(Staff staff);
    void BatchDelete(Integer[] ids);
    void delete(Integer id);
    void update(Staff staff);
    List<Staff> findAll();
    Staff findByName(String name);
    Staff findById(Integer id);
    @Select("SELECT * FROM staff limit #{start},#{perPageStaff}")
    List<Staff> findByPage(@Param("start") int start ,@Param("perPageStaff") int perPageStaff) throws Exception;
    Integer selectStaffListCount(Staff staff);
    Integer staffCount();
    List<Staff> findsByDim(String staff_name);
}
