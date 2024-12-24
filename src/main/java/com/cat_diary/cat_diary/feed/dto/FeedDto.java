package com.cat_diary.cat_diary.feed.dto;

import java.math.BigDecimal;

public class FeedDto {
  private Integer id;
  private String name;
  private BigDecimal caloriePerGram;
  private BigDecimal caloriesPerUnit; // 새로운 필드 추가

  // 생성자
  public FeedDto(Integer id, String name, BigDecimal caloriePerGram, BigDecimal caloriesPerUnit) {
    this.id = id;
    this.name = name;
    this.caloriePerGram = caloriePerGram;
    this.caloriesPerUnit = caloriesPerUnit;
  }

  // Getter & Setter
  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public BigDecimal getCaloriePerGram() {
    return caloriePerGram;
  }

  public void setCaloriePerGram(BigDecimal caloriePerGram) {
    this.caloriePerGram = caloriePerGram;
  }

  public BigDecimal getCaloriesPerUnit() {
    return caloriesPerUnit;
  }

  public void setCaloriesPerUnit(BigDecimal caloriesPerUnit) {
    this.caloriesPerUnit = caloriesPerUnit;
  }
}
