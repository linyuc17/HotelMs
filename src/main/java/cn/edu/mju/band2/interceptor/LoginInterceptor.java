package cn.edu.mju.band2.interceptor;

import cn.edu.mju.band2.service.impl.UserServiceImpl;
import cn.edu.mju.band2.service.UserService;
import cn.edu.mju.band2.utils.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request.getSession().getAttribute("USER"));
        if (request.getSession().getAttribute("USER") != null){
            return true;
        }
        request.setAttribute("msg","请先登录！");
        request.getRequestDispatcher("/user/login").forward(request,response);
        return false;
    }
}
