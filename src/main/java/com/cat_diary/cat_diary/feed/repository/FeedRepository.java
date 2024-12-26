package com.cat_diary.cat_diary.feed.repository;

import com.cat_diary.cat_diary.feed.dto.FeedDto;
import com.cat_diary.cat_diary.feed.entity.Feed;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedRepository extends JpaRepository<Feed, Integer> {
  List<FeedDto> findAllByOrderByNameAsc();

  // type을 기준으로 데이터를 조회하는 메서드
  List<Feed> findByType(String type);

  // 이름으로 상품 검색
  List<Feed> findByNameContainingIgnoreCase(String name);
}
