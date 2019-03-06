package com.smtown.example.kotlindemo.business

import com.smtown.example.kotlindemo.model.Lesson
import com.smtown.example.kotlindemo.repository.LessonMapper
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Lazy
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
@Lazy
@Transactional
class LessonService {
    @Autowired
    lateinit var lessonMapper : LessonMapper

    fun getAllLessonList() : List<Lesson> {
        return lessonMapper.getAllLessonList()
    }

    fun insertLesson(newLesson : Lesson) : Int {
        return lessonMapper.insertLesson(newLesson)
    }

}