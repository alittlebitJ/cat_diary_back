package com.cat_diary.cat_diary.feed.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "cat_food_and_treats")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Feed {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "name")
  private String name;

  @Column(name = "calories_per_gram")
  private BigDecimal caloriesPerGram;

  @Column(name = "calories_per_unit")
  private BigDecimal caloriesPerUnit;

  @Column(name = "type")
  private String type;  // 주식/간식 타입

  @Column(name = "food_type")
  private String foodType;  // 건식/캔 등

}
