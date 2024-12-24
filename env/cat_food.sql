CREATE TABLE IF NOT EXISTS cat_food_and_treats (
                                                   id SERIAL PRIMARY KEY,  -- 고유 ID
                                                   name VARCHAR(255) NOT NULL,  -- 제품명
    type VARCHAR(50) NOT NULL CHECK (type IN ('주식', '간식')),  -- 주식/간식 구분
    food_type VARCHAR(50) NOT NULL CHECK (food_type IN ('건식', '캔', '츄르', '통살', '트릿', '파우치', '기타')),  -- 주식/간식 유형 구분
    purchase_date DATE NOT NULL,  -- 구매일
    purchase_price DECIMAL(10, 2) NOT NULL,  -- 구매가격
    weight DECIMAL(10, 2) NOT NULL,  -- 그램수
    calories_per_unit DECIMAL(10, 2) NULL,  -- 한 개당 칼로리 (주식/간식 공통)
    calories_per_gram DECIMAL(10, 2) NULL,  -- 그램당 칼로리 (주식/간식 공통)
    supplier VARCHAR(255) NOT NULL,  -- 구매처
    crude_protein DECIMAL(5, 2) NULL,  -- 조단백질
    crude_fat DECIMAL(5, 2) NULL,  -- 조지방
    ash DECIMAL(5, 2) NULL,  -- 조회분
    crude_fiber DECIMAL(5, 2) NULL,  -- 조섬유
    phosphorus DECIMAL(5, 2) NULL,  -- 인
    calcium DECIMAL(5, 2) NULL,  -- 칼슘
    moisture DECIMAL(5, 2) NULL,  -- 수분
    sodium DECIMAL(5, 2) NULL  -- 나트륨 (NULL 가능)
    );

CREATE TABLE IF NOT EXISTS cats (
                                    cat_id SERIAL PRIMARY KEY,  -- 고양이 ID (자동 증가)
                                    name VARCHAR(100) NOT NULL,  -- 고양이 이름
    age INT NOT NULL,            -- 나이 (단위: 년)
    disease TEXT,                -- 질병
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP   -- 수정일
    );

-- 주석 추가
COMMENT ON COLUMN cats.cat_id IS '고양이 ID (자동 증가)';
COMMENT ON COLUMN cats.name IS '고양이 이름';
COMMENT ON COLUMN cats.age IS '나이 (단위: 년)';
COMMENT ON COLUMN cats.disease IS '질병';
COMMENT ON COLUMN cats.created_at IS '등록일';
COMMENT ON COLUMN cats.updated_at IS '수정일';


CREATE TABLE public.water_intake (
                                     intake_id bigserial NOT NULL,
                                     cat_id int4 NULL,
                                     "date" date NOT NULL,
                                     amount numeric(5, 2) NOT NULL,
                                     unit varchar(50) NOT NULL,
                                     created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
                                     updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
                                     CONSTRAINT water_intake_pkey PRIMARY KEY (intake_id),
                                     CONSTRAINT water_intake_unit_check CHECK (unit IN ('mL', '컵', 'L', 'oz', 'g'))  -- 'g'를 추가
);


-- 주석 추가
COMMENT ON COLUMN water_intake.intake_id IS '음수량 기록 ID';
COMMENT ON COLUMN water_intake.cat_id IS '고양이 ID';
COMMENT ON COLUMN water_intake.date IS '기록된 날짜';
COMMENT ON COLUMN water_intake.amount IS '음수량 (숫자값)';
COMMENT ON COLUMN water_intake.unit IS '음수량 단위';
COMMENT ON COLUMN water_intake.created_at IS '기록일';
COMMENT ON COLUMN water_intake.updated_at IS '수정일';


CREATE TABLE IF NOT EXISTS defecation (
                                          defecation_id SERIAL PRIMARY KEY,  -- 배변 기록 ID
                                          cat_id INT,                        -- 고양이 ID (외래키 없이 저장)
                                          date DATE NOT NULL,                 -- 기록된 날짜
                                          type VARCHAR(20) NOT NULL,          -- 배변 유형 (대변, 소변 등)
    defecation_count INT NOT NULL,      -- 배변 횟수
    details TEXT,                       -- 추가적인 배변 상태 설명
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 기록일
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 수정일
    CONSTRAINT unique_defecation_per_day UNIQUE(cat_id, date)  -- 고양이별, 날짜별 배변 기록은 유일해야 함
    );

