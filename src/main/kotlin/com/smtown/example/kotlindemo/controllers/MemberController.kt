package com.smtown.example.kotlindemo.controllers

import com.smtown.example.kotlindemo.business.MemberService
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
class MemberController {

    @Autowired
    lateinit var memberService: MemberService

    @GetMapping("/manage/member")
    fun memberList(request: HttpServletRequest, response: HttpServletResponse, model: Model) : String {

        val memberList: List<Member> = memberService.getAllMemberList()
        model.addAttribute("memberList", memberList)
        model.addAttribute("totalCount", memberList.size)

        return "member"
    }

    @PostMapping("/manage/member/delete")
    @ResponseBody fun memberDelete(@RequestBody deleteMembers: List<Int>, request: HttpServletRequest, response: HttpServletResponse, model: Model) : Int {
        println("${deleteMembers.size}명 삭제합니다.")
        val deleteCnt : Int = memberService.deleteMembers(deleteMembers)
        if(deleteCnt > 0) {
            println("${deleteMembers.size}명 삭제완료")
        } else {
            println("Delete Members Error!")
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Members delete fail...")
        }
        return deleteCnt
    }
}
