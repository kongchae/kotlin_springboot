package com.smtown.example.kotlindemo.model

import org.apache.ibatis.type.Alias

@Alias("Member")
data class Member (var m_id: Int, var id: String, var name: String, var email: String, var status: Int) {
    constructor() : this(0, "", "", "", 0)
}