package com.smtown.example.kotlindemo.model

import com.fasterxml.jackson.annotation.JsonFormat
import com.fasterxml.jackson.annotation.JsonProperty
import org.apache.ibatis.type.Alias
import org.springframework.format.annotation.DateTimeFormat
import java.util.*

@Alias("Lesson")
data class Lesson (@JsonProperty("id") var l_id : Int = 0,
                   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")var start : Date = Date(),
                   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")var end : Date = Date(),
                   var m_id: Int = 0,
                   @JsonProperty("title") var name : String ="")