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
public class FeedController {

  private final FeedService service;

  @Autowired
  public FeedController(FeedService service) {
    this.service = service;
  }

  @GetMapping("/feed/nutrition")
  public List<FeedDto> getCatFoods() {
    return service.getAllCatFoods();
  }

}

