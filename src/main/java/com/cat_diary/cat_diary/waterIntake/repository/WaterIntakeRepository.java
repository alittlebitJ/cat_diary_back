package com.cat_diary.cat_diary.waterIntake.repository;

import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface WaterIntakeRepository extends JpaRepository<WaterIntake, Long> {
  List<WaterIntake> findByDateAndCatId(LocalDate date, Long catId);
}
