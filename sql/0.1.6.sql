create database be6_supernova_dev;
USE be6_supernova_dev;
CREATE TABLE `member` (
                          `id` BIGINT NOT NULL AUTO_INCREMENT,
                          `users_id` BIGINT NOT NULL,
                          `member_grade_id` BIGINT NOT NULL,
                          `member_status_id` BIGINT NOT NULL,
                          `login_id` VARCHAR(20) NOT NULL UNIQUE,
                          `login_password` VARCHAR(50) NOT NULL,
                          `name` VARCHAR(50) NOT NULL,
                          `number` VARCHAR(20) NOT NULL,
                          `email` VARCHAR(100) NOT NULL,
                          `birth` DATETIME NOT NULL,
                          `point` BIGINT NOT NULL,
                          `total_amount` BIGINT NOT NULL,
                          `latest_login_at` DATETIME NOT NULL,
                          `authentication` INT NOT NULL,
                          `created_at` DATETIME NOT NULL DEFAULT now(),
                          `updated_at` DATETIME NULL,
                          PRIMARY KEY (`id`)
);

CREATE TABLE `admin` (
                          `id` BIGINT NOT NULL AUTO_INCREMENT,
                          `login_id` VARCHAR(20) NOT NULL UNIQUE,
                          `login_password` VARCHAR(50) NOT NULL,
                          `name` VARCHAR(50) NOT NULL,
                          `number` VARCHAR(20) NOT NULL,
                          `email` VARCHAR(100) NOT NULL,
                          `created_at` DATETIME NOT NULL DEFAULT now(),
                          `updated_at` DATETIME NULL,
                          PRIMARY KEY (`id`)
);

CREATE TABLE `orders` (
                          `id` BIGINT NOT NULL AUTO_INCREMENT,
                          `users_id` BIGINT NOT NULL,
                          `delivery_fee_id` BIGINT NOT NULL,
                          `wrapping_paper_id` BIGINT NOT NULL,
                          `orders_status_id` BIGINT NOT NULL,
                          `return_policy_id` BIGINT NOT NULL,
                          `orders_date` DATETIME NOT NULL DEFAULT now(),
                          `total_amount` BIGINT NOT NULL,
                          `delivery_date` DATETIME NOT NULL,
                          `book_purchase_amount` BIGINT NOT NULL,
                          `delivery_address` VARCHAR(300) NOT NULL,
                          `reciever_name` VARCHAR(30) NOT NULL,
                          `reciever_number` VARCHAR(20) NOT NULL,
                          `created_at` DATETIME NOT NULL DEFAULT now(),
                          `updated_at` DATETIME NULL,
                          PRIMARY KEY (`id`)
);

CREATE TABLE `street_address` (
                                  `id` BIGINT NOT NULL AUTO_INCREMENT,
                                  `zipcode` VARCHAR(6) NOT NULL,
                                  `street_address` VARCHAR(255) NOT NULL,
                                  `created_at` DATETIME NOT NULL DEFAULT now(),
                                  `updated_at` DATETIME NULL,
                                  PRIMARY KEY (`id`)
);

CREATE TABLE `member_address` (
                                  `id` BIGINT NOT NULL AUTO_INCREMENT,
                                  `street_address_id` BIGINT NOT NULL,
                                  `member_id` BIGINT NOT NULL,
                                  `nickname` VARCHAR(20) NULL,
                                  `member_address_detail` VARCHAR(50) NOT NULL,
                                  `created_at` DATETIME NOT NULL DEFAULT now(),
                                  `updated_at` DATETIME NULL,
                                  PRIMARY KEY (`id`)
);

CREATE TABLE `member_grade` (
                                `id` BIGINT NOT NULL AUTO_INCREMENT,
                                `name` VARCHAR(50) NOT NULL,
                                `min_range` BIGINT NOT NULL,
                                `max_range` BIGINT NOT NULL,
                                `discount_rate` BIGINT NOT NULL,
                                `created_at` DATETIME NOT NULL DEFAULT now(),
                                `updated_at` DATETIME NULL,
                                PRIMARY KEY (`id`)
);

