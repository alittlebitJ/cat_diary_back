package com.cat_diary.cat_diary.waterIntake.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(
  name = "water_intake",
  schema = "public"
)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WaterIntake {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long intakeId;

  @Column(nullable = false)
  private Long catId;

  @Column(nullable = false)
  private LocalDate date;

  @Column(nullable = false, precision = 5, scale = 2)
  private BigDecimal amount;

  @Column(nullable = false, length = 50)
  private String unit;

  @Column(nullable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
  private LocalDateTime createdAt;

  @Column(nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
  private LocalDateTime updatedAt;

  // 엔티티가 저장될 때 createdAt 값을 자동으로 설정
  @PrePersist
  public void prePersist() {
    if (createdAt == null) {
      createdAt = LocalDateTime.now();
    }
    if (updatedAt == null) {
      updatedAt = LocalDateTime.now();
    }
  }

  // 수정 시에도 자동으로 갱신될 수 있도록
  @PreUpdate
  public void preUpdate() {
    if (updatedAt == null) {
      updatedAt = LocalDateTime.now();
    }
  }

}

