package com.cat_diary.cat_diary.feed.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MealDto {
  private Long catId;
  private String date;
  private String foodName;
  private Double amount;
  private String category;
  private String productType;
  private Double calories;
  private String feedingTime;
  private String notes;

  public MealDto
    (Long catId, String date, String foodName,
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

}
