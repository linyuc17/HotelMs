package cn.edu.mju.band2.controller;

import cn.edu.mju.band2.po.Admin;
import cn.edu.mju.band2.po.Json;
import cn.edu.mju.band2.service.AdminService;
import cn.edu.mju.band2.utils.CodeUtil2;
import cn.edu.mju.band2.utils.ReturnInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/adminLogin")
    public String login(){
        return "admin/login";
    }
    @RequestMapping("/adminLogout")
    public String adminLogout(HttpSession session){
        session.invalidate();
        return "redirect:adminLogin";
    }

    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    @ResponseBody
    public ReturnInfo doLogin(@RequestBody Json json, HttpServletRequest request, HttpSession session){
        ReturnInfo returnInfo = new ReturnInfo();
        String name = json.getName();
        String pwd = json.getPassword();
        Admin admin = adminService.findByName(name);
        if(CodeUtil2.checkVerifyCode(request, json.getVertity())){
        if(admin != null && admin.getAdmin_password().equals(pwd) && admin.getAdmin_status() == 9){
            returnInfo.setCode(1);
            returnInfo.setMsg("欢迎您，成功登录");
            returnInfo.setName(name);
            returnInfo.setPwd(pwd);
            session.setAttribute("ADMIN",admin);
            return returnInfo;
        }else{
            returnInfo.setMsg("登录名或密码错误，请重试");
            returnInfo.setCode(2);
            return returnInfo;
        }
        }
        returnInfo.setMsg("验证码错误！");
        returnInfo.setCode(2);
        return returnInfo;
    }
    @RequestMapping("/index")
    public String index(){
        return "admin/index";
    }
}
