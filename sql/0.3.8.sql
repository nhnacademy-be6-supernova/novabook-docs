create table admin
(
    id             bigint auto_increment
        primary key,
    login_id       varchar(255)                       not null,
    login_password varchar(50)                        not null,
    name           varchar(10)                        not null,
    number         varchar(20)                        not null,
    email          varchar(50)                        not null,
    created_at     datetime default CURRENT_TIMESTAMP not null,
    updated_at     datetime                           null,
    constraint email
        unique (email),
    constraint login_id
        unique (login_id)
);

create table book_status
(
    id         bigint auto_increment
        primary key,
    name       varchar(50)                        not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null
);

create table book
(
    id                 bigint auto_increment
        primary key,
    book_status_id     bigint                             not null,
    ISBN               varchar(20)                        not null,
    title              varchar(255)                       not null,
    description        varchar(5000)                      not null,
    description_detail varchar(5000)                      not null,
    author             varchar(255)                       not null,
    publisher          varchar(255)                       not null,
    publication_date   datetime                           not null,
    inventory          int      default 0                 not null,
    price              bigint   default 999999999999      not null,
    discount_price     bigint                             not null,
    is_packaged        tinyint(1)                         not null,
    created_at         datetime default CURRENT_TIMESTAMP not null,
    updated_at         datetime                           null,
    constraint fk_book_book_status_id
        foreign key (book_status_id) references book_status (id)
);

create table category
(
    id              bigint auto_increment
        primary key,
    top_category_id bigint                             null,
    name            varchar(50)                        not null,
    created_at      datetime default CURRENT_TIMESTAMP not null,
    updated_at      datetime                           null,
    constraint fk_category_top_category_id
        foreign key (top_category_id) references category (id)
);

create table book_category
(
    id          bigint auto_increment
        primary key,
    category_id bigint                             not null,
    book_id     bigint                             not null,
    created_at  datetime default CURRENT_TIMESTAMP not null,
    updated_at  datetime                           null,
    constraint fk_book_category_book_id
        foreign key (book_id) references book (id),
    constraint fk_book_category_category_id
        foreign key (category_id) references category (id)
);

create table coupon_template
(
    id                  bigint auto_increment
        primary key,
    name                varchar(255)                       not null comment '이름에 내용을 담음',
    coupon_type         varchar(16)                        null,
    discount_amount     bigint                             not null,
    discount_type       varchar(10)                        not null,
    max_discount_amount bigint                             not null,
    min_purchase_amount bigint                             not null,
    started_at          datetime                           not null comment '다운로드 시작일',
    expiration_at       datetime                           not null comment '다운로드 마감일',
    use_period          int                                not null comment '다운받은날로부터 사용가능한 기간',
    created_at          datetime default CURRENT_TIMESTAMP not null,
    updated_at          datetime                           null
);

create table book_coupon_template
(
    coupon_template_id bigint not null
        primary key,
    book_id            bigint not null,
    constraint fk_book_coupon_template_coupon_template_id
        foreign key (coupon_template_id) references coupon_template (id)
);

create table category_coupon_template
(
    coupon_template_id bigint                             not null
        primary key,
    category_id        bigint                             not null,
    created_at         datetime default CURRENT_TIMESTAMP not null,
    updated_at         datetime                           null,
    constraint fk_category_coupon_template_coupon_template_id
        foreign key (coupon_template_id) references coupon_template (id)
);

create table delivery_fee
(
    id         bigint auto_increment
        primary key,
    fee        bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null
);

create table image
(
    id         bigint auto_increment
        primary key,
    source     varchar(255)                       not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null
);

create table book_image
(
    id         bigint auto_increment
        primary key,
    book_id    bigint                             not null,
    image_id   bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint fk_book_image_book_id
        foreign key (book_id) references book (id),
    constraint fk_book_image_image_id
        foreign key (image_id) references image (id)
);

create table member_grade_policy
(
    id         bigint auto_increment
        primary key,
    name       varchar(50)                        not null,
    min_range  bigint                             not null,
    max_range  bigint                             not null,
    save_rate  bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null
);

