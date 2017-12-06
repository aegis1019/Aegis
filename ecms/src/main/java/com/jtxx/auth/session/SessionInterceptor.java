package com.jtxx.auth.session;

import com.jtxx.util.JTXXConf;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by aegis on 2017/11/5.
 */
public class SessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //拦截例外
        String requestURI = httpServletRequest.getRequestURI();
        switch (requestURI){
            case "/":
            case "/login-post":
                return true;
        }

        HttpSession session = httpServletRequest.getSession();

        //未登录用户踢回login页面
        if (session.getAttribute(JTXXConf.LOGIN_USER_INFO) != null)
            return true;

        httpServletResponse.setContentType(JTXXConf.CONTENT_TYPE);
        java.io.PrintWriter out = httpServletResponse.getWriter();
        out.println("<html>");
        out.println("<script>");
        out.println("alert('您的session已过期，请重新登陆');");
        out.println("window.open ('/','_top');");
        out.println("</script>");
        out.println("</html>");

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
