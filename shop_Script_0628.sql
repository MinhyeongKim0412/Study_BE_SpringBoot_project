select * from tb_user_mst;


show tables;

select * from tb_user_detail;

select * from tb_seller_mst;


create table tb_seller_mst(
   seq bigint primary key auto_increment,
   user_id varchar(20) comment '판매자 아이디',
   company_name varchar(50) comment '법인이냐 개인이냐',
   user_account varchar(20) comment '판매자 계좌번호',
   user_grade int default 0 comment '판매자 등급',
   user_email varchar(40) comment '판매자 이메일',
   user_phone varchar(11) comment '판매자 연락처'
);



alter table tb_seller_mst add column bank_code varchar(2);
alter table tb_seller_mst add column biz_type varchar(2);

desc tb_seller_mst;

delete from tb_user_mst where user_id like 'sell%';

select * from tb_seller_mst;

select code_name from tb_code_detail where seq = 9;


delete from tb_user_mst where user_grade in ('0','1');

select * from tb_user_mst a, tb_code_detail b;


select * from tb_code_detail;


select * from tb_code_detail 
 where code_code in 
   (select seq from tb_code_mst where code_name = '회원관리'); 

  
select * from tb_user_mst;

update tb_user_mst set user_grade = 14 where user_grade=3;
update tb_user_mst set user_grade = 1 where user_grade=0;

-- 14번 관리자
-- 1번 일반유저
-- 4번 셀러
delete from tb_user_mst where user_grade=0; 
delete from tb_seller_mst;

select a.user_id as userId, 
       a.user_name as userName,
       a.user_grade as userGrade,
       b.code_name as codeName,
       a.reg_dt as regDt
   from tb_user_mst a, (select seq, code_name 
                          from tb_code_detail 
                         where code_code = (select seq 
                         from tb_code_mst where code_name='회원관리')) b
   where a.user_grade = b.seq;
update tb_user_mst set user_password = '1111'; 

  
  select code_code, code_name 
                          from tb_code_detail 
                         where code_code = (select seq 
                         from tb_code_mst where code_name='회원관리')
  
  
 select * from tb_user_mst;
  
  
  
  
select code_code, code_name 
  from tb_code_detail 
  where code_code = (select seq 
                     from tb_code_mst where code_name='회원관리');

select * from tb_code_mst;


select  * from tb_user_mst where user_id='111';


desc tb_product_mst;
seq
product_id
seller_id
product_category
product_name
product_image
product_keyword
reg_dt
modify_dt
;
select a.seq,
       a.product_id
       a.product_category,
       b.code_name,
       a.product_name,
       a.product_image,
       a.product_keyword,
       a.reg_dt
  from tb_product_mst a, tb_code_detail b
 where seller_id = 'allomyrina' 
  and a.product_category = b.seq 
  and b.code_code=2;


select * from tb_code_detail where code_code = 2;


 
desc tb_product_mst;

product_id = seller_id+;


select  concat('allomyrina_',ifnull(max(seq),0)+1)
from tb_product_mst where seller_id = 'allomyrina';




