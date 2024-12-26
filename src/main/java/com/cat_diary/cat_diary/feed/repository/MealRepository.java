package com.cat_diary.cat_diary.feed.repository;

import com.cat_diary.cat_diary.feed.entity.Meal;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MealRepository extends JpaRepository<Meal, Integer> {
}