create table member_status
(
    id         bigint auto_increment
        primary key,
    name       varchar(50)                        not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null
);

create table member
(
    id               bigint auto_increment
        primary key,
    member_status_id bigint                             not null,
    login_id         varchar(20)                        not null,
    login_password   varchar(255)                       not null,
    name             varchar(50)                        not null,
    number           varchar(20)                        not null,
    email            varchar(100)                       not null,
    birth            datetime                           not null,
    latest_login_at  datetime                           not null,
    authentication   int                                not null,
    created_at       datetime default CURRENT_TIMESTAMP not null,
    updated_at       datetime                           null,
    oauth_id         varchar(36)                        null,
    role             varchar(20)                        not null,
    constraint email
        unique (email),
    constraint login_id
        unique (login_id),
    constraint fk_member_member_status_id
        foreign key (member_status_id) references member_status (id)
);

create table cart
(
    id         bigint auto_increment
        primary key,
    member_id  bigint                             null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint member_id_UNIQUE
        unique (member_id),
    constraint fk_cart_member_id
        foreign key (member_id) references member (id)
);

create table cart_book
(
    id         bigint auto_increment
        primary key,
    cart_id    bigint                               not null,
    book_id    bigint                               not null,
    quantity   int                                  not null,
    is_exposed tinyint(1) default 1                 not null,
    created_at datetime   default CURRENT_TIMESTAMP not null,
    updated_at datetime                             null,
    constraint fk_cart_book_book_id
        foreign key (book_id) references book (id),
    constraint fk_cart_book_cart_id
        foreign key (cart_id) references cart (id)
);

create table likes
(
    id         bigint auto_increment
        primary key,
    book_id    bigint                             not null,
    member_id  bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint fk_likes_book_id
        foreign key (book_id) references book (id),
    constraint fk_likes_member_id
        foreign key (member_id) references member (id)
);

create table member_coupon
(
    coupon_id  bigint                             not null
        primary key,
    member_id  bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint fk_member_coupon_member_id
        foreign key (member_id) references member (id)
);

create table member_grade_history
(
    id                     bigint auto_increment
        primary key,
    member_id              bigint                             not null,
    member_grade_policy_id bigint                             not null,
    quarter                varchar(6)                         not null,
    created_at             datetime default CURRENT_TIMESTAMP not null,
    updated_at             datetime                           null,
    constraint fk_member_grade_history_member_grade_policy_id
        foreign key (member_grade_policy_id) references member_grade_policy (id),
    constraint fk_member_grade_history_member_id
        foreign key (member_id) references member (id)
);

create table orders_status
(
    id         bigint auto_increment
        primary key,
    name       varchar(50)                        not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null
);

create table payment
(
    id          bigint auto_increment
        primary key,
    provider    varchar(50)                        not null,
    payment_key varchar(50)                        null,
    created_at  datetime default CURRENT_TIMESTAMP not null,
    updated_at  datetime                           null
);

create table point_policy
(
    id               bigint auto_increment
        primary key,
    review_point     bigint                             not null comment '리뷰 포인트 적립금',
    basic_point_rate bigint                             not null comment '기본 도서 적립률',
    register_point   bigint                             not null comment '회원가입 포인트 적립금',
    created_at       datetime default CURRENT_TIMESTAMP not null,
    updated_at       datetime                           null
);

create table return_policy
(
    id         bigint auto_increment
        primary key,
    content    varchar(255)                       not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null
);

create table street_address
(
    id             bigint auto_increment
        primary key,
    zipcode        varchar(6)                         not null,
    street_address varchar(255)                       not null,
    created_at     datetime default CURRENT_TIMESTAMP not null,
    updated_at     datetime                           null
);

create table member_address
(
    id                    bigint auto_increment
        primary key,
    street_address_id     bigint                             not null,
    member_id             bigint                             not null,
    nickname              varchar(20)                        not null,
    member_address_detail varchar(50)                        not null,
    created_at            datetime default CURRENT_TIMESTAMP not null,
    updated_at            datetime                           null,
    constraint fk_member_address_member_id
        foreign key (member_id) references member (id),
    constraint fk_member_address_street_address_id
        foreign key (street_address_id) references street_address (id)
);