CREATE TABLE `member_status` (
                                 `id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `name` VARCHAR(50) NOT NULL,
                                 `created_at` DATETIME NOT NULL DEFAULT now(),
                                 `updated_at` DATETIME NULL,
                                 PRIMARY KEY (`id`)
);

CREATE TABLE `author` (
                          `id` BIGINT NOT NULL AUTO_INCREMENT,
                          `name` VARCHAR(50) NOT NULL,
                          `created_at` DATETIME NOT NULL DEFAULT now(),
                          `updated_at` DATETIME NULL,
                          PRIMARY KEY (`id`)
);

CREATE TABLE `tag` (
                       `id` BIGINT NOT NULL AUTO_INCREMENT,
                       `name` VARCHAR(50) NOT NULL,
                       `created_at` DATETIME NOT NULL DEFAULT now(),
                       `updated_at` DATETIME NULL,
                       PRIMARY KEY (`id`)
);

CREATE TABLE `book_tag` (
                            `id` BIGINT NOT NULL AUTO_INCREMENT,
                            `book_id` BIGINT NOT NULL,
                            `tag_id` BIGINT NOT NULL,
                            `created_at` DATETIME NOT NULL DEFAULT now(),
                            `updated_at` DATETIME NULL,
                            PRIMARY KEY (`id`)
);

CREATE TABLE `likes` (
                         `id` BIGINT NOT NULL AUTO_INCREMENT,
                         `book_id` BIGINT NOT NULL,
                         `member_id` BIGINT NOT NULL,
                         `created_at` DATETIME NOT NULL DEFAULT now(),
                         `updated_at` DATETIME NULL,
                         PRIMARY KEY (`id`)
);

CREATE TABLE `wrapping_paper` (
                                  `id` BIGINT NOT NULL AUTO_INCREMENT,
                                  `name` VARCHAR(50) NOT NULL,
                                  `price` BIGINT NOT NULL,
                                  `status` VARCHAR(10) NOT NULL DEFAULT 'ACTIVE',
                                  `created_at` DATETIME NOT NULL DEFAULT now(),
                                  `updated_at` DATETIME NULL,
                                  PRIMARY KEY (`id`)
);

CREATE TABLE `book_discount_rate` (
                                      `id` BIGINT NOT NULL AUTO_INCREMENT,
                                      `book_id` BIGINT NOT NULL,
                                      `rate` BIGINT NOT NULL,
                                      `created_at` DATETIME NOT NULL DEFAULT now(),
                                      `updated_at` DATETIME NULL,
                                      PRIMARY KEY (`id`)
);

CREATE TABLE `delivery_fee` (
                                `id` BIGINT NOT NULL AUTO_INCREMENT,
                                `fee` BIGINT NOT NULL,
                                `created_at` DATETIME NOT NULL DEFAULT now(),
                                `updated_at` DATETIME NULL,
                                PRIMARY KEY (`id`)
);

CREATE TABLE `orders_status` (
                                 `id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `name` VARCHAR(50) NOT NULL,
                                 `created_at` DATETIME NOT NULL DEFAULT now(),
                                 `updated_at` DATETIME NULL,
                                 PRIMARY KEY (`id`)
);

CREATE TABLE `point_policy` (
                                `id` BIGINT NOT NULL AUTO_INCREMENT,
                                `review_point_rate` BIGINT NOT NULL,
                                `basic_point` BIGINT NOT NULL,
                                `register_point` BIGINT NOT NULL,
                                `created_at` DATETIME NOT NULL DEFAULT now(),
                                `updated_at` DATETIME NULL,
                                PRIMARY KEY (`id`)
);

