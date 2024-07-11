DROP DATABASE IF EXISTS `be6_supernova_dev`;
CREATE DATABASE `be6_supernova_dev`;
USE `be6_supernova_dev`;

-- member 테이블 생성
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `member_status_id` bigint NOT NULL,
    `login_id` varchar(20) NOT NULL UNIQUE,
    `login_password` varchar(255) NOT NULL,
    `name` varchar(50) NOT NULL,
    `number` varchar(20) NOT NULL,
    `email` varchar(100) NOT NULL UNIQUE,
    `birth` datetime NOT NULL,
    `latest_login_at` datetime NOT NULL,
    `authentication` int NOT NULL,
    `role` varchar(20) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    `oauth_id` varchar(36) default null,
    PRIMARY KEY (`id`)
);

-- orders 테이블 생성
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `delivery_fee_id` bigint NOT NULL,
    `wrapping_paper_id` bigint NOT NULL,
    `orders_status_id` bigint NOT NULL,
    `member_id` bigint NOT NULL,
    `orders_date` datetime NOT NULL DEFAULT now(),
    `total_amount` bigint NOT NULL,
    `delivery_date` datetime NOT NULL,
    `book_purchase_amount` bigint NOT NULL,
    `delivery_address` varchar(300) NOT NULL,
    `receiver_name` varchar(30) NOT NULL,
    `receiver_number` varchar(20) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- street_address 테이블 생성
DROP TABLE IF EXISTS `street_address`;
CREATE TABLE `street_address` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `zipcode` varchar(6) NOT NULL,
    `street_address` varchar(255) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- member_address 테이블 생성
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `street_address_id` bigint NOT NULL,
    `member_id` bigint NOT NULL,
    `nickname` varchar(20) NOT NULL,
    `member_address_detail` varchar(50) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- member_grade_policy 테이블 생성
DROP TABLE IF EXISTS `member_grade_policy`;
CREATE TABLE `member_grade_policy` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `min_range` bigint NOT NULL,
    `max_range` bigint NOT NULL,
    `save_rate` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- member_status 테이블 생성
DROP TABLE IF EXISTS `member_status`;
CREATE TABLE `member_status` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- tag 테이블 생성
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL UNIQUE,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- book_tag 테이블 생성
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `book_id` bigint NOT NULL,
    `tag_id` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- likes 테이블 생성
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `book_id` bigint NOT NULL,
    `member_id` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- wrapping_paper 테이블 생성
DROP TABLE IF EXISTS `wrapping_paper`;
CREATE TABLE `wrapping_paper` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `price` bigint NOT NULL,
    `status` varchar(10) NOT NULL DEFAULT 'ACTIVE',
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- delivery_fee 테이블 생성
DROP TABLE IF EXISTS `delivery_fee`;
CREATE TABLE `delivery_fee` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `fee` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- orders_status 테이블 생성
DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- point_policy 테이블 생성
DROP TABLE IF EXISTS `point_policy`;
CREATE TABLE `point_policy` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `review_point_rate` bigint NOT NULL,
    `basic_point` bigint NOT NULL,
    `register_point` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- point_history 테이블 생성
DROP TABLE IF EXISTS `point_history`;
CREATE TABLE `point_history` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `point_policy_id` bigint NOT NULL,
    `member_id` bigint NULL,
    `point_content` varchar(255) NOT NULL,
    `point_amount` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- cart 테이블 생성
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
    `id` bigint NOT NULL AUTO_INCREMENT,
	`member_id` bigint,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- category 테이블 생성
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `top_category_id` bigint NULL,
    `name` varchar(50) NOT NULL UNIQUE,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- book_category 테이블 생성
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `category_id` bigint NOT NULL,
    `book_id` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- orders_book 테이블 생성
DROP TABLE IF EXISTS `orders_book`;
CREATE TABLE `orders_book` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `orders_id` bigint NOT NULL,
    `book_id` bigint NOT NULL,
    `quantity` int NOT NULL,
    `price` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- cart_book 테이블 생성
