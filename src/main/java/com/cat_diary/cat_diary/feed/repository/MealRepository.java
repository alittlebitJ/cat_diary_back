package com.cat_diary.cat_diary.feed.repository;

import com.cat_diary.cat_diary.feed.entity.Feed;
import com.cat_diary.cat_diary.feed.entity.Meal;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface MealRepository extends JpaRepository<Meal, Long> {

  // catId, date로 해당일자 급여 내역 검색
  List<Meal> findByDateAndCatId(LocalDate date, Long catId);
}
