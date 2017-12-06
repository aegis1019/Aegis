package com.jtxx.auth.session;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by aegis on 2017/11/5.
 */
@Configuration
public class SessionConfiguration extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new SessionInterceptor()).addPathPatterns("/**");
    }
}
