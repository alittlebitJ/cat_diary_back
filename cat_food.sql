CREATE TABLE IF NOT EXISTS cat_food_and_treats (
    id SERIAL PRIMARY KEY,  -- 고유 ID
    name VARCHAR(255) NOT NULL,  -- 제품명
    type VARCHAR(50) NOT NULL CHECK (type IN ('주식', '간식')),  -- 주식/간식 구분
    food_type VARCHAR(50) NOT NULL CHECK (food_type IN ('건식', '캔', '스틱', '통살', '트릿', '기타')),  -- 주식/간식 유형 구분
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
    moisture DECIMAL(5, 2) NULL  -- 수분
);


-- 1. 힐스 어덜트 치킨 (주식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('힐스 어덜트 치킨', '주식', '건식', '2024-10-10', 25830, 300, 1125.0, 3.75, '펫프렌즈', 32.0, 16.0, 6.0, 2.5, 1.2, 1.0, 8.0);

-- 2. 캐츠랑 전연령 (주식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('캐츠랑 전연령', '주식', '건식', '2024-10-02', 8200, 200, 776.0, 3.88, '펫프렌즈', 32.0, 18.0, 7.0, 3.0, 1.0, 1.2, 8.0);

-- 3. 퓨리나 파티믹스 오리지널 (주식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('퓨리나 파티믹스 오리지널', '주식', '건식', '2024-10-11', 3500, 400, 1600.0, 4.00, '펫프렌즈', 26.0, 12.0, 7.5, 3.5, 1.0, 1.2, 10.0);

-- 4. 차오츄르 참치맛 (간식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('차오츄르 참치맛', '간식', '트릿', '2024-10-11', 5000, 150, 52.5, 0.35, '다이소', 11.0, 0.5, 1.0, 0.1, 0.1, 0.1, 88.0);

-- 차오츄르 가리비맛 (간식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('차오츄르 가리비맛', '간식', '트릿', '2024-10-11', 5000, 150, 7.0, 0.05, '다이소', 7.0, 2.0, 2.0, 0.1, 0.1, 0.005, 91.0);

-- 5. 템테이션 (간식)
INSERT INTO cat_food_and_treats (
    name, type, food_type, purchase_date, purchase_price, weight, calories_per_unit, calories_per_gram, supplier,
    crude_protein, crude_fat, ash, crude_fiber, phosphorus, calcium, moisture
) 
VALUES 
('템테이션', '간식', '트릿', '2024-10-13', 6800, 200, 800.0, 4.00, '견생냥품', 25.0, 10.0, 6.0, 2.0, 1.0, 1.5, 9.0);

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
