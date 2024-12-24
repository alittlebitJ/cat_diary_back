package com.cat_diary.cat_diary.waterIntake.service;

import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.cat_diary.cat_diary.waterIntake.repository.WaterIntakeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WaterIntakeService {

  private final WaterIntakeRepository waterIntakeRepository;

  @Autowired
  public WaterIntakeService(WaterIntakeRepository waterIntakeRepository) {
    this.waterIntakeRepository = waterIntakeRepository;
  }

  public WaterIntake addWaterIntake(WaterIntakeDto dto) {
    WaterIntake waterIntake = new WaterIntake();
    waterIntake.setCatId(dto.getCatId());
    waterIntake.setDate(dto.getDate());
    waterIntake.setAmount(dto.getAmount());
    waterIntake.setUnit(dto.getUnit());
    return waterIntakeRepository.save(waterIntake);
  }
}