create table tag
(
    id         bigint auto_increment
        primary key,
    name       varchar(50)                        not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint name
        unique (name)
);

create table book_tag
(
    id         bigint auto_increment
        primary key,
    book_id    bigint                             not null,
    tag_id     bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint fk_book_tag_book_id
        foreign key (book_id) references book (id),
    constraint fk_book_tag_tag_id
        foreign key (tag_id) references tag (id)
);

create table wrapping_paper
(
    id         bigint auto_increment
        primary key,
    name       varchar(50)                           not null,
    price      bigint                                not null,
    status     varchar(10) default 'ACTIVE'          not null,
    created_at datetime    default CURRENT_TIMESTAMP not null,
    updated_at datetime                              null
);

create table orders
(
    id                     bigint auto_increment
        primary key,
    delivery_fee_id        bigint                             not null,
    wrapping_paper_id      bigint                             not null,
    orders_status_id       bigint                             not null,
    member_id              bigint                             null,
    payment_id             bigint                             null,
    code                   varchar(255)                       null comment '주문 code',
    orders_date            datetime default CURRENT_TIMESTAMP not null,
    use_coupon_id          bigint                             null comment '적용한 쿠폰 ID',
    total_amount           bigint                             not null,
    delivery_date          datetime                           not null,
    book_purchase_amount   bigint                             not null,
    delivery_address       varchar(300)                       not null,
    receiver_name          varchar(30)                        not null,
    receiver_number        varchar(20)                        not null,
    sender_name            varchar(30)                        not null,
    sender_number          varchar(20)                        not null,
    created_at             datetime default CURRENT_TIMESTAMP not null,
    updated_at             datetime                           null,
    coupon_discount_amount bigint                             null comment '쿠폰 적용 할인금액 ',
    use_point_amount       bigint   default 0                 null comment '사용한 포인트 금액',
    point_save_amount      bigint                             null comment '포인트 적립금',
    constraint code_unique
        unique (code),
    constraint fk_orders_delivery_fee_id
        foreign key (delivery_fee_id) references delivery_fee (id),
    constraint fk_orders_member_id
        foreign key (member_id) references member (id),
    constraint fk_orders_orders_status_id
        foreign key (orders_status_id) references orders_status (id),
    constraint fk_orders_payment_id
        foreign key (payment_id) references payment (id),
    constraint fk_orders_wrapping_paper_id
        foreign key (wrapping_paper_id) references wrapping_paper (id)
);

create table orders_book
(
    id         bigint auto_increment
        primary key,
    orders_id  bigint                             not null,
    book_id    bigint                             not null,
    quantity   int                                not null,
    price      bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint fk_orders_book_book_id
        foreign key (book_id) references book (id),
    constraint fk_orders_book_orders_id
        foreign key (orders_id) references orders (id)
);

create table point_history
(
    id              bigint auto_increment
        primary key,
    orders_id       bigint                             null,
    point_policy_id bigint                             not null,
    member_id       bigint                             null,
    point_content   varchar(255)                       not null,
    point_amount    bigint                             not null,
    created_at      datetime default CURRENT_TIMESTAMP not null,
    updated_at      datetime                           null,
    constraint fk_point_history_member_id
        foreign key (member_id) references member (id),
    constraint fk_point_history_orders_id
        foreign key (orders_id) references orders (id),
    constraint fk_point_history_point_policy_id
        foreign key (point_policy_id) references point_policy (id)
);

create table review
(
    id             bigint auto_increment
        primary key,
    orders_book_id bigint                             not null,
    content        varchar(255)                       not null,
    score          int                                not null,
    created_at     datetime default CURRENT_TIMESTAMP not null,
    updated_at     datetime                           null,
    constraint fk_review_orders_book_id
        foreign key (orders_book_id) references orders_book (id)
);

create table review_image
(
    id         bigint auto_increment
        primary key,
    review_id  bigint                             not null,
    image_id   bigint                             not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime                           null,
    constraint fk_review_image_image_id
        foreign key (image_id) references image (id),
    constraint fk_review_image_review_id
        foreign key (review_id) references review (id)
);


