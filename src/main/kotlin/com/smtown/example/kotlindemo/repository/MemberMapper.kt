package com.smtown.example.kotlindemo.repository

import com.smtown.example.kotlindemo.model.Member
import org.springframework.stereotype.Repository

@Repository
interface MemberMapper {
    fun getAllMemberList() : List<Member>
    fun deleteMembers(deleteMembers : List<Int>) : Int
}