CREATE TABLE `point_history` (
                                 `id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `member_id` BIGINT NOT NULL,
                                 `orders_id` BIGINT NULL,
                                 `point_policy_id` BIGINT NOT NULL,
                                 `point_content` VARCHAR(255) NOT NULL,
                                 `point_amount` BIGINT NOT NULL,
                                 `created_at` DATETIME NOT NULL DEFAULT now(),
                                 `updated_at` DATETIME NULL,
                                 PRIMARY KEY (`id`)
);

CREATE TABLE `coupon` (
                          `code`	VARCHAR(16)	NOT NULL,
                          `name`	VARCHAR(255)	NOT NULL    COMMENT '이름에 내용을 담음',
                          `discount_amount`	BIGINT	NOT NULL,
                          `discount_type`	VARCHAR(10)	NOT NULL,
                          `max_discount_amount`	BIGINT	NOT NULL,
                          `min_purchase_amount`	BIGINT	NOT NULL,
                          `started_at`	DATETIME	NOT NULL,
                          `expiration_at`	DATETIME	NOT NULL,
                          `created_at`	DATETIME	NOT NULL	DEFAULT now()	COMMENT '쿠폰이 만들어진 날짜',
                          `updated_at`	DATETIME	NULL,
                          PRIMARY KEY (`code`)
);


CREATE TABLE `member_coupon` (
                                 `id`	BIGINT	NOT NULL AUTO_INCREMENT,
                                 `member_id`	BIGINT	NOT NULL,
                                 `coupon_code`	VARCHAR(16)	NOT NULL,
                                 `status`	VARCHAR(8)	NOT NULL	DEFAULT false,
                                 `created_at`	DATETIME	NOT NULL	DEFAULT now()	COMMENT '쿠폰 등록된 날짜',
                                 `updated_at`	DATETIME	NULL,
                                 PRIMARY KEY (`id`)
);


CREATE TABLE `cart` (
                        `id` BIGINT NOT NULL AUTO_INCREMENT,
                        `users_id` BIGINT NOT NULL,
                        `is_exposed` BOOLEAN NOT NULL,
                        `created_at` DATETIME NOT NULL DEFAULT now(),
                        `updated_at` DATETIME NULL,
                        PRIMARY KEY (`id`)
);

CREATE TABLE `category` (
                            `id` BIGINT NOT NULL AUTO_INCREMENT,
                            `top_category_id` BIGINT NULL,
                            `name` VARCHAR(50) NOT NULL,
                            `created_at` DATETIME NOT NULL DEFAULT now(),
                            `updated_at` DATETIME NULL,
                            PRIMARY KEY (`id`)
);


CREATE TABLE `category_coupon` (
                                   `coupon_code`	VARCHAR(16)	NOT NULL,
                                   `category_id`	BIGINT	NOT NULL,
                                   `created_at`	DATETIME	NOT NULL,
                                   `updated_at`	DATETIME	NULL,
                                   PRIMARY KEY (`coupon_code`)
);


CREATE TABLE `users` (
                         `id` BIGINT NOT NULL AUTO_INCREMENT,
                         `type` BOOLEAN NOT NULL,
                         `created_at` DATETIME NOT NULL DEFAULT now(),
                         `updated_at` DATETIME NULL,
                         PRIMARY KEY (`id`)
);

CREATE TABLE `book_category` (
                                 `id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `category_id` BIGINT NOT NULL,
                                 `book_id` BIGINT NOT NULL,
                                 `created_at` DATETIME NOT NULL DEFAULT now(),
                                 `updated_at` DATETIME NULL,
                                 PRIMARY KEY (`id`)
);

CREATE TABLE `orders_book` (
                               `id` BIGINT NOT NULL AUTO_INCREMENT,
                               `orders_id` BIGINT NOT NULL,
                               `book_id` BIGINT NOT NULL,
                               `quantity` INT NOT NULL,
                               `price` BIGINT NOT NULL,
                               `created_at` DATETIME NOT NULL DEFAULT now(),
                               `updated_at` DATETIME NULL,
                               PRIMARY KEY (`id`)
);

