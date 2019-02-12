package com.smtown.example.kotlindemo.business

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Lazy
import org.springframework.stereotype.Service
import javax.transaction.Transactional
import com.smtown.example.kotlindemo.model.Member
import com.smtown.example.kotlindemo.repository.MemberMapper

@Service
@Lazy
@Transactional
class MemberService {

    @Autowired
    lateinit var memberMapper: MemberMapper

    fun getAllMemberList() : List<Member> {
        return memberMapper.getAllMemberList()
    }

}