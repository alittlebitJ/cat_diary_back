package com.cat_diary.cat_diary.feed.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "cat_food_and_treats")
public class Feed {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @Column(name = "name")
  private String name;

  @Column(name = "calories_per_gram")
  private BigDecimal caloriePerGram;

  @Column(name = "calories_per_unit")
  private BigDecimal caloriesPerUnit;

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