DROP TABLE IF EXISTS `cart_book`;
CREATE TABLE `cart_book` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `cart_id` bigint NOT NULL,
    `book_id` bigint NOT NULL,
    `is_exposed` boolean NOT NULL,
    `quantity` int NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- review 테이블 생성
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `orders_book_id` bigint NOT NULL,
    `content` varchar(255) NOT NULL,
    `score` int NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- book_status 테이블 생성
DROP TABLE IF EXISTS `book_status`;
CREATE TABLE `book_status` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- book 테이블 생성
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `book_status_id` bigint NOT NULL,
    `ISBN` varchar(20) NOT NULL,
    `title` varchar(255) NOT NULL,
    `description` varchar(1000) NOT NULL,
    `description_detail` varchar(2000) NOT NULL,
    `author` varchar(255) NOT NULL,
    `publisher` varchar(255) NOT NULL,
    `publication_date` datetime NOT NULL,
    `inventory` int NOT NULL DEFAULT 0,
    `price` bigint NOT NULL DEFAULT 999999999999,
    `discount_price` bigint NOT NULL,
    `is_packaged` boolean NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- return_policy 테이블 생성
DROP TABLE IF EXISTS `return_policy`;
CREATE TABLE `return_policy` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `content` varchar(255) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- payment 테이블 생성
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `orders_id` bigint NULL,
    `provider` varchar(50) NOT NULL,
    `payment_key` varchar(50) NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);


-- admin 테이블 생성
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `login_id` varchar(20) NOT NULL UNIQUE,
    `login_password` varchar(50) NOT NULL,
    `name` varchar(10) NOT NULL,
    `number` varchar(20) NOT NULL,
    `email` varchar(50) NOT NULL UNIQUE,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- member_grade_history 테이블 생성
DROP TABLE IF EXISTS `member_grade_history`;
CREATE TABLE `member_grade_history` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `member_id` bigint NOT NULL,
    `member_grade_policy_id` bigint NOT NULL,
    `quarter` datetime NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- image 테이블 생성
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `source` varchar(255) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- review_image 테이블 생성
DROP TABLE IF EXISTS `review_image`;
CREATE TABLE `review_image` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `review_id` bigint NOT NULL,
    `image_id` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- book_image 테이블 생성
DROP TABLE IF EXISTS `book_image`;
CREATE TABLE `book_image` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `book_id` bigint NOT NULL,
    `image_id` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`id`)
);

-- member_coupon 테이블 생성
DROP TABLE IF EXISTS `member_coupon`;
CREATE TABLE `member_coupon` (
    `coupon_id` bigint NOT NULL,
    `member_id` bigint NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `updated_at` datetime,
    PRIMARY KEY (`coupon_id`)
);


-- member 테이블의 외래 키 추가
ALTER TABLE `member`
    ADD CONSTRAINT `fk_member_member_status_id` FOREIGN KEY (`member_status_id`) REFERENCES `member_status`(`id`);

-- orders 테이블의 외래 키 추가
ALTER TABLE `orders`
    ADD CONSTRAINT `fk_orders_delivery_fee_id` FOREIGN KEY (`delivery_fee_id`) REFERENCES `delivery_fee`(`id`),
    ADD CONSTRAINT `fk_orders_wrapping_paper_id` FOREIGN KEY (`wrapping_paper_id`) REFERENCES `wrapping_paper`(`id`),
    ADD CONSTRAINT `fk_orders_orders_status_id` FOREIGN KEY (`orders_status_id`) REFERENCES `orders_status`(`id`),
    ADD CONSTRAINT `fk_orders_member_id` FOREIGN KEY (`member_id`) REFERENCES `member`(`id`);

-- street_address 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- member_address 테이블의 외래 키 추가
ALTER TABLE `member_address`
    ADD CONSTRAINT `fk_member_address_street_address_id` FOREIGN KEY (`street_address_id`) REFERENCES `street_address`(`id`),
    ADD CONSTRAINT `fk_member_address_member_id` FOREIGN KEY (`member_id`) REFERENCES `member`(`id`);