-- 주석 추가
COMMENT ON COLUMN defecation.defecation_id IS '배변 기록 ID';
COMMENT ON COLUMN defecation.cat_id IS '고양이 ID';
COMMENT ON COLUMN defecation.date IS '기록된 날짜';
COMMENT ON COLUMN defecation.type IS '배변 유형 (대변, 소변 등)';
COMMENT ON COLUMN defecation.defecation_count IS '배변 횟수';
COMMENT ON COLUMN defecation.details IS '추가적인 배변 상태 설명';
COMMENT ON COLUMN defecation.created_at IS '기록일';
COMMENT ON COLUMN defecation.updated_at IS '수정일';

CREATE TABLE IF NOT EXISTS medication (
                                          medication_id SERIAL PRIMARY KEY,   -- 투약 기록 ID
                                          cat_id INT,                         -- 고양이 ID (외래키 없이 저장)
                                          date DATE NOT NULL,                 -- 기록된 날짜
                                          medication_name VARCHAR(100) NOT NULL, -- 약 이름
    dosage VARCHAR(50) NOT NULL,        -- 용량
    notes TEXT,                         -- 비고 (추가적인 설명)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 기록일
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- 수정일
    );

-- 주석 추가
COMMENT ON COLUMN medication.medication_id IS '투약 기록 ID';
COMMENT ON COLUMN medication.cat_id IS '고양이 ID';
COMMENT ON COLUMN medication.date IS '기록된 날짜';
COMMENT ON COLUMN medication.medication_name IS '약 이름';
COMMENT ON COLUMN medication.dosage IS '용량';
COMMENT ON COLUMN medication.notes IS '비고 (추가적인 설명)';
COMMENT ON COLUMN medication.created_at IS '기록일';
COMMENT ON COLUMN medication.updated_at IS '수정일';

CREATE TABLE IF NOT EXISTS meals (
                                     meal_id SERIAL PRIMARY KEY,         -- 식사 기록 ID
                                     cat_id INT,                         -- 고양이 ID (외래키 없이 저장)
                                     date DATE NOT NULL,                 -- 기록된 날짜
                                     food_name VARCHAR(100) NOT NULL,     -- 음식 이름
    amount NUMERIC(5,2) NOT NULL,       -- 섭취량 (예: g)
    category VARCHAR(50) NOT NULL CHECK (category IN ('주식', '간식')),  -- 주식/간식 구분
    product_type VARCHAR(50) NOT NULL CHECK (product_type IN ('건식', '캔', '츄르', '통살', '트릿', '파우치', '기타')), -- 제품 타입 구분
    notes TEXT,                         -- 비고 (추가적인 설명)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 기록일
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 수정일
    CONSTRAINT unique_meal_per_day UNIQUE(cat_id, date, food_name)  -- 고양이별, 날짜별 음식은 유일해야 함
    );

-- 주석 추가
COMMENT ON COLUMN meals.meal_id IS '식사 기록 ID';
COMMENT ON COLUMN meals.cat_id IS '고양이 ID';
COMMENT ON COLUMN meals.date IS '기록된 날짜';
COMMENT ON COLUMN meals.food_name IS '음식 이름';
COMMENT ON COLUMN meals.amount IS '섭취량 (예: g)';
COMMENT ON COLUMN meals.category IS '주식/간식 구분';
COMMENT ON COLUMN meals.product_type IS '제품 타입 구분';
COMMENT ON COLUMN meals.notes IS '비고 (추가적인 설명)';
COMMENT ON COLUMN meals.created_at IS '기록일';
COMMENT ON COLUMN meals.updated_at IS '수정일';




