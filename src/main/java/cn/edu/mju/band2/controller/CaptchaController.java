package cn.edu.mju.band2.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

/**
 * 验证码控制器
 * @author zrb
 */
@Controller
public class CaptchaController {
    @Autowired
    private Producer producer;

    private Map<String, String> map;

    // 生成验证码图片
    @RequestMapping("/kaptcha")
    public void initCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        // 生成验证码
        String capText = producer.createText();
        Integer str1 = Integer.valueOf(capText.substring(0, 2));
        Integer str2 = Integer.valueOf(capText.substring(2, 4));
        Integer result = str1 + str2;
       /* session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);*/
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, result);
        // 向客户端写出
        BufferedImage bi = producer.createImage(str1+"+"+str2+"=?");
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            String kaptchaCode = String.valueOf(session.getAttribute(Constants.KAPTCHA_SESSION_KEY));
            map = new HashMap<String, String>();
            map.put("kaptchaCode", kaptchaCode);
            out.close();
        }
        /*这个controller的路由为“/kaptcha”，那么等下前端验证码的src就为/kaptcha(.jpg) 。*/
    }

}
