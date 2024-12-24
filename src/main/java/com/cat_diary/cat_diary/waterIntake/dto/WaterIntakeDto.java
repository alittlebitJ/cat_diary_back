package com.cat_diary.cat_diary.waterIntake.dto;

import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WaterIntakeDto {

  private Long catId;
  private LocalDate date;
  private BigDecimal amount;
  private String unit;

  // WaterIntakeDto Response
  @Getter
  @Setter
  @Builder
  @ToString
  public static class Response {

    private Long catId;  // 고양이 ID
    private LocalDate date;  // 날짜
    private BigDecimal amount;  // 섭취량
    private String unit;  // 단위 (ml 등)
    private LocalDateTime createdAt;  // 생성 시간
    private LocalDateTime updatedAt;  // 업데이트 시간

    // WaterIntake 엔티티를 Response DTO로 변환하는 메서드
    public static Response from(WaterIntake waterIntake) {
      return Response.builder()
        .catId(waterIntake.getCatId())
        .date(waterIntake.getDate())
        .amount(waterIntake.getAmount())
        .unit(waterIntake.getUnit())
        .createdAt(waterIntake.getCreatedAt())
        .updatedAt(waterIntake.getUpdatedAt())
        .build();
    }
  }
}

