package com.smtown.example.kotlindemo.controllers

import com.smtown.example.kotlindemo.business.LessonService
import com.smtown.example.kotlindemo.business.MemberService
import com.smtown.example.kotlindemo.model.JsonResponse
import com.smtown.example.kotlindemo.model.Lesson
import com.smtown.example.kotlindemo.model.Member
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.ResponseBody
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class LessonController {
    @Autowired
    lateinit var memberService: MemberService

    @Autowired
    lateinit var lessonService: LessonService


    @GetMapping("/lesson")
    fun viewLesson() : String {
        return "lesson"
    }

    @GetMapping("/schedule/lesson/list")
    @ResponseBody fun viewLessonList() : List<Lesson> {
        return lessonService.getAllLessonList()
    }

    @GetMapping("/manage/form/lessonMemberList")
    fun lessonForm(request: HttpServletRequest, response: HttpServletResponse, model: Model) : String {
        val memberList: List<Member> = memberService.getAllMemberList()
        model.addAttribute("memberList", memberList)
        return "manage/lesson/lesson_form"
    }

    @PostMapping("/manage/lesson/insert")
    @ResponseBody fun insertLesson(@RequestBody newLesson : Lesson, request: HttpServletRequest, response: HttpServletResponse, model: Model) : JsonResponse {
        val insertLessonCnt : Int = lessonService.insertLesson(newLesson)
        val jsonResponse = JsonResponse()
        jsonResponse.data = insertLessonCnt

        if(insertLessonCnt > 0) {
            val message = "(m_id)${newLesson.m_id}, 레슨시간 : ${newLesson.start} 등록 완료."
            println(message)
            println(" New Lesson 내역 : $newLesson")
            jsonResponse.message = message
            jsonResponse.result = true
        } else {
            println("Insert Lesson Schedule Error!")
            val message = "Insert New Lesson Schedule Fail..."
            jsonResponse.message = message
        }

        return jsonResponse
    }
}
