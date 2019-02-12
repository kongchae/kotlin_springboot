package com.smtown.example.kotlindemo

import org.springframework.boot.Banner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication
import org.springframework.scheduling.annotation.EnableAsync
import org.springframework.scheduling.annotation.EnableScheduling

@SpringBootApplication
@EnableConfigurationProperties
@EnableAsync
@EnableScheduling
class KotlindemoApplication

fun main(args: Array<String>) {
    runApplication<KotlindemoApplication>(*args) {
        setBannerMode(Banner.Mode.OFF) // 시작시 배너표시없앰.
    }
}
