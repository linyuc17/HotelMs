package cn.edu.mju.band2.utils;

import javax.servlet.http.HttpServletRequest;

public class CodeUtil2 {
    /**
     * 将获取到的前端参数转为string类型
     *
     * @param request
     * @param key
     * @return
     */
    public static String getString(HttpServletRequest request, String key) {
        try {
            String result = request.getParameter(key);
            if (result != null) {
                // 删除字符串两端空格
                result = result.trim();
            }
            if ("".equals(result)) {
                result = null;
            }
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 验证码校验
     *
     * @param request
     * @return
     */
    public static boolean checkVerifyCode(HttpServletRequest request,String captcha) {
        //获取生成的验证码
        Integer result = (Integer) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        String verifyCodeExpected = String.valueOf(result);
        System.out.println("结果应该为"+verifyCodeExpected);
        return captcha != null && captcha.equals(verifyCodeExpected);
    }
}
/*这里get传的参数名为“verifyCodeActual”，那么等下在页面中验证码的name值也得为这个。*/