package com.cat_diary.cat_diary.feed.controller;

import com.cat_diary.cat_diary.feed.dto.FeedDto;
import com.cat_diary.cat_diary.feed.dto.MealDto;
import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.cat_diary.cat_diary.feed.service.FeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/feed")
public class FeedController {

  private final FeedService service;

  @Autowired
  public FeedController(FeedService service) {
    this.service = service;
  }

  // 섭취 제품 조회
  // 전체 조회
  @GetMapping("/nutrition")
  public List<FeedDto> getCatFoods() {
    return service.getAllCatFoods();
  }

  // 카테고리별 조회
  @GetMapping("/nutrition/category")
  public List<FeedDto> getCatFoodsByCategory(@RequestParam("type") String type) {
    return service.getCatFoodsByCategory(type);
  }

  // 상품명으로 검색
  @GetMapping("/nutrition/search")
  public List<FeedDto> searchCatFoodsByName(@RequestParam("query") String query) {
    return service.searchCatFoodsByName(query);
  }

  // 급여기록
  // 급여내역 등록
  @PostMapping("/meals")
  public String addMealRecords(@RequestBody List<MealDto> mealDtoList) {
    service.addMealRecords(mealDtoList);
    return "급여내역이 성공적으로 등록되었습니다.";
  }
  
  

}

