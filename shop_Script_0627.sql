-- [ 데이터베이스 생성 ] (쇼핑몰 용도)
create database shop;

-- [ 테이블 생성 ] (쇼핑몰 데이터베이스에)

-- 1. 상품 / 마스터
create table tb_product_mst (
seq bigint primary key auto_increment,         -- 상품 등록 순번
product_id varchar(50) not null,               -- 상품 ID (식별용)
seller_id varchar(20) not null,                -- 상품 판매자 ID
product_category varchar(3) not null,          -- 상품 분류 -- 관리자가 정한 카테고리만 사용가능 (이용자가 생성 불가능)
product_name varchar(150) not null,            -- 상품명
product_image varchar(255),                    -- 상품 이미지 (t. not null은 나중에 필요할 때 넣기)
product_keyword varchar(255) not null,         -- 상품 관련 키워드
reg_dt datetime default current_timestamp,     -- 상품 등록일시
modify_dt datetime default current_timestamp   -- 상품 수정일시
);

-- 2. 상품 세부정보
create table tb_product_detail (
seq bigint primary key auto_increment,         -- 상품 세부정보 등록 순번
product_id varchar(50) not null,               -- 상품 ID (식별용)
product_descript varchar(255),                 -- 상품 설명
product_amount int,                            -- 상품 수량
product_price int                              -- 상품 단가 (t.소수가 들어가는 경우 number를 사용해도 됨)
); 

-- 3. 주문 / 마스터
create table tb_order_mst (
seq bigint primary key auto_increment,         -- 주문 등록 순번
product_id varchar(50) not null,               -- 상품 ID (식별용)
user_id varchar(20) not null,                  -- 이용자 ID
order_amount int not null,                     -- 주문 수량
state int default 0,                           -- 주문 상태 (주문, 결제, 배송, 완료 등으로 구분)
order_dt datetime default current_timestamp,   -- 주문 일시
payment_dt datetime default current_timestamp, -- 결제 일시
finished_dt datetime default current_timestamp -- 결제 일시
);

-- 4. 상품평
create table tb_product_comment (
seq bigint primary key auto_increment,         -- 상품평 등록 순번
product_id varchar(50) not null,               -- 상품 ID (식별용)
buyer_id varchar(50) not null,                 -- 구매자 ID (식별용)
comment text,                                  -- 상품평
product_score int,                             -- 별점(상품 만족도)
comment_image varchar(255)                     -- 상품 이미지
reg_dt datetime default current_timestamp,     -- 상품평 등록일시
modify_dt datetime default current_timestamp   -- 상품평 수정일시
);

-- 5. 이용자 / 마스터
create table tb_user_mst (
seq bigint primary key auto_increment,         -- 상품평 등록 순번
user_id varchar(20) not null,                  -- 이용자 ID
user_name varchar(20) not null,                -- 이용자 이름
user_birthdate varchar(4) not null,            -- 이용자 생년월일(yyyymmdd)
user_gender varchar(4) not null,               -- 이용자 성별
user_grade varchar(3) default 0,               -- 이용자 회원등급
reg_dt datetime default current_timestamp     -- 회원가입 일시
);

-- 6. 이용자 세부정보
create table tb_user_detail (
seq bigint primary key auto_increment,         -- 이용자 세부정보 등록 순번
user_id varchar(50),                           -- 이용자 ID
zip_Code varchar(5),                           -- zipCode
address varchar(50),                           -- 이용자 주소
address_detail varchar(50),                    -- 이용자 세부주소
email varchar(30),                             -- 이메일
phone varchar(11)                              -- 연락처(휴대폰)
);

-- 7. 코드(분류)
create table tb_code_mst (
seq bigint primary key auto_increment,         -- 코드 등록 순번
code_name varchar(20) not null                 -- 코드 이름
);

-- 8. 코드 세부정보
create table tb_code_detail (
seq bigint primary key auto_increment,         -- 코드 등록 순번
code_code int not null,                        -- 코드 코드
code_name varchar(20) not null                 -- 코드 이름
);

-- [ 데이터 값 입력 ]

-- 1. 코드 마스터 테이블
insert into tb_code_mst(code_name) values('회원관리');
insert into tb_code_mst(code_name) values('상품관리');

-- 2. 코드 세부정보 테이블 - 이용자 분류
insert into tb_code_detail(code_code, code_name) values(1,'관리자');
insert into tb_code_detail(code_code, code_name) values(1,'판매자');
insert into tb_code_detail(code_code, code_name) values(1,'일반사용자');

-- 3. 코드 세부정보 테이블 - 상품 분류
insert into tb_code_detail(code_code, code_name) values(2,'계절용품');
insert into tb_code_detail(code_code, code_name) values(2,'가정용품');
insert into tb_code_detail(code_code, code_name) values(2,'생활용품');

insert into tb_code_detail(code_code, code_name) values(3,'장바구니');
insert into tb_code_detail(code_code, code_name) values(3,'결제완료');
insert into tb_code_detail(code_code, code_name) values(3,'배송중');
insert into tb_code_detail(code_code, code_name) values(3,'배송완료');
insert into tb_code_detail(code_code, code_name) values(3,'반품');

-- [ 코드 마스터 테이블에서 코드 네임이 회원관리인 seq가, 코드 세부정보의 code_code와 일치하는 데이터를 불러오는데, seq와 code_name을 출력한다.]
select seq, code_name
from   tb_code_detail
where  code_code = (select seq
              from tb_code_mst
              where code_name='회원관리');
             
-- [ 테스트 데이터 리셋 ]
drop table tb_code_mst;
drop table tb_code_detail;

-- [ 이용자 마스터 테이블 구성 조회]
desc tb_user_mst;

-- [ 이용자 마스터 테이블에 데이터 값 입력 ]
insert into tb_user_mst (user_id,user_name,user_birthdate,user_gender,user_grade) 
values ('admin','관리자','9999','0','3');

insert into tb_user_mst (user_id,user_name,user_birthdate,user_gender,user_grade) 
values ('administrator','관리자','9999','0','3');

insert into tb_user_mst (user_id,user_name,user_birthdate,user_gender,user_grade) 
values ('root','관리자','9999','0','3');

-- [ 가져와야 할 데이터 ]
select *
from tb_code_mst;
select *
from tb_code_detail;

-- [ Dao에 넣을 쿼리문]
select seq,code_name as codeName
from tb_code_mst;

-- [ *상동 ]
INSERT INTO tb_code_mst(code_name) VALUES(?)


-- ------
select *
from tb_code_mst;

-- 코드 디테일 테이블에 값 입력 시키기
insert into tb_code_detail (code_code, code_name, code_desc, state)
values(category, codeName, codeDesc, state);





-- [ 판매자 관리 테이블 생성 ]
create table tb_seller_mst (
seq bigint primary key auto_increment comment '등록번호',
user_id varchar(20) not null comment '판매자 ID',
company_name varchar(50) comment '회사명', -- 개인 판매자: user_id(이용자 ID 사용) / 법인 판매자: company_name(회사명 사용)
user_account varchar(20) comment '판매자 계정',
user_grade int default 0 comment '판매자 등급', -- 상품 등록 및 판매 수수료 책정과 연관
user_email varchar(100) comment '판매자 연락처(이메일)',
user_phone varchar(4) comment '판매자 연락처(휴대폰)'
);