INSERT INTO cats (name, age, disease, created_at, updated_at)
VALUES ('용철', 2, '없음', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- 1. 힐스 어덜트 치킨 (주식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('힐스 어덜트 치킨', '주식', '건식', '2024-10-10', 25830, 300, 0.00, 3.75, '펫프렌즈', 32.0, 16.0, 6.0, 2.5, 1.2, 1.0, 8.0);

-- 2. 캐츠랑 전연령 (주식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('캐츠랑 전연령', '주식', '건식', '2024-10-02', 8200, 200, 0.00, 3.88, '펫프렌즈', 32.0, 18.0, 7.0, 3.0, 1.0, 1.2, 8.0);

-- 3. 퓨리나 파티믹스 오리지널
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('퓨리나 파티믹스 오리지널', '간식', '트릿', '2024-10-11', 3500, 60, 1.4, 0.00, '펫프렌즈', 26.0, 12.0, 7.5, 3.5, 1.0, 1.2, 10.0);

-- 4. 차오츄르 참치맛 (간식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('이나바 차오츄르 참치맛', '간식', '츄르', '2024-10-11', 5000, 150, 6.0, 0.43, '다이소', 11.0, 0.5, 1.0, 0.1, 0.1, 0.1, 88.0);

-- 이나바 차오츄르 닭가슴살&오징어
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
)
VALUES
    ('이나바 차오츄르 닭가슴살&오징어', '간식', '츄르', '2024-12-05', 2000, 14, 7.0, 0.50, '다이소', 7.0, 0.2, 1.5, 0.1, 0.17, 0.003, 91.0);


-- 차오츄르 가리비맛 (간식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('차오츄르 가리비맛', '간식', '츄르', '2024-10-11', 5000, 150, 6.0, 0.43, '다이소', 7.0, 2.0, 2.0, 0.1, 0.1, 0.005, 91.0);

-- 이나바 츄르비 참치&구운 닭가슴살
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '이나바 츄르비 참치&구운 닭가슴살', '간식', '기타', '2024-11-10', 2000, 30, 2.0, 2.0, '다이소', 24.0, 4.2, 2.0, 0.1, 0.3, 0.022, 69.5, 0.0
         );

-- 이나바 금빛육수컵 - 참치 70g
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '이나바 금빛육수컵 - 참치', '주식', '기타', '2024-10-02', 1190, 70, 35, 0.5, '견생냥품', 9.0, 0.1, 2.0, 0.1, 0.08, 0.005, 89.0, 0.0
         );


-- 5. 템테이션 (한 조각당 2칼로리 미만이라고만 나와있음)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture, sodium
) 
VALUES 
('템테이션', '간식', '트릿', '2024-10-13', 6800, 160, 2.00, 0.00, '견생냥품', 30.0, 17.0, 12.0, 4.5, 0.5, 0.6, 12.0, 0.46);

-- K9 Natural Cat Food 닭고기 캔
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, 
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber, 
    phosphorus, calcium, moisture
) VALUES (
    'K9 Natural Cat Food 닭고기 캔', '주식', '캔', '2024-10-29', 5900, 170, 161, (161 / 170), '펫프렌즈', 7.5, 7.5, 3.0, 0.3, 0.5, 0.3, 82
);

-- 6. 지위픽 토끼&양고기 캔 (주식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, 
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber, 
    phosphorus, calcium, moisture
) VALUES (
    '지위픽 토끼&양고기 캔', '주식', '캔', '2024-10-29', 7300, 85, 62.0, 0.73, '펫프렌즈', 11.0, 3.5, 1.5, 0.5, 0.2, 0.25, 85
);

-- 7. 지위픽 양고기 캔 (주식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, 
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber, 
    phosphorus, calcium, moisture
) VALUES (
    '지위픽 양고기 캔', '주식', '캔', '2024-10-29', 5300, 85, 59.45, 0.70, '펫프렌즈', 18.0, 7.0, 1.5, 0.3, 0.2, 0.25, 75
);

-- 1. 마이베프 별자리스틱 간
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             '마이베프 별자리스틱 간', '간식', '츄르', '2024-11-23', 3700, 15, 12.2, 0.81, '펫프렌즈', 7.0, 0.5, 1.2, 2.0, 0.05, 0.01, 90.0
         );

-- 2. 마이베프 별자리스틱 심장
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             '마이베프 별자리스틱 심장', '간식', '츄르', '2024-11-23', 3700, 15, 13.5, 0.90, '펫프렌즈', 7.5, 0.5, 0.7, 0.25, 0.08, 0.03, 90.0
         );

-- 3. 마이베프 별자리스틱 멀티비타민
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             '마이베프 별자리스틱 멀티비타민', '간식', '츄르', '2024-11-23', 3700, 15, 12.8, 0.85, '펫프렌즈', 6.0, 0.07, 0.8, 0.08, 0.08, 0.06, 90.0
         );

-- 4. 마이베프 별자리스틱 신장
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             '마이베프 별자리스틱 신장', '간식', '츄르', '2024-11-23', 3700, 15, 13.2, 0.88, '펫프렌즈', 7.0, 0.2, 0.7, 0.04, 0.1, 0.02, 89.0
         );

-- 5. 마이베프 별자리스틱 눈
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             '마이베프 별자리스틱 눈', '간식', '츄르', '2024-11-23', 3700, 15, 13.5, 0.90, '펫프렌즈', 8.0, 0.1, 0.9, 0.25, 0.08, 0.02, 90.0
         );

