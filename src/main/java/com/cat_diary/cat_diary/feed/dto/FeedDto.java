package com.cat_diary.cat_diary.feed.dto;

import java.math.BigDecimal;

public class FeedDto {

  private Long id;
  private String type;
  private String foodType;
  private String name;
  private BigDecimal caloriesPerGram;
  private BigDecimal caloriesPerUnit;

  public FeedDto(Long id, String type, String foodType, String name, BigDecimal caloriesPerGram, BigDecimal caloriesPerUnit) {
    this.id = id;
    this.type = type;
    this.foodType = foodType;
    this.name = name;
    this.caloriesPerGram = caloriesPerGram;
    this.caloriesPerUnit = caloriesPerUnit;
  }

  // Getter & Setter
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getFoodType() {
    return foodType;
  }

  public void setFoodType(String foodType) {
    this.foodType = foodType;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public BigDecimal getCaloriesPerGram() {
    return caloriesPerGram;
  }

  public void setCaloriesPerGram(BigDecimal caloriesPerGram) {
    this.caloriesPerGram = caloriesPerGram;
  }

  public BigDecimal getCaloriesPerUnit() {
    return caloriesPerUnit;
  }

  public void setCaloriesPerUnit(BigDecimal caloriesPerUnit) {
    this.caloriesPerUnit = caloriesPerUnit;
  }
}
