package com.smtown.example.kotlindemo.repository

import com.smtown.example.kotlindemo.model.Lesson
import org.springframework.stereotype.Repository

@Repository
interface LessonMapper {
    fun getAllLessonList() : List<Lesson>
    fun insertLesson(newLesson : Lesson) : Int
}