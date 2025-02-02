package com.cat_diary.cat_diary.feed.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "meals")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Meal {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long mealId;

  @Column(name = "cat_id")
  private Long catId;

  @Column(name = "date")
  private LocalDate date;

  @Column(name = "food_name")
  private String foodName;

  @Column(name = "amount")
  private BigDecimal amount;

  @Column(name = "category")
  private String category;

  @Column(name = "product_type")
  private String productType;

  @Column(name = "calories")
  private BigDecimal calories;

  @Column(name = "feeding_time")
  private LocalTime feedingTime;

  @Column(name = "notes")
  private String notes;

}