CREATE TABLE `cart_book` (
                             `id` BIGINT NOT NULL AUTO_INCREMENT,
                             `cart_id` BIGINT NOT NULL,
                             `book_id` BIGINT NOT NULL,
                             `quantity` INT NOT NULL,
                             `created_at` DATETIME NOT NULL DEFAULT now(),
                             `updated_at` DATETIME NULL,
                             PRIMARY KEY (`id`)
);

CREATE TABLE `review` (
                          `id` BIGINT NOT NULL AUTO_INCREMENT,
                          `member_id` BIGINT NOT NULL,
                          `book_id` BIGINT NOT NULL,
                          `content` VARCHAR(255) NOT NULL,
                          `image` VARCHAR(255) NULL,
                          `score` INT NOT NULL,
                          `created_at` DATETIME NOT NULL DEFAULT now(),
                          `updated_at` DATETIME NULL,
                          PRIMARY KEY (id)
);

CREATE TABLE `book_status` (
                               `id` BIGINT NOT NULL AUTO_INCREMENT,
                               `name` VARCHAR(50) NOT NULL,
                               `created_at` DATETIME NOT NULL DEFAULT now(),
                               `updated_at` DATETIME NULL,
                               PRIMARY KEY (`id`)
);

CREATE TABLE `book` (
                        `id` BIGINT NOT NULL AUTO_INCREMENT,
                        `book_status_id` BIGINT NOT NULL,
                        `ISBN` VARCHAR(100) NOT NULL,
                        `title` VARCHAR(50) NOT NULL,
                        `index` VARCHAR(255) NOT NULL,
                        `description` VARCHAR(255) NOT NULL,
                        `description_detail` VARCHAR(255) NOT NULL,
                        `publisher` VARCHAR(50) NOT NULL,
                        `publication_date` DATETIME NOT NULL,
                        `inventory` INT NOT NULL DEFAULT 0,
                        `price` BIGINT NOT NULL DEFAULT 999999999 COMMENT '만약 가격 오류가 날 경우 결제 막으려고 설정',
                        `is_packaged` BOOLEAN NOT NULL,
                        `image` VARCHAR(255) NULL,
                        `created_at` DATETIME NOT NULL DEFAULT now(),
                        `updated_at` DATETIME NULL,
                        PRIMARY KEY (`id`)
);

