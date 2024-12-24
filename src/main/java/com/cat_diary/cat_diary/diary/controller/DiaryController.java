package com.cat_diary.cat_diary.diary.controller;

import com.cat_diary.cat_diary.diary.service.DiaryService;
import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/diary")
public class DiaryController {

  private final DiaryService service;

  @Autowired
  public DiaryController(DiaryService service) {
    this.service = service;
  }

  @GetMapping("/waterIntake")
  public List<WaterIntakeDto.Response> getDailyWaterIntake(
    @RequestParam Long catId,
    @RequestParam String date) {

    LocalDate parsedDate = LocalDate.parse(date);
    return service.getDailyWaterIntake(catId, parsedDate);

  }
}