-- 6. 마이베프 별자리스틱 관절
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             '마이베프 별자리스틱 관절', '간식', '츄르', '2024-11-23', 3700, 15, 13.5, 0.90, '펫프렌즈', 7.0, 0.6, 0.8, 0.09, 0.08, 0.01, 90.0
         );

-- 7. 마이베프 별자리스틱 두뇌
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             '마이베프 별자리스틱 두뇌', '간식', '츄르', '2024-11-23', 3700, 15, 11.6, 0.77, '펫프렌즈', 9.0, 0.1, 2.0, 0.7, 0.05, 0.005, 90.0
         );

-- 1. K9 캣 내추럴 치킨 & 사슴 피스트 캔
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             'K9 캣 내추럴 치킨 & 사슴 피스트 캔', '주식', '캔', '2024-11-23', '5000', 170, 152, 0.862, 'K9 내추럴', 7.0, 7.0, 2.5, 0.5, 0.1, 0.4, 83.0
         );

-- 2. K9 캣 내추럴 치킨 피스트 캔
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture
) VALUES (
             'K9 캣 내추럴 치킨 피스트 캔', '주식', '캔', '2024-11-23', '5000', 170, 86, 0.50588, 'K9 내추럴', 9.5, 5.5, 4.0, 0.25, 0.7, 0.3, 82.0
         );

-- 조공 릴리프
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '조공 이지 케어 릴리프', '간식', '츄르', '2024-11-10', 12900, 8, 9.0, 1.13, '펫프렌즈', 7.0, 0.1, 1.0, 0.9, 0.07, 0.01, 89.0, 0.04
         );

-- 조공 오메가
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '조공 이지 케어 오메가-3', '간식', '츄르', '2024-11-10', 10900, 8, 10.8, 0.0, '펫프렌즈', 7.0, 0.8, 1.2, 0.5, 0.04, 0.005, 89.0, 0.05
         );


-- 보레알 캣 치킨&연어
INSERT INTO cat_food_and_treats (
     name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
     calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
     phosphorus, calcium, moisture, sodium
) VALUES (
          '보레알 캣 치킨&연어', '주식', '캔', '2024-10-02', 3800, 156, 0, 0.544, '펫프렌즈', 7.20, 6.75, 1.50, 0.25, 0.18, 0.20, 85.00, 0.0
         );


-- 로얄캐닌 마더 앤 베이비 캣 울트라 소프트 무스
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '로얄캐닌 마더 앤 베이비 캣 울트라 소프트 무스', '주식', '캔', '2024-10-02', 2600, 100, 95.7, 0.957, '펫프렌즈', 8.5, 3.5, 2.1, 2.0, 0.2, 0.2, 81.8, 0.0
         );

-- 로얄캐닌 인도어 파우치 그레이비
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '로얄캐닌 인도어 파우치 그레이비', '주식', '파우치', '2024-10-02', 1900, 85, 67, 0.788, '로얄캐닌', 7.7, 1.3, 2.0, 1.9, 0.19, 0.22, 83.6, 0.0
         );

-- 시그니처바이 캣 A/a 식욕촉진&기력회복 스틱
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '시그니처바이 캣 A/a 식욕촉진&기력회복 스틱', '간식', '츄르', '2024-12-02', 6000, 10, 6, 0.6, '펫프렌즈', 12.0, 5.0, 2.4, 0.2, 0.3, 0.05, 80.0, 0.0
         );

-- 알모네이쳐 캣 닭고기&참치 캔
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '알모네이쳐 캣 닭고기&참치 캔', '주식', '캔', '2024-12-02', 2600, 70, 59, 0.843, '펫프렌즈', 16.0, 0.5, 2.8, 0.1, 0.0, 0.0, 79.0, 0.0
         );

-- 로우즈 캣 슈레디드 치킨&오리 캔 85g
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '로우즈 캣 슈레디드 치킨&오리 캔', '주식', '캔', '2024-12-05', 4200, 85, 75, 0.88, '펫프렌즈', 11.0, 1.5, 2.0, 1.5, 0.15, 0.30, 82.0, 0.0
         );

-- 아투 캣 치킨
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '아투 캣 치킨', '주식', '건식', '2024-12-05', 1200, 100, 370, 3.7, '펫프렌즈', 36.0, 19.0, 8.8, 2.0, 1.3, 1.7, 7.0, 0.0
         );

