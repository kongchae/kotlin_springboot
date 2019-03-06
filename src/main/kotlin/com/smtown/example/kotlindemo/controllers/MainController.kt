package com.smtown.example.kotlindemo.controllers

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.GetMapping

@Controller
class MainController {

    @GetMapping("/")
    fun board(model : Model ) : String {
        model["title"] = "Board"

        println("********************")
        println(model.toString())
        println("********************")

        return "main"
    }
}