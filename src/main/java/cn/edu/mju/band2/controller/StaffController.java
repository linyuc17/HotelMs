package cn.edu.mju.band2.controller;

import cn.edu.mju.band2.po.Staff;
import cn.edu.mju.band2.service.IStaffService;
import cn.edu.mju.band2.utils.Page;
import cn.edu.mju.band2.utils.Params;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;


@Controller
public class StaffController {
    @Autowired
    private IStaffService staffService;
    /*Page p;

    @RequestMapping(value = "/findByPage")
    public ModelAndView findBypages(int page,ModelAndView model){
        try{
            p.setTotalStaff(staffService.findAll().size());
            p.setCurrentPage(page);
            List<Staff> staffList = staffService.findByPage((page-1) * p.getPageSize(),p.getPageSize());
            model.addObject("staffList",staffList);
            model.addObject("page",p);
            model.setViewName("jsp/admin/staff-list");
            return model;
        }catch (Exception e){
            e.printStackTrace();
            model.setViewName("jsp/admin/error");
            return model;
        }
    }*/

    @RequestMapping(value = "/staffListByPage")
    private ModelAndView index(HttpServletRequest request, HttpSession session, Params params) {
        Integer pageNo = 1;

        String s =request.getParameter("pageNo");
        if(s==null){
            pageNo = 1;
        }else{
            pageNo = Integer.parseInt(s);
        }
        ModelAndView modelAndView = new ModelAndView();

        Staff staffs = (Staff) session.getAttribute("staffs");
        //一开始第一页，查询10条
        params.setPageNo(pageNo);
        params.setPageSize(5);
        PageInfo<Staff> pageInfo = staffService.finds(params);
        List<Staff> staffList = pageInfo.getList();

        //查询数量
        Integer couts = staffService.staffCount();
        Integer totalPage = 0;
        if (couts%params.getPageSize()==0){
            totalPage = couts/params.getPageSize();
        }else {
            totalPage = couts/params.getPageSize()+1;
        }
        if (pageNo > totalPage){
            pageNo = totalPage;
        }
        modelAndView.addObject("staffList", staffList);
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("pageNo",params.getPageNo());
        modelAndView.setViewName("staff/list");
        return modelAndView;
    }

    @RequestMapping(value = "/staffList")
    public ModelAndView staffList() {
        List<Staff> staffList = staffService.findAll();
        ModelAndView mv = new ModelAndView();
        mv.addObject("staffList", staffList);
        mv.setViewName("staff/list");
        return mv;
    }

    public void data() {
        List<Staff> staffList = staffService.findAll();
        if (staffList != null) {
            for (Staff staff :
                    staffList) {
                System.out.println(staff.toString());
            }
        }
    }

    @RequestMapping("/staffAdd")
    private ModelAndView add() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("staff/au");
        mv.addObject("url", "/saveStaff");
        return mv;
    }

    @RequestMapping("/staffEdit/{staff_id}")
    public ModelAndView edit(@PathVariable Integer staff_id){
//        Staff staff = staffService.findById(staff_id);
        System.out.println("**********编辑页面的id***************" + staff_id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("staff",staffService.findById(staff_id));
        mv.addObject("url","/updateStaff");
        mv.setViewName("staff/au");
        return mv;
    }

    @RequestMapping(value = "/BatchDeleteStaff")
    public String Batchdelete(Integer[] ids){
        staffService.BatchDelete(ids);
        return "redirect:/staffList";
    }

    @RequestMapping(value = "/StaffDelete/{staff_id}")
    public String delete(@PathVariable Integer staff_id){
        System.out.println("执行删除方法！！！");
        staffService.delete(staff_id);
        return "redirect:/staffList";
    }

    @RequestMapping("/updateStaff")
    public String update(Staff staff){
        System.out.println("**********更新方法页面的id***************" + staff.getStaff_id());
        if(staff!=null) {
            staffService.save(staff);
        }
        return "redirect:/staffList";
    }

    @RequestMapping("/saveStaff")
    public String save(Staff staff, HttpServletRequest request) {
        /*System.out.println("***************************" + staff.getStaff_id());
        staffService.save(staff);
        return "redirect:/staffList";*/
        if(!staff.getFile().isEmpty()){
            String dirPath = request.getServletContext().getRealPath("/staffUpload/");
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = staff.getStaff_name() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                staff.getFile().transferTo(new File(dirPath + "//" +  NewFilename));

                staff.setStaff_photo(NewFilename);
                staffService.save(staff);
            }catch(Exception e){
                e.printStackTrace();
                return "admin/error";
            }
            return "redirect:/staffList";
        }else{
            return "admin/error";
        }
    }
}
