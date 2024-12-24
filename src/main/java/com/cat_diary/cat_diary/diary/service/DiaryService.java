package com.cat_diary.cat_diary.diary.service;

import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.cat_diary.cat_diary.waterIntake.repository.WaterIntakeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class DiaryService {

  private final WaterIntakeRepository waterIntakeRepository;

  @Autowired
  public DiaryService(WaterIntakeRepository waterIntakeRepository) {
    this.waterIntakeRepository = waterIntakeRepository;
  }

  // catId와 date를 직접 받아서 처리
  public List<WaterIntakeDto.Response> getDailyWaterIntake(Long catId, LocalDate date) {
    // 요청에서 받은 catId와 date로 WaterIntake 엔티티 조회
    List<WaterIntake> waterIntakes = waterIntakeRepository.findByDateAndCatId(date, catId);

    // 엔티티를 DTO로 변환하여 리턴
    return waterIntakes.stream()
      .map(WaterIntakeDto.Response::from)
      .collect(Collectors.toList());
  }

}
