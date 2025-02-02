package com.cat_diary.cat_diary.diary.controller;

import com.cat_diary.cat_diary.diary.service.DiaryService;
import com.cat_diary.cat_diary.feed.dto.MealDto;
import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/diary")
public class DiaryController {

  private final DiaryService service;

  @Autowired
  public DiaryController(DiaryService service) {
    this.service = service;
  }


  // 하루 급여 내역 조회
  @GetMapping("/meals")
  public List<MealDto> getDailyMeals(
    @RequestParam Long catId,
    @RequestParam String date) {

    LocalDate parsedDate = LocalDate.parse(date);
    return service.getDailyMeals(catId, parsedDate);
  }

  // 최근 7일 급여량 조회
  @GetMapping("/meals/7days")
  public List<Map<LocalDate, List<MealDto>>> getRecent7DaysMeals(
    @RequestParam Long catId,
    @RequestParam String date) {

    LocalDate parsedDate = LocalDate.parse(date);
    return service.getRecent7DaysMeals(catId, parsedDate);
  }

  // 하루 음수량 조회
  @GetMapping("/waterIntake")
  public List<WaterIntakeDto.Response> getDailyWaterIntake(
    @RequestParam Long catId,
    @RequestParam String date) {

    LocalDate parsedDate = LocalDate.parse(date);
    return service.getDailyWaterIntake(catId, parsedDate);
  }

  // 최근 7일 음수량 조회
  @GetMapping("/waterIntake/7days")
  public List<Map<LocalDate, List<WaterIntakeDto.Response>>> getRecent7DaysWaterIntake(
    @RequestParam Long catId,
    @RequestParam String date) {

    LocalDate parsedDate = LocalDate.parse(date);
    return service.getRecent7DaysWaterIntake(catId, parsedDate);
  }




}

