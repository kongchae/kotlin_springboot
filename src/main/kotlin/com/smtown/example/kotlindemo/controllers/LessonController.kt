package com.smtown.example.kotlindemo.controllers

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class LessonController {

    @GetMapping("/lesson")
    fun viewLesson() : String {


        return "lesson"
    }

}