CREATE TABLE `return_policy` (
                                 `id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `content` VARCHAR(255) NOT NULL,
                                 `created_at` DATETIME NOT NULL DEFAULT now(),
                                 `updated_at` DATETIME NULL,
                                 PRIMARY KEY (`id`)
);


CREATE TABLE `book_coupon` (
                               `coupon_code`	varchar(16)	NOT NULL,
                               `book_id`	BIGINT	NOT NULL,
                               `created_at`	DATETIME	NOT NULL,
                               `updated_at`	DATETIME	NULL,
                               PRIMARY KEY (`coupon_code`)
);

CREATE TABLE `author_book` (
                               `id` BIGINT NOT NULL AUTO_INCREMENT,
                               `book_id` BIGINT NOT NULL,
                               `author_id` BIGINT NOT NULL,
                               `created_at` DATETIME NOT NULL DEFAULT now(),
                               `updated_at` DATETIME NULL,
                               PRIMARY KEY (`id`)
);

CREATE TABLE `payment` (
                           `id` BIGINT NOT NULL AUTO_INCREMENT,
                           `orders_id` BIGINT NULL,
                           `provider` VARCHAR(50) NOT NULL,
                           `payment_key` VARCHAR(50) NULL,
                           `created_at` DATETIME NOT NULL DEFAULT now(),
                           `updated_at` DATETIME NULL,
                           PRIMARY KEY (`id`)
);



-- Adding foreign keys to member table
ALTER TABLE `member`
    ADD CONSTRAINT `fk_member_users`
        FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
    ADD CONSTRAINT `fk_member_member_grade`
        FOREIGN KEY (`member_grade_id`) REFERENCES `member_grade` (`id`),
    ADD CONSTRAINT `fk_member_member_status`
        FOREIGN KEY (`member_status_id`) REFERENCES `member_status` (`id`);

-- Adding foreign keys to orders table
ALTER TABLE `orders`
    ADD CONSTRAINT `fk_orders_users`
        FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
    ADD CONSTRAINT `fk_orders_wrapping_paper`
        FOREIGN KEY (`wrapping_paper_id`) REFERENCES `wrapping_paper` (`id`),
    ADD CONSTRAINT `fk_orders_status`
        FOREIGN KEY (`orders_status_id`) REFERENCES `orders_status` (`id`),
    ADD CONSTRAINT `fk_orders_return_policy`
        FOREIGN KEY (`return_policy_id`) REFERENCES `return_policy` (`id`),
    ADD CONSTRAINT `fk_orders_delivery_fee`
        FOREIGN KEY (`delivery_fee_id`) REFERENCES `delivery_fee` (`id`);

-- Adding foreign keys to member_address table
ALTER TABLE `member_address`
    ADD CONSTRAINT `fk_member_address_street_address`
        FOREIGN KEY (`street_address_id`) REFERENCES `street_address` (`id`),
    ADD CONSTRAINT `fk_member_address_member`
        FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

-- Adding foreign keys to book_tag table
ALTER TABLE `book_tag`
    ADD CONSTRAINT `fk_book_tag_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
    ADD CONSTRAINT `fk_book_tag_tag`
        FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

-- Adding foreign keys to likes table
ALTER TABLE `likes`
    ADD CONSTRAINT `fk_likes_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
    ADD CONSTRAINT `fk_likes_member`
        FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

-- Adding foreign keys to book_discount_rate table
ALTER TABLE `book_discount_rate`
    ADD CONSTRAINT `fk_book_discount_rate_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

-- Adding foreign keys to orders_book table
ALTER TABLE `orders_book`
    ADD CONSTRAINT `fk_orders_book_orders`
        FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
    ADD CONSTRAINT `fk_orders_book_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

-- Adding foreign keys to cart_book table
ALTER TABLE `cart_book`
    ADD CONSTRAINT `fk_cart_book_cart`
        FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
    ADD CONSTRAINT `fk_cart_book_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

-- Adding foreign keys to review table
ALTER TABLE `review`
    ADD CONSTRAINT `fk_review_member`
        FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
    ADD CONSTRAINT `fk_review_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

-- Adding foreign keys to book_category table
ALTER TABLE `book_category`
    ADD CONSTRAINT `fk_book_category_category`
        FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
    ADD CONSTRAINT `fk_book_category_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

-- Adding foreign keys to author_book table
ALTER TABLE `author_book`
    ADD CONSTRAINT `fk_author_book_author`
        FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
    ADD CONSTRAINT `fk_author_book_book`
        FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);


-- Adding foreign keys to category table
ALTER TABLE `category`
    ADD CONSTRAINT `fk_category_top_category`
        FOREIGN KEY (`top_category_id`) REFERENCES `category` (`id`);

-- Adding foreign keys to member_coupon table
ALTER TABLE `member_coupon`
    ADD CONSTRAINT `fk_member_coupon_coupon`
        FOREIGN KEY (`coupon_code`) REFERENCES `coupon` (`code`);

ALTER TABLE `book_coupon`
    ADD CONSTRAINT `fk_book_coupon_coupon`
        FOREIGN KEY (`coupon_code`) REFERENCES `coupon` (`code`);

ALTER TABLE `category_coupon`
    ADD CONSTRAINT `fk_category_coupon_coupon`
        FOREIGN KEY (`coupon_code`) REFERENCES `coupon` (`code`);

ALTER TABLE `book`
    ADD CONSTRAINT `fk_book_book_status`
        FOREIGN KEY (`book_status_id`) REFERENCES `book_status` (`id`);

ALTER TABLE `point_history`
    ADD CONSTRAINT `fk_point_history_point_policy`
        FOREIGN KEY (`point_policy_id`) REFERENCES `point_policy` (`id`),
    ADD CONSTRAINT `fk_point_history_orders`
        FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
    ADD CONSTRAINT `fk_point_history_member`
        FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);
