package com.cat_diary.cat_diary.feed.service;

import com.cat_diary.cat_diary.feed.dto.FeedDto;
import com.cat_diary.cat_diary.feed.entity.Feed;
import com.cat_diary.cat_diary.waterIntake.dto.WaterIntakeDto;
import com.cat_diary.cat_diary.waterIntake.entity.WaterIntake;
import com.cat_diary.cat_diary.feed.repository.FeedRepository;
import com.cat_diary.cat_diary.waterIntake.repository.WaterIntakeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class FeedService {

  private final FeedRepository repository;

  @Autowired
  public FeedService(FeedRepository repository) {
    this.repository = repository;
  }

  public List<FeedDto> getAllCatFoods() {
    return repository.findAllByOrderByNameAsc();
  }

  // 카테고리별 조회
  public List<FeedDto> getCatFoodsByCategory(String type) {
    List<Feed> feeds = repository.findByType(type);
    return feeds.stream()
      .map(feed -> new FeedDto(feed.getId(), feed.getType(), feed.getName(), feed.getCaloriesPerGram(), feed.getCaloriesPerUnit()))
      .collect(Collectors.toList());
  }

}