-- member_grade_policy 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- member_status 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- tag 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- book_tag 테이블의 외래 키 추가
ALTER TABLE `book_tag`
    ADD CONSTRAINT `fk_book_tag_book_id` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`),
    ADD CONSTRAINT `fk_book_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag`(`id`);

-- likes 테이블의 외래 키 추가
ALTER TABLE `likes`
    ADD CONSTRAINT `fk_likes_book_id` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`),
    ADD CONSTRAINT `fk_likes_member_id` FOREIGN KEY (`member_id`) REFERENCES `member`(`id`);
    
-- cart 테이블의 외래 키 추가
ALTER TABLE `cart`
    ADD CONSTRAINT `fk_cart_member_id` FOREIGN KEY (`member_id`) REFERENCES `member`(`id`);

-- point_history 테이블의 외래 키 추가
ALTER TABLE `point_history`
    ADD CONSTRAINT `fk_point_history_point_policy_id` FOREIGN KEY (`point_policy_id`) REFERENCES `point_policy`(`id`),
    ADD CONSTRAINT `fk_point_history_member_id` FOREIGN KEY (`member_id`) REFERENCES `member`(`id`);

-- cart 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- category 테이블의 외래 키 추가
ALTER TABLE `category`
    ADD CONSTRAINT `fk_category_top_category_id` FOREIGN KEY (`top_category_id`) REFERENCES `category`(`id`);

-- book_category 테이블의 외래 키 추가
ALTER TABLE `book_category`
    ADD CONSTRAINT `fk_book_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `category`(`id`),
    ADD CONSTRAINT `fk_book_category_book_id` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`);

-- orders_book 테이블의 외래 키 추가
ALTER TABLE `orders_book`
    ADD CONSTRAINT `fk_orders_book_orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders`(`id`),
    ADD CONSTRAINT `fk_orders_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`);

-- cart_book 테이블의 외래 키 추가
ALTER TABLE `cart_book`
    ADD CONSTRAINT `fk_cart_book_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`id`),
    ADD CONSTRAINT `fk_cart_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`);

-- review 테이블의 외래 키 추가
ALTER TABLE `review`
    ADD CONSTRAINT `fk_review_orders_book_id` FOREIGN KEY (`orders_book_id`) REFERENCES `orders_book`(`id`);

-- book_status 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- book 테이블의 외래 키 추가
ALTER TABLE `book`
    ADD CONSTRAINT `fk_book_book_status_id` FOREIGN KEY (`book_status_id`) REFERENCES `book_status`(`id`);

-- return_policy 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- payment 테이블의 외래 키 추가
ALTER TABLE `payment`
    ADD CONSTRAINT `fk_payment_orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders`(`id`);

-- 별도의 외래 키가 없는 경우는 생략

-- admin 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- member_grade_history 테이블의 외래 키 추가
ALTER TABLE `member_grade_history`
    ADD CONSTRAINT `fk_member_grade_history_member_id` FOREIGN KEY (`member_id`) REFERENCES `member`(`id`),
    ADD CONSTRAINT `fk_member_grade_history_member_grade_policy_id` FOREIGN KEY (`member_grade_policy_id`) REFERENCES `member_grade_policy`(`id`);

-- image 테이블의 외래 키 추가
-- 별도의 외래 키가 없는 경우는 생략

-- review_image 테이블의 외래 키 추가
ALTER TABLE `review_image`
    ADD CONSTRAINT `fk_review_image_review_id` FOREIGN KEY (`review_id`) REFERENCES `review`(`id`),
    ADD CONSTRAINT `fk_review_image_image_id` FOREIGN KEY (`image_id`) REFERENCES `image`(`id`);

-- book_image 테이블의 외래 키 추가
ALTER TABLE `book_image`
    ADD CONSTRAINT `fk_book_image_book_id` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`),
    ADD CONSTRAINT `fk_book_image_image_id` FOREIGN KEY (`image_id`) REFERENCES `image`(`id`);

-- member_coupon 테이블의 외래 키 추가
ALTER TABLE `member_coupon`
    ADD CONSTRAINT `fk_member_coupon_member_id` FOREIGN KEY (`member_id`) REFERENCES `member`(`id`);
