package com.cat_diary.cat_diary.feed.controller;

import com.cat_diary.cat_diary.feed.dto.FeedDto;
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

}

