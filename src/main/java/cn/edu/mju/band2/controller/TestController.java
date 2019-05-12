package cn.edu.mju.band2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    @RequestMapping("/welcome")
    public String test(Model model){
        model.addAttribute("msg","enenen");
        return "admin/welcome";
    }
    @RequestMapping("/toError")
    public String test2(Model model){
        model.addAttribute("msg","enenen");
        return "admin/error";
    }
}
