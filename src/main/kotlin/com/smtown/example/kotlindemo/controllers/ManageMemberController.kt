package com.smtown.example.kotlindemo.controllers

import com.smtown.example.kotlindemo.business.MemberService
import com.smtown.example.kotlindemo.model.Member
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class ManageMemberController {

    @Autowired
    lateinit var memberService: MemberService

    @GetMapping("/manage/member")
    fun memberList(request: HttpServletRequest, response: HttpServletResponse, model: Model) : String {

        val memberList: List<Member> = memberService.getAllMemberList()
        model.addAttribute("memberList", memberList)
        model.addAttribute("totalCount", memberList.size)

        return "manage/member/list"
    }
}
