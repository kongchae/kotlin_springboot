package com.smtown.example.kotlindemo.config

import org.mybatis.spring.annotation.MapperScan
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.view.InternalResourceViewResolver
import org.springframework.web.servlet.view.JstlView
import org.springframework.web.servlet.view.tiles3.TilesConfigurer
import org.springframework.web.servlet.view.tiles3.TilesView
import org.springframework.web.servlet.view.tiles3.TilesViewResolver

@Configuration
@EnableWebMvc
@MapperScan(value = ["com.smtown.example.kotlindemo.repository"])
class WebConfig : WebMvcConfigurer {

    override fun addResourceHandlers(registry: ResourceHandlerRegistry) {
        registry.addResourceHandler("/**").addResourceLocations("classpath:/resources/")
                .addResourceLocations("classpath:/static/")
        registry.addResourceHandler("/resources/images/**").addResourceLocations("/resources/images/")
        registry.addResourceHandler("/resources/js/**").addResourceLocations("/resources/js/")
        registry.addResourceHandler("/resources/css/**").addResourceLocations("/resources/css/")
    }

    @Bean
    fun tilesViewResolver() : TilesViewResolver {
        val tilesViewResolver = TilesViewResolver()
        tilesViewResolver.setViewClass(TilesView::class.java)
        tilesViewResolver.setContentType("text/html;charset=UTF-8")
        tilesViewResolver.order = 1
        return tilesViewResolver
    }

    @Bean
    fun tilesConfigurer() : TilesConfigurer {
        val configurer = TilesConfigurer()
        configurer.setDefinitions(*arrayOf("WEB-INF/tiles/tiles-default.xml"))
        configurer.setCheckRefresh(true)
        return configurer
    }

    @Bean
    fun internalResourceViewResolver(): InternalResourceViewResolver {
        val viewResolver = InternalResourceViewResolver()
        viewResolver.setViewClass(JstlView::class.java)
        viewResolver.setPrefix("/WEB-INF/views/")
        viewResolver.setSuffix(".jsp")
        viewResolver.order = 2
        return viewResolver
    }
}