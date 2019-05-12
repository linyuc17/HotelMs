package cn.edu.mju.band2.controller;

import cn.edu.mju.band2.po.LoginUser;
import cn.edu.mju.band2.po.User;
import cn.edu.mju.band2.service.UserService;
import cn.edu.mju.band2.utils.CodeUtil;
import cn.edu.mju.band2.utils.Page1;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    ModelAndView mav;
    Page1 page;
    User user;

    @RequestMapping("/login")
    public String userLogin() {
        return "/user/login";
    }

    @RequestMapping("/logout")
    public String userLogout(HttpSession session) {
        session.invalidate();
        return "redirect:login";
    }
    @RequestMapping("personal")
    public String userInfo() {
        return "/user/personal";
    }

    @RequestMapping("/toIndex")
    public String checkLogin(HttpServletRequest request, LoginUser loginUser) {
        // 用户身份验证
        if (request.getSession().getAttribute("USER") != null) {
            return "user/index";
        }
        boolean captcha = CodeUtil.checkVerifyCode(request);
        if (captcha) {
            boolean authentication = userService.LoginCheck(loginUser);
            if (authentication) {
                user = userService.selectUserById(Integer.valueOf(loginUser.getLoginUserId()));
                if (user.getUserStatus() == 0) {
                    request.setAttribute("msg", "对不起，由于您的不当操作，当前用户已被停用，请联系管理员！");
                    return "/user/login";
                }
                request.getSession().setAttribute("USER", user);
                return "user/index";
            }
            request.setAttribute("msg", "用户名或者密码输入错误");
            return "/user/login";
        }
        request.setAttribute("msg", "验证码输入错误！");
        return "/user/login";
    }

    @RequestMapping("/list")
    public ModelAndView userList(HttpServletRequest request) {
        String pageNo = request.getParameter("page");
        String pageSize = request.getParameter("pageSize");
        String starRow = request.getParameter("starRow");
        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String identityNumber = request.getParameter("identityNumber");
        String userPhone = request.getParameter("userPhone");
        String userGender = request.getParameter("userGender");
        user = new User();
        mav = new ModelAndView();
        // 新建页面，设置页号以及页大小;
        page = new Page1();
        if (pageNo == null || pageNo.equals("")) {
            pageNo = "1";
        }
        if (pageSize == null || pageSize.equals("")) {
            pageSize = "10";
        }
        if (userId != null && !"".equals(userId)) {
            user.setUserId(Integer.valueOf(userId));
        }
        if (userName != null && !"".equals(userName)) {
            user.setUserName(userName);
        }
        if (identityNumber != null && !"".equals(identityNumber)) {
            user.setIdentityNumber(identityNumber);
        }
        if (userPhone != null && !"".equals(userPhone)) {
            user.setUserPhone(userPhone);
        }
        if (userGender != null && !"".equals(userGender)) {
            user.setUserGender(Integer.valueOf(userGender));
        }
        // 位置不能换否则逻辑报错
        Integer totalRows = userService.selectUserListCount(user);
        page.setPageSize(Integer.valueOf(pageSize));
        page.setTotalRows(totalRows);
        page.setPage(Integer.valueOf(pageNo));
        // 设置开始的行数与页大小
        if (starRow != null) {
            Integer star = Integer.valueOf(starRow);
            if (star > totalRows || star < 0) {
                star = page.getStartRow();
            }
            System.out.println("开始行数" + star);
            user.setStart(star);
        } else {
            user.setStart(page.getStartRow());
        }
        user.setRows(page.getPageSize());
        List<User> userList = userService.selectUserListByCondition(user);
        page.setTotalRows(userService.selectUserListCount(user));
        mav.addObject("page", page);
        mav.addObject("userList", userList);
        mav.addObject("user", user);
        mav.setViewName("/user/list");
        return mav;
    }

    @RequestMapping("regiest")
    public String userRegiest() {
        return "user/add";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String userAdd(User user, HttpServletRequest request, List<MultipartFile> uploadPhoto) {
        String newFileName = uploadFile(uploadPhoto, request);
        System.out.println(user);
        user.setUserPhoto(newFileName);
        if (userService.addUser(user)) {
            return "1";
        } else {
            return "0";
        }
    }

    @RequestMapping("/edit")
    @ResponseBody
    public String userEdit(User user, HttpServletRequest request, List<MultipartFile> uploadPhoto) {
        String newFileName = uploadFile(uploadPhoto, request);
        System.out.println(user);
        user.setUserPhoto(newFileName);
        if (userService.updateUser(user)) {
            request.getSession().setAttribute("USER", userService.selectUserById(user.getUserId()));
            return "1";
        } else {
            return "0";
        }
    }

    @RequestMapping("/update")
    public String userUpdate() {
        return "/user/edit";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String userDelete(HttpServletRequest request) {
        if (request.getParameterValues("deleteId") != null) {
            String[] deleteIdList = request.getParameterValues("deleteId");
            Integer[] idList = new Integer[deleteIdList.length];
            for (int i = 0; i < deleteIdList.length; i++) {
                Integer id = Integer.valueOf(deleteIdList[i]);
                idList[i] = id;
            }
            userService.deleteUser(idList);
            return "1";
        } else {
            String id = request.getParameter("id");
            Integer[] ids = new Integer[1];
            ids[0] = Integer.valueOf(id);
            userService.deleteUser(ids);
            return "1";
        }
    }

    @RequestMapping("/stop")
    @ResponseBody
    public void userStop(HttpServletRequest request) {
        String id = request.getParameter("id");
        user = new User();
        user.setUserId(Integer.valueOf(id));
        user.setUserStatus(0);
        userService.updateUser(user);
    }

    @RequestMapping("/start")
    @ResponseBody
    public void userStart(HttpServletRequest request) {
        String id = request.getParameter("id");
        System.out.println(id);
        user = new User();
        user.setUserId(Integer.valueOf(id));
        user.setUserStatus(1);
        userService.updateUser(user);
    }

    @RequestMapping("/resetPassword")
    public String resetPassword(LoginUser loginUser, HttpServletRequest request) {
        Integer userId = Integer.valueOf(loginUser.getLoginUserId());
        user = userService.selectUserById(userId);
        if (user == null) {
            request.setAttribute("msg", "用户不存在，请检查输入的用户名");
        } else {
            if (loginUser.getLoginUserPwd().equals(user.getIdentityNumber())) {
                user.setUserPassword("123456");
                if (userService.updateUser(user)) {
                    request.setAttribute("msg", "用户密码重置成功，重置后密码为123456");
                } else {
                    request.setAttribute("msg", "操作异常，请稍后重试！");
                }
            } else {
                request.setAttribute("msg", "您输入的身份证不匹配");
            }
        }
        return "forward:/user/login";
    }

    @RequestMapping("/changePassword")
    @ResponseBody
    public String changePassword(HttpServletRequest request) {
        String id = request.getParameter("userId");
        if (id != null && !"".equals(id)) {
            String pwd0 = request.getParameter("userPassword0");
            String pwd1 = request.getParameter("userPassword1");
            user = userService.selectUserById(Integer.valueOf(id));
            if (user != null) {
                String oldPwd = user.getUserPassword();
                if (oldPwd.equals(pwd0)){
                    user.setUserPassword(pwd1);
                    request.getSession().setAttribute("USER", user);
                    return "1";
                }
            }
        }

        return "0";
    }
    @RequestMapping("changePwdPage")
    public String changePwdPage(HttpServletRequest request){
        return "user/changepwd";
    }
    private String uploadFile(List<MultipartFile> uploadPhoto, HttpServletRequest request) {
        String newFileName = null;
        // 判断文件上传是否存在
        if (!uploadPhoto.isEmpty() && uploadPhoto.size() > 0) {
            //循环输出上传的文件
            for (MultipartFile file : uploadPhoto) {
                //获取上传文件的名称
                String originalFilename = file.getOriginalFilename();
                //设置上传文件的保存地址目录
                String dirPath = request.getServletContext().getRealPath("/upload/user/");
                File filePath = new File(dirPath);
                // 如果保存文件的地址不存在，那就先创建目录
                if (filePath.exists()) {
                    filePath.mkdirs();
                }
                // 使用UUID重新命名上传的文件名称
                newFileName = UUID.randomUUID() + "_" + originalFilename;
                System.out.println(dirPath + newFileName);
                try {
                    // 使用MultipartFile接口的方法完成文件上传到指定位置
                    file.transferTo(new File(dirPath + newFileName));
                } catch (Exception e) {
                    e.printStackTrace();
                    return "0";
                }
                // 成功则继续执行
            }
        }
        return newFileName;
    }
}