-- 이나바 캣 챠오 화이티캔 참치 흰살
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '이나바 캣 챠오 화이티캔 참치 흰살', '간식', '캔', '2024-12-12', 1890, 85, 55, 0.65, '펫프렌즈', 13.0, 0.5, 1.0, 0.1, 0.15, 0.003, 85.0, 0.0
         );


-- 고집츄르 캣 닭가슴살
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '고집츄르 캣 닭가슴살', '간식', '츄르', '2024-12-16', 1500, 11, 0, 0, '펫프렌즈', 8.0, 0.7, 1.5, 0.05, 0.06, 0.008, 89.0, 0.0
         );

-- 고집츄르 캣 알래스카 연어
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '고집츄르 캣 알래스카 연어', '간식', '츄르', '2024-12-16', 1600, 11, 0, 0, '펫프렌즈', 7.0, 0.4, 1.0, 0.06, 0.08, 0.04, 89.0, 0.0
         );

-- 고집츄르 캣 북태평양 참치
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '고집츄르 캣 북태평양 참치', '간식', '츄르', '2024-12-16', 1700, 11, 0, 0, '펫프렌즈', 10.5, 0.07, 0.7, 0.04, 0.08, 0.01, 89.0, 0.0
         );

-- 쉬바 파우치 - 참치
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '쉬바 파우치 - 참치', '주식', '파우치', '2024-12-16', 1200, 85, 64, 0.75, '펫프렌즈', 7.0, 1.0, 3.0, 0.5, 0.5, 0.6, 88.0, 0.0
         );

-- 쉬바 파우치 - 참치와 게맛살
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '쉬바 파우치 - 참치와 게맛살', '주식', '파우치', '2024-12-16', 1200, 85, 66, 0.77, '펫프렌즈', 7.0, 1.0, 3.0, 0.5, 0.5, 0.6, 88.0, 0.0
         );

-- 쉬바 파우치 - 참치와 연어
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '쉬바 파우치 - 참치와 연어', '주식', '파우치', '2024-12-16', 1200, 85, 67, 0.78, '펫프렌즈', 7.0, 1.0, 3.0, 0.5, 0.5, 0.6, 88.0, 0.0
         );

-- 쉬바 파우치 - 참치와 닭고기
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '쉬바 파우치 - 참치와 닭고기', '주식', '파우치', '2024-12-16', 1200, 85, 62, 0.72, '펫프렌즈', 7.0, 1.0, 3.0, 0.5, 0.5, 0.6, 88.0, 0.0
         );

-- 시그니처바이 캣 A/a 식욕촉진&기력회복 캔
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '시그니처바이 캣 A/a 식욕촉진&기력회복 캔', '주식', '캔', '2024-12-16', 2000, 30, 0, 0, '펫프렌즈', 12.0, 5.0, 2.4, 0.2, 0.3, 0.05, 80.0, 0.0
         );

-- 지위픽 캣 소고기 캔식품
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '지위픽 캣 소고기 캔식품 85g', '주식', '캔', '2024-12-16', 5300, 85, 106.25, 1.25, '펫프렌즈', 9.0, 5.5, 4.0, 2.0, 0.24, 0.3, 78.0, 0.0
         );

-- 지위픽 캣 양고기 캔식품
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '지위픽 캣 양고기 캔식품 85g', '주식', '캔', '2024-12-16', 5300, 85, 112.625, 1.325, '펫프렌즈', 9.5, 6.0, 3.0, 2.0, 0.25, 0.32, 78.0, 0.0
         );

-- 지위픽 캣 토끼&양고기 캔식품
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '지위픽 캣 토끼&양고기 캔식품 85g', '주식', '캔', '2024-12-16', 5300, 85, 93.5, 1.1, '펫프렌즈', 11.0, 3.5, 3.0, 2.0, 0.25, 0.32, 78.0, 0.0
         );

-- 레오나르도 캣 순수생육 연어
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '레오나르도 캣 순수생육 연어', '주식', '건식', '2024-12-23', 42075, 1500, 6075, 4.05, '펫프랜즈', 37.0, 22.0, 7.5, 2.5, 1.1, 1.3, 10.0, 0.0
         );

INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit,
    calories_per_gram, supplier, crude_protein, crude_fat, ash, crude_fiber,
    phosphorus, calcium, moisture, sodium
) VALUES (
             '레오나르도 캣 순수생육 오리', '주식', '건식', '2024-12-24', 42075, 1500, 4120, 4.12, '바잇미', 40.0, 22.0, 7.0, 2.5, 0.9, 1.0, 10.0, 0.0
         );

