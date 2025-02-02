package com.cat_diary.cat_diary.feed.dto;

import com.cat_diary.cat_diary.feed.entity.Meal;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeParseException;

@Getter
@Setter
public class MealDto {
  private Long catId;
  private LocalDate date;
  private String foodName;
  private Double amount;
  private String category;
  private String productType;
  private Double calories;
  private String feedingTime;
  private String notes;

  public MealDto
    (Long catId, LocalDate date, String foodName,
     Double amount, String category, String productType,
     Double calories, String feedingTime, String notes) {
    this.catId = catId;
    this.date = date;
    this.foodName = foodName;
    this.amount = amount;
    this.category = category;
    this.productType = productType;
    this.calories = calories;
    this.feedingTime = feedingTime;
    this.notes = notes;
  }

  // Entity를 DTO로 변환하는 정적 메서드
  public static MealDto fromEntity(Meal entity) {
    return new MealDto(
      entity.getCatId(),
      entity.getDate(),
      entity.getFoodName(),
      entity.getAmount() != null ? entity.getAmount().doubleValue() : null,
      entity.getCategory(),
      entity.getProductType(),
      entity.getCalories() != null ? entity.getCalories().doubleValue() : null,
      entity.getFeedingTime() != null ? entity.getFeedingTime().toString() : null,
      entity.getNotes()
    );
  }

  // date를 변환하는 유틸리티 메서드
  private String parseDate(String rawDate) {
    try {
      // LocalDate로 변환 (ISO 8601 형식의 날짜 문자열)
      LocalDate parsedDate = LocalDate.parse(rawDate); // LocalDate.parse로 날짜 파싱
      return parsedDate.toString(); // String으로 변환 후 반환
    } catch (DateTimeParseException e) {
      throw new IllegalArgumentException("Invalid date format: " + rawDate);
    }
  }

}
