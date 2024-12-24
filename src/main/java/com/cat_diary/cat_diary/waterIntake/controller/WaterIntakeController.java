package com.cat_diary.cat_diary.waterIntake.controller;

import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.cat_diary.cat_diary.waterIntake.service.WaterIntakeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/waterIntake")
public class WaterIntakeController {

  private final WaterIntakeService service;

  @Autowired
  public WaterIntakeController(WaterIntakeService service) {
    this.service = service;
  }

  @PostMapping("/insert")
  public WaterIntake addWaterIntake(@RequestBody WaterIntakeDto dto) {
    return service.addWaterIntake(dto);
  }
}
