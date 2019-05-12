package cn.edu.mju.band2.controller;

import cn.edu.mju.band2.po.Admin;
import cn.edu.mju.band2.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/adminList")
    public ModelAndView adminList() {
        List<Admin> adminList = adminService.findAll();
        ModelAndView mv = new ModelAndView();
        mv.addObject("adminList", adminList);
        mv.setViewName("admin/list");
        return mv;
    }
    @RequestMapping(value = "/findByNameAdminName")
    public ModelAndView findByName(String admin_name){
        ModelAndView mv = new ModelAndView();
        Admin admin = adminService.findByName(admin_name);
        mv.addObject("admin",admin);
        mv.setViewName("admin/list");
        return mv;
    }

    public void data() {
        List<Admin> adminList = adminService.findAll();
        if (adminList != null) {
            for (Admin admin :
                    adminList) {
                System.out.println(admin.toString());
            }
        }
    }

    @RequestMapping("/AdminAdd")
    private ModelAndView add() {
        System.out.println("*******************添加方法");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/au");
        mv.addObject("url", "/SaveAdmin");
        System.out.println("111");
        return mv;
    }
    @RequestMapping("/edit/{admin_id}")
    public ModelAndView edit(@PathVariable Integer admin_id){
        Admin admin = adminService.findById(admin_id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("admin",admin);
        mv.addObject("url","/update");
        mv.setViewName("admin/au");
        return mv;
    }

    @RequestMapping(value = "/BatchDelete")
    public String BatchDelete(Integer[] ids){
        adminService.BatchDelete(ids);
        return "redirect:adminList";
    }

    @RequestMapping()
    public void ChangeStatus(){

    }

    @RequestMapping(value = "/delete/{admin_id}")
    public String delete(@PathVariable Integer admin_id){
        System.out.println("执行删除方法！！！");
        adminService.delete(admin_id);
        return "redirect:/adminList";
    }

    @RequestMapping("/update")
    public String update(Admin admin){
        adminService.save(admin);
        return "redirect:adminList";
    }

    @RequestMapping("/SaveAdmin")
    public String save(Admin admin, HttpServletRequest request) {

        /*String path = null;
        System.out.println("*****************保存方法");
        System.out.println(admin.toString());
        adminService.save(admin);
        return "redirect:/adminList";*/
        if(!admin.getFile().isEmpty()){
            System.out.println("111");
            String dirPath = request.getServletContext().getRealPath("/upload/admin/");
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = admin.getAdmin_name() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                admin.getFile().transferTo(new File(dirPath +  NewFilename));
                String sqlPath = NewFilename;
                admin.setAdmin_photo(sqlPath);
                adminService.save(admin);
            }catch(Exception e){
                e.printStackTrace();
                return "admin/error";
            }
            return "redirect:adminList";
        }else{
            return "admin/error";
        }
    }
}
