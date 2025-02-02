package com.cat_diary.cat_diary.feed.service;

import com.cat_diary.cat_diary.feed.dto.FeedDto;
import com.cat_diary.cat_diary.feed.dto.MealDto;
import com.cat_diary.cat_diary.feed.entity.Feed;
import com.cat_diary.cat_diary.feed.entity.Meal;
import com.cat_diary.cat_diary.feed.repository.MealRepository;
import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.cat_diary.cat_diary.feed.repository.FeedRepository;
import com.cat_diary.cat_diary.waterIntake.repository.WaterIntakeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FeedService {

  private final FeedRepository feedRepository;
  private final MealRepository mealRepository;

  @Autowired
  public FeedService(FeedRepository repository, MealRepository mealRepository) {
    this.feedRepository = repository;
    this.mealRepository = mealRepository;
  }

  public List<FeedDto> getAllCatFoods() {
    return feedRepository.findAllByOrderByNameAsc();
  }

  // 카테고리별 조회
  public List<FeedDto> getCatFoodsByCategory(String type) {
    List<Feed> feeds = feedRepository.findByType(type);
    return feeds.stream()
      .map(feed -> new FeedDto(feed.getId(), feed.getType(), feed.getFoodType(), feed.getName(), feed.getCaloriesPerGram(), feed.getCaloriesPerUnit()))
      .collect(Collectors.toList());
  }

  // 상품명으로 검색
  public List<FeedDto> searchCatFoodsByName(String name) {
    List<Feed> feeds = feedRepository.findByNameContainingIgnoreCase(name);
    return feeds.stream()
      .map(feed -> new FeedDto(feed.getId(), feed.getType(), feed.getFoodType(), feed.getName(), feed.getCaloriesPerGram(), feed.getCaloriesPerUnit()))
      .collect(Collectors.toList());
  }

  // 급여내역 등록
  public void addMealRecords(List<MealDto> mealDtoList) {
    for (MealDto mealDto : mealDtoList) {

      // amount와 calories는 Double에서 BigDecimal로 변환
      BigDecimal amount = mealDto.getAmount() != null ? BigDecimal.valueOf(mealDto.getAmount()) : null;
      BigDecimal calories = mealDto.getCalories() != null ? BigDecimal.valueOf(mealDto.getCalories()) : null;

      // feedingTime은 String에서 LocalTime으로 변환 (필요시 변환 로직 추가)
      LocalTime feedingTime = mealDto.getFeedingTime() != null ? LocalTime.parse(mealDto.getFeedingTime()) : null;

      // Meal entity 생성
      Meal meal = Meal.builder()
        .catId(mealDto.getCatId())
        .date(mealDto.getDate())
        .foodName(mealDto.getFoodName())
        .amount(amount)
        .category(mealDto.getCategory())
        .productType(mealDto.getProductType())
        .calories(calories)
        .feedingTime(feedingTime)
        .notes(mealDto.getNotes())
        .build();

      // 데이터 저장
      mealRepository.save(meal);
    }
  }


}
