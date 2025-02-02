package com.cat_diary.cat_diary.diary.service;

import com.cat_diary.cat_diary.feed.dto.MealDto;
import com.cat_diary.cat_diary.feed.entity.Meal;
import com.cat_diary.cat_diary.feed.repository.MealRepository;
import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.cat_diary.cat_diary.waterIntake.repository.WaterIntakeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DiaryService {

  private final WaterIntakeRepository waterIntakeRepository;
  private final MealRepository mealRepository;

  @Autowired
  public DiaryService(WaterIntakeRepository waterIntakeRepository,
                      MealRepository mealRepository) {
    this.waterIntakeRepository = waterIntakeRepository;
    this.mealRepository = mealRepository;
  }

  // 해당 일자 급여량 조회
  public List<MealDto> getDailyMeals(Long catId, LocalDate date) {
    // 요청에서 받은 catId와 date로 WaterIntake 엔티티 조회
    List<Meal> meals = mealRepository.findByDateAndCatId(date, catId);

    // 엔티티를 DTO로 변환하여 리턴
    return meals.stream()
      .map(MealDto::fromEntity)
      .collect(Collectors.toList());
  }

  // 최근 7일 급여량 조회
  public List<Map<LocalDate, List<MealDto>>> getRecent7DaysMeals(Long catId, LocalDate today) {
    // 오늘 날짜 기준으로 6일 전 날짜 구함
    LocalDate startDate = today.minusDays(6);

    // 6일 전부터 오늘까지의 날짜를 리스트로 저장
    List<LocalDate> recentDays = startDate.datesUntil(today.plusDays(1))
      .collect(Collectors.toList());

    // 각 날짜에 대해 급여량 조회하여 리스트로 묶음
    return recentDays.stream()
      .map(date -> {
        List<MealDto> meals = getDailyMeals(catId, date); // 해당 날짜의 급여량 조회
        // 날짜와 해당 급여량 데이터를 맵 형태로 묶음
        Map<LocalDate, List<MealDto>> dateMealMap = new HashMap<>();
        dateMealMap.put(date, meals);
        return dateMealMap;
      })
      .collect(Collectors.toList());
  }

  // 해당 일자 음수량 조회
  public List<WaterIntakeDto.Response> getDailyWaterIntake(Long catId, LocalDate date) {
    // 요청에서 받은 catId와 date로 WaterIntake 엔티티 조회
    List<WaterIntake> waterIntakes = waterIntakeRepository.findByDateAndCatId(date, catId);

    // 엔티티를 DTO로 변환하여 리턴
    return waterIntakes.stream()
      .map(WaterIntakeDto.Response::from)
      .collect(Collectors.toList());
  }

  // 최근 7일 급여량 조회
  public List<Map<LocalDate, List<WaterIntakeDto.Response>>> getRecent7DaysWaterIntake(Long catId, LocalDate today) {
    // 오늘 날짜 기준으로 6일 전 날짜 구함
    LocalDate startDate = today.minusDays(6);

    // 6일 전부터 오늘까지의 날짜를 리스트로 저장
    List<LocalDate> recentDays = startDate.datesUntil(today.plusDays(1))
      .collect(Collectors.toList());

    // 각 날짜에 대해 급여량 조회하여 리스트로 묶음
    return recentDays.stream()
      .map(date -> {
        List<WaterIntakeDto.Response> waterIntake = getDailyWaterIntake(catId, date); // 해당 날짜의 급여량 조회
        // 날짜와 해당 급여량 데이터를 맵 형태로 묶음
        Map<LocalDate, List<WaterIntakeDto.Response>> dateWaterIntakeMap = new HashMap<>();
        dateWaterIntakeMap.put(date, waterIntake);
        return dateWaterIntakeMap;
      })
      .collect(Collectors.toList());
  }



}
