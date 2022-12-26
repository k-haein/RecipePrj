

drop sequence loginlog_seq;

drop sequence kind_tag_seq;

drop sequence theme_tag_seq;

drop sequence material_tag_seq;

drop sequence store_review_no_sq;

drop sequence member_info_seq;

drop sequence class_info_seq;

drop sequence recipe_info_seq;

drop sequence order_no_sq;

drop sequence scrap_seq;

drop sequence subscribe_seq;

drop sequence review_seq;

drop sequence customer_care_seq;

drop sequence store_order_sq;

drop sequence ad_sq;
drop sequence ad_sche_no_sq;
drop sequence str_pro_no_sq;
drop sequence str_cart_no_sq;
drop sequence trd_list_no_sq;
drop sequence pay_info_no_sq;
drop sequence chef_req_no_sq;


 -- pay_info테이블 foreign key 제약조건 삭제 --
alter table pay_info drop constraint pay_info_str_pro_no_fk;
alter table pay_info drop constraint pay_info_mem_no_fk;

-- chef_request 테이블 foreign key 제약조건 삭제 --
alter table chef_request drop constraint chef_request_mem_no_fk;

-- store_cart 테이블 foreign key 제약조건 삭제 --
  alter table store_cart drop constraint store_cart_mem_no_fk;
alter table store_cart drop constraint store_cart_str_pro_no_fk;

 -- store_product 테이블 foreign key 제약조건 삭제 --
  alter table store_product drop constraint store_product_trd_list_no_fk;

 -- admin_schedule 테이블 foreign key 제약조건 삭제 --
  alter table admin_schedule drop constraint admin_schedule_ad_no_fk;


 -- member_info 테이블 foreign key 제약조건 삭제 --
  alter table member_info drop constraint member_info_kind_tag_no_fk;


drop table rpatest;

drop table store_review CASCADE CONSTRAINTS;

drop view cheflist;

drop table visit_info  CASCADE CONSTRAINTS;

drop table customer_care  CASCADE CONSTRAINTS;

drop table review  CASCADE CONSTRAINTS;

drop table subscribe  CASCADE CONSTRAINTS;

drop table recipe_info  CASCADE CONSTRAINTS;

drop table scrap  CASCADE CONSTRAINTS;

drop table class_info  CASCADE CONSTRAINTS;

drop table member_info  CASCADE CONSTRAINTS;

drop table kind_tag  CASCADE CONSTRAINTS;

drop table theme_tag  CASCADE CONSTRAINTS;

drop table material_tag  CASCADE CONSTRAINTS;

drop table store_order;

drop table chef_request  CASCADE CONSTRAINTS;
drop table pay_info  CASCADE CONSTRAINTS;
drop table store_cart  CASCADE CONSTRAINTS;
drop table store_product  CASCADE CONSTRAINTS;
drop table trade_list  CASCADE CONSTRAINTS;
drop table admin_schedule  CASCADE CONSTRAINTS;
drop table loginlog CASCADE CONSTRAINTS;
drop table admin_info  CASCADE CONSTRAINTS;

 
/* 날짜 변환 */

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

 create sequence store_review_no_sq
   start with 1
   increment by 1;


create sequence order_no_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 999999;  

select order_no_sq.nextval from dual; 
 
--로그인내역 시퀀스
create sequence loginlog_seq
	start with 1
	increment by 1;


/* 종류 태그 시퀀스 */

create sequence kind_tag_seq

	start with 1

	increment by 1;
    

create sequence store_order_sq

	start with 1

	increment by 1;

/* 테마 태그 시퀀스 */

create sequence theme_tag_seq

	start with 1

	increment by 1;

 

/* 주재료 태그 시퀀스 */

create sequence material_tag_seq

	start with 1

	increment by 1;


/* 회원정보 시퀀스 */
create sequence member_info_seq

	start with 1

	increment by 1;

 

/* 요리강좌 시퀀스 */

create sequence class_info_seq

	start with 1

	increment by 1;

 

/* 레시피 시퀀스 */

create sequence recipe_info_seq

	start with 1

	increment by 1;

 

/* 스크랩 시퀀스 */

create sequence scrap_seq

	start with 1

	increment by 1;

 

/* 구독 시퀀스 */

create sequence subscribe_seq

	start with 1

	increment by 1;

 

/* 후기 시퀀스 */

create sequence review_seq

	start with 1

	increment by 1;



/* 고객센터 시퀀스 */

create sequence customer_care_seq

	start with 1

	increment by 1;



    
create sequence ad_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 99;
    

    
  create sequence ad_sche_no_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 99999;  
    
    
 create sequence trd_list_no_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 999;  

    
 create sequence str_pro_no_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 99999;  
    
 create sequence str_cart_no_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 99999;  
    
 create sequence pay_info_no_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 999999;  
    
    
  create sequence chef_req_no_sq
    start with 0
    increment by 1
    minvalue 0
    maxvalue 99999;  
    
    
    
   

/*음식태그는 fk가 없기 때문에 음식태그부터 create 해야댐

그냥 순서대로 드래그 하고 실행하면 됩니다 */

 

 

/*음식 종류 태그 테이블*/

CREATE table kind_tag(
        kind_tag_no number(4),
        kind_tag_name varchar2(40) not null,

        PRIMARY key (kind_tag_no)

);



/*테마 태그 테이블*/

CREATE table theme_tag(
        theme_tag_no number(4),
        theme_tag_name varchar2(40) not null,

        PRIMARY key (theme_tag_no)

);


/*주재료 태그 테이블*/

CREATE table material_tag(
        material_tag_no number(4),
        material_tag_name varchar2(40) not null,

        PRIMARY key (material_tag_no)
);



/*회원 정보 테이블*/

create table member_info (
        mem_no number(5),
        mem_id  varchar2(15) not null unique,
        mem_pwd  varchar2(15)  not null,
        mem_name  varchar2(15) not null,
        mem_nickname  varchar2(20) not null,
        mem_juminnum  char(13) not null unique,
        mem_email  varchar2(30) not null unique,
        mem_phone  char(11) not null unique,
        mem_regdate  date default sysdate,
        mem_pic  varchar2(90),
        mem_status varchar2(10),
        mem_declare number(3),
        mem_grade_no  varchar2(10) not null,
        kind_tag_no number(2),

        PRIMARY key (mem_no),
        constraint  member_info_kind_tag_no_fk 
        foreign key(kind_tag_no) REFERENCES kind_tag(kind_tag_no)
);

--rpatest 테이블
create table rpatest(
mem_email varchar2(30),
chef_regdate date);


/*클래스 정보 테이블*/
create table class_info (
        class_no number(5),
        mem_no number(5) not null,
        class_title  varchar2(80) not null,
        class_thumbnail  varchar2(80) not null,
        class_content  varchar2(800),       
        class_recipe_video varchar2(80) not null,
        mate_name varchar2(600), --요기--
        mate_cnt varchar2(600), --요기---
        step varchar2(800), ----
        class_price  number(7) not null,
        class_period  varchar2(20) not null,
        class_cooktime  varchar2(20) not null,
        class_detail_info varchar2(600),       
        kind_tag_no number(4) not null,
        theme_tag_no number(4) not null,
        material_tag_no number(4) not null,
        class_uploadtime  date default sysdate,
        view_cnt number default 0, 
        admin_app number(4) not null,
        --fk에도 mete, step 조인했던거 뻇어요--
        PRIMARY key (class_no),
        foreign key(mem_no) REFERENCES member_info(mem_no),
        foreign key(kind_tag_no) REFERENCES kind_tag(kind_tag_no),
        foreign key(theme_tag_no) REFERENCES theme_tag(theme_tag_no),
        foreign key(material_tag_no) REFERENCES material_tag(material_tag_no)
);



/*레시피정보 테이블*/

create table recipe_info (
    recipe_no  number(4),
    mem_no  number(5) not null,
    recipe_title  varchar2(60) not null,
    recipe_thumbnail  varchar2(80) not null,
    recipe_video varchar2(50),
    recipe_content  varchar2(180) not null,
    recipe_time  varchar2(20) not null,
    recipe_level  varchar2(20) not null,
    mate_name varchar2(500), 
    mate_cnt varchar2(500), 
    step varchar2(800), 
    visit_cnt  number(5) not null,
    report_cnt  number(3),
    kind_tag_no number(4) not null,
    theme_tag_no number(4) not null,
    material_tag_no number(4) not null,
    recipe_uploadtime  date default sysdate,
    
    PRIMARY key (recipe_no),
    foreign key(mem_no) REFERENCES member_info(mem_no),
    foreign key(kind_tag_no) REFERENCES kind_tag(kind_tag_no),
    foreign key(theme_tag_no) REFERENCES theme_tag(theme_tag_no),
    foreign key(material_tag_no) REFERENCES material_tag(material_tag_no)
);


/*리뷰 테이블 Type에 클래스 1번 레시피 2번*/

CREATE TABLE review ( 
    review_no  number(5),
    mem_no  number(5) not null,
    class_no  number(5),
    recipe_no  number(4),
    type varchar2(10),
    star_rate  number(1) not null,
    review_content  varchar2(80) not null,
    review_date  date default sysdate,
    review_declare number(3),

    PRIMARY KEY(review_no),
    foreign key(mem_no) REFERENCES member_info(mem_no),
    foreign key(class_no) REFERENCES class_info(class_no),
    foreign key(recipe_no) REFERENCES recipe_info(recipe_no)
); 


--스크랩 테이블--
create table scrap (
    scrap_no  number(4),
    mem_no number(5) not null,
    recipe_no  number(4),
    scrap_cnt number(5),
    scrap_uploadtime  date default sysdate,
    PRIMARY key (scrap_no),
    foreign key(mem_no) REFERENCES member_info(mem_no),
    foreign key(recipe_no) REFERENCES recipe_info(recipe_no)
    ON DELETE CASCADE
);


/*구독 테이블*/
create table subscribe (
    subscribe_no number(5),
    kind_tag_no number(2) not null,
    mem_no number(5) not null,
    subscribe_mem_no,
    subscribe_uploadtime  date default sysdate,

    PRIMARY key (subscribe_no),
    foreign key(kind_tag_no) REFERENCES kind_tag(kind_tag_no),
    foreign key(mem_no) REFERENCES member_info(mem_no),
    foreign key(subscribe_mem_no) REFERENCES member_info(mem_no)
);


--쉐프 목록 뷰 만들기--
create view cheflist as
select  m.mem_no as mem_no, 
        m.mem_nickname as mem_nickname ,
        count(r.recipe_no) as recipe_cnt,
        count(s.mem_no) as subscribe_cnt,
        m.mem_pic as mem_pic,
        m.kind_tag_no as kind_tag_no, 
        k.kind_tag_name as kind_tag_name,
        m.mem_grade_no 
    from 
    recipe_info r right outer
    join member_info m on m.mem_no = r.mem_no 
    join kind_tag k on k.kind_tag_no = m.kind_tag_no
    left outer join subscribe s on s.subscribe_mem_no = m.mem_no
    where m.mem_grade_no = '쉐프'
    group by m.mem_no, m.mem_grade_no, r.mem_no, m.mem_nickname, k.kind_tag_name, 
m.kind_tag_no, m.mem_pic;
    

/*고객센터 테이블*/
CREATE TABLE customer_care(

    cuscare_no  number(5),
    mem_no  number(5) not null,
    question  varchar2(80) not null,
    answer  varchar2(400) not null,
    cuscare_time date default sysdate,

    PRIMARY KEY(cuscare_no),
    foreign key(mem_no) REFERENCES member_info(mem_no)

);



/*방문 정보 테이블*/

CREATE TABLE visit_info(

    mem_no  number(5),
    visit_ip  varchar2(20) not null,
    visit_date  date default sysdate,
    visit_refer  varchar2(200) not null,
    visit_agent  varchar2(200) not null

);




-- 관리자 정보 테이블 생성 --
create table admin_info (
        ad_no number(2),
        ad_name varchar2(15) not null,
        ad_phone char(11) not null,
        ad_email varchar2(30) unique,
        ad_pwd varchar2(15) not null,
        ad_author varchar2(50) not null,
        ad_logintime date default sysdate,
        ad_logouttime date default sysdate,
        ad_regdate date default sysdate, 
       PRIMARY key(ad_no)
);

-- 관리자 정보 테이블 생성 --
create table admin_schedule (
        ad_sche_no number(5),
        ad_no number(2),
        ad_sche_imp varchar2(15),
        ad_sche_date  varchar(10),
        ad_sche_hour  varchar(2),
        ad_sche_title  varchar2(80) not null,
        ad_sche_detail varchar2(200) not null,
       primary key(ad_sche_no),
      constraint  admin_schedule_ad_no_fk   foreign key(ad_no) references admin_info(ad_no) on delete cascade
);



-- 거래처 목록 테이블 생성 --
create table trade_list (
        trd_list_no number(3),
        trd_list_name varchar2(30)  not null,
        trd_list_mng_name  varchar2(20)  not null,
        trd_list_mng_phone  char(11),
        trd_list_orderdate date default sysdate,
        trd_list_receivedate date default sysdate,
       primary key(trd_list_no)
);



-- 스토어 상품 테이블 생성 --
--동주 str_pro_detail_image // str_pro_content 추가
create table store_product (
        str_pro_no number(5),
        trd_list_no number(3),
        str_pro_image  varchar2(90)  not null,
        str_pro_detail_image varchar2(90) not null,
        str_pro_content varchar2(200) not null,
        str_pro_name  varchar2(50) not null,
        str_pro_remind  number(3),
        str_pro_primecost number(7)  not null,
        str_pro_salescost number(7)  not null,
        str_pro_show number(1)  not null,
       primary key(str_pro_no),
     constraint store_product_trd_list_no_fk   foreign key(trd_list_no) references trade_list(trd_list_no) on delete cascade
);


--상품 리뷰--

CREATE TABLE store_review ( 
    store_review_no  number(5),
    str_pro_no number(5),
    mem_no  number(5) not null,
    mem_name varchar2(30) not null,
    email varchar2(30) not null,
    score  number(10) not null,
    store_review_content  varchar2(80) not null,
    store_review_date  date default sysdate,
    PRIMARY KEY(store_review_no),
    foreign key(mem_no) REFERENCES member_info(mem_no),
    foreign key(str_pro_no) REFERENCES store_product(str_pro_no)
); 


-- 스토어 장바구니 테이블 생성--
create table store_cart (
        str_cart_no number(5),
        mem_no number(5),
        str_pro_no  number(5),
        str_cart_cnt  number(3) default 0,
       primary key(str_cart_no),
    constraint store_cart_mem_no_fk foreign key(mem_no) references member_info(mem_no),
    constraint store_cart_str_pro_no_fk  foreign key(str_pro_no) references store_product(str_pro_no)
);

--스토어주문 테이블
create table store_order(
        str_cart_no number(6), 
        str_ord_no number(6), 
        mem_no number(5),  
        str_pro_no number(5),  
        str_ord_cnt number(4), 
        str_ord_addr varchar2(80),
        str_ord_date date default sysdate, 
        primary key (str_cart_no)
 );

-- 결제정보 테이블 생성 --
create table pay_info (
        pay_info_no number(6),
        pay_info_date date default sysdate,
        str_pro_no  number(5),
        mem_no  number(5),
        class_no number(5),
        post_num varchar2(8),
        place_addr varchar2(50),
        place_telnum varchar2(15),
        pay_info_type  varchar2(30) not null,
        str_ord_status  varchar2(20) not null,
        primary key(pay_info_no),
        constraint pay_info_str_pro_no_fk foreign key(str_pro_no) references store_product(str_pro_no),
        constraint pay_info_mem_no_fk foreign key(mem_no) references member_info(mem_no)
);
     

-- 셰프 신청 테이블 생성--
create table chef_request (
        chef_req_no number(5),
        mem_no number(5),
        chef_req_content varchar2(120) not null,
        chef_regdate  date default sysdate,
       primary key(chef_req_no),
    constraint chef_request_mem_no_fk foreign key(mem_no) references member_info(mem_no)
);


 --로그인 내역 테이블
create table loginlog(
        log_no number(10)
        , ad_no number(2)
        , log_reip varchar2(20)
        , log_uagent varchar2(20)
        , log_login_fl char(1)
        , log_status varchar2(8)
        , log_logtime date
        , primary key(log_no)
        , constraint admin_info_ad_no_fk foreign key(ad_no) references admin_info(ad_no) ON DELETE CASCADE
    );
 

 

/*태그에 미리 데이터 넣었어요*/

 

insert into kind_tag values(10,'한식');

insert into kind_tag values(20,'양식');

insert into kind_tag values(30,'일식');

insert into kind_tag values(40,'중식');

insert into kind_tag values(50,'아시안');

insert into kind_tag values(60,'Vegan');

insert into kind_tag values(70,'Quick Food');

insert into kind_tag values(80,'Dessert');

insert into kind_tag values(90,'기타');

 

 

insert into theme_tag values(11,'일상');

insert into theme_tag values(21,'손님접대');

insert into theme_tag values(31,'술안주');

insert into theme_tag values(41,'다이어트');

insert into theme_tag values(51,'간식');

insert into theme_tag values(61,'기타');

 

 

insert into material_tag values(12,'돼지고기');

insert into material_tag values(22,'소고기');

insert into material_tag values(32,'닭고기');

insert into material_tag values(42,'해산물');

insert into material_tag values(52,'채소류/과일류');

insert into material_tag values(62,'기타');






--관리자 추가
insert into admin_info values(ad_sq.nextval, '어드민', '01055332218', 'asd@naver.com', 'rhksflwk1', '관리자,스토어관리,회원관리', sysdate, sysdate, sysdate);
insert into admin_info values(ad_sq.nextval, '회원관리자', '01012341234', 'asd1@naver.com', 'rhksflwk1', '회원관리', sysdate, sysdate, sysdate);
insert into admin_info values(ad_sq.nextval, '스토어관리자', '01014231235', 'asd2@naver.com', 'rhksflwk1', '스토어관리', sysdate, sysdate, sysdate);

--select * from admin_info



-- 멤버 데이터 --

insert into member_info values(member_info_seq.nextval, 'abc123', 'qwe123', 'A팀', '레시피', '9500112121221', 'abc123@naver.com', '01024434455', sysdate, 'photo_11.png', '일반', 5, '일반인', 10);




/*     ==========   1   ================    */

-- 멤버 데이터 --

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'12341234','12341234','김일식','김일식','9111233223200','ab3c1@13233v2er.com',12302239999,sysdate,'photo_01.png','쉐프',20);



-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )
                            
   values(class_info_seq.nextval, member_info_seq.currval , '미나리 새우샐러드' , 'foodImg_16.jpg'  , 
  '미나리가 제철이라 요즘 많이들 드시는 것 같은데 최고의 요리비결에서 방영아 요리연구가님께서 알려주신 레시피. 알록달록 색이 정말 예쁜 샐러드 아삭아삭한 미나리의 식감을 제대로 즐길 수 있는 샐러드예요:)' ,'https://tv.naver.com/v/3038881' , '미나리,새우살, 방울토마토, 어린잎채소,  소금,통깨, 사과주스, 다진 양파, 간장, 사과식초,엑스트라 버진 올리브유, 소금, 설탕, 레몬즙, 파슬리가루' ,  '100g, 150g, 8개, 10g, 약간, 1.5TS ,1TS, 0.5TS,1ts,2TS,3TS,약간,1TS,1TS, 1TS' , '볼에 드레싱 재료를 넣고 섞어둔다,방울토마토는 반으로 가른다,끓는 물에 소금을 약간 넣고 새우를 2-3분간 데친다,미나리는 손질한 뒤 한입 크기로 썰어 찬물에 잠시 담궈둔다,접시에 물기를 제거한 미나리와 어린잎 채소를 올린다,방울토마토, 새우를 올린 뒤 먹기 전에 드레싱을 뿌려낸다.', 2000  , '50일'  , '10분이내', '손님초대요리로 내어도 매우 좋을 것 같은 샐러드.아마 소스는 만들고나서 바로 보면 이게 제대로 된건가 싶은 비쥬얼로 완성이되는데 그것이 맞습니다 ㅎㅎ. 파슬리 때문에 건더기가 많아서 뿌려낼 때 꼭 잘 휘저어서 뿌려야해요. 또한 통깨는 살짝 부수어서 넣으면 더 고소하다고 하네요~', 20 ,21 ,42 ,  sysdate , 1);



-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )
    
   values(class_info_seq.nextval, member_info_seq.currval , '구운야채 샌드위치' , 'foodImg_20.png'  , 
  '안녕하세요. Jay입니다. 채식주의자와 육식주의자를 동시에 만족시킬 수 있는 샌드위치 레시피를 소개해 드릴게요. 향긋한 바질 페스토 소스를 곁들인 <구운 야채 샌드위치>예요. 버섯의 쫄깃한 식감이 그대로 살아있는 샌드위치죠. 야채만으로는 부족하시다면? 고기만 구워서 샌드위치에 함께 곁들여보세요. 한 끼 식사로 든든하답니다.' 
  ,'https://www.youtube.com/embed/qk1Ht_Er-AU' , '애호박,새송이버섯,파프리카,양파,방울토마토,아스파라거스,샐러드채소,소금/후추,바질 페스토,올리브오일,발사믹 소스,레몬즙,꿀,소금/후추,발사믹식초,흑설탕,올리고당,치아바타' ,  '1개,2개,1/2개,1/2개,10개,2개,약간,약간,11/2큰술,3큰술,2작은술,1큰술,1작은술,약간,30g,3.6g,3.6g4개' , '애호박은 어슷썰기,파프리카/양파/버섯은 채썰기, 아스파라거스/방울토마토는 3~4등분, 샐러드 야채를 얼음 물에 담가놓으세요,손질한 야채를 기름을 두른 그릴 팬에서 노릇해질 때까지 구워주세요,먼저 발사믹 소스를 만들어야 해요.발사믹 식초를 센 불에 끓여주세요.양이 절반으로 줄어들면 흑설탕, 올리고당을 넣고 중약불에 진득해질 때까지 조립니다,바질 페스토/올리브오일/발사믹 소스/ 레몬즙/꿀/소금과 후춧가루 넣고 섞어줍니다,치아바타 윗면을 2/3 정도 썰어주세요.구운 야채와 샐러드 채소 그리고 드레싱을 섞어주세요.치아바타에 구운 야채를 올려줍니다.'
  , 1500  , '150일'  , '20분이내', '요거요거 정말 간단한데 맛있어요.만드는데 시간도 별로 안걸리고 매우 좋다는 :)', 60 ,51 ,52 ,  sysdate , 1);
    
      
       
 -- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )   
    
   values(class_info_seq.nextval, member_info_seq.currval , '데리야끼 닭가슴살 (데리야끼 치킨) 덮밥 만들기' , 'foodImg_17.jpg'  , 
  '닭가슴살을 꺼내서 덮밥을 만들어보았답니다.닭가슴살은 냉동실에 항상 있는 재료인데 제가 좋아하는 부위는 아니라 자칫 방치해두면 한참뒤에 발견하게되더라구요. 오늘은 퍽퍽한 닭가슴살도 맛있게 즐기실 수 있는 레시피를 알려드릴게요:)' ,'https://tv.naver.com/v/12082071' , '닭가슴살, 밥, 쪽파, 통깨, 소금, 후추,청주, 맛술, 간장,식초, 설탕' ,  '1개, 1공기, 1대, 약간,약간,1TS,1TS,1TS,1TS,1/2TS' , '닭고기는 먹기 좋은 크기로 잘라 소금, 후추에 버무려둔다,쪽파는 송송 썰고 양념 재료는 섞어둔다,달군 팬에 기름을 살짝 두르고 닭가슴살을 넣어 겉면이 하얗게 되도록 굽는다, 섞어둔 양념을 넣고 살짝 걸죽해질 때까지 조린다,릇에 밥을 담고 닭고기를 올린 뒤 팬에 남은 소스를 끼얹는다,쪽파와 통깨를 뿌려 마무리한다', 1000  , '100일'  , '60분이내', '요거요거 정말 간단한데 맛있어요.만드는데 시간도 별로 안걸리고 매우 좋다는 :).주의할 점은 닭을 너무 오래익히면 딱딱해질 수가 있기 때문에 겉면에 색이 바뀌면 바로 양념 넣고 졸여주세요. 살짝 걸죽하게 졸아든 소스가 너무 맛나기 때문에 밥 위에 팬에 남은 소스는 전부 다 꼭! 뿌려주시구요', 90 ,61 ,32 ,  sysdate , 1);
         
         

 -- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )   
    
   values(class_info_seq.nextval, member_info_seq.currval , '구워서 만드는 따끈한 푸딩 <딸기푸딩> 만드는법' , 'foodImg_26.jpg'  , 
  '안녕하세요.이것은 구워서 만드는 푸딩!따끈따끈하게 드실 수도 있고 차갑게 식혀 먹을 수도 있어요.조금은 심심할 수도 있는 푸딩에 푹 익은 딸기가 곁들여져 정말정말 맛있는 푸딩이랍니다.푸딩을 드실 때 딸기를 조금씩 뭉개서 같이 드시면 정말 맛나요.딸기잼이나 프리저브랑은 또 다른 맛!보통 일반적인 푸딩은 중탕으로 구워주는데 이건 중탕 없이 그냥 구워내서 겉면이 보이시는 것 처럼 살짝 갈색빛이 나도록 익는답니다.안에는 일반적인 푸딩과 같은 식감이예요.:)' 
  ,'https://tv.naver.com/v/12003447' , '딸기,달걀,연유,생크림,우유,밀가루,슈거파우더' ,  '100g, 1개, 75g, 50ml, 75ml, 1TS, 취향것' ,
  '볼에 우유, 생크림, 연유, 계란을 넣고 섞은 뒤 밀가루를 넣고 뭉치지 않도록 잘 풀어준다,딸기는 꼭지를 제거한다,오븐용기에 딸기를 올린 뒤 1의 계란물을 부어준다,180도로 예열한 오븐에서 30분간 구워낸 뒤 슈거파우더를 뿌려 마무리한다'
  , 1000  , '50일'  , '2시간이내', '저는 하나로 크게 구워냈는데 작은 라메킨 몇개에 나눠서 구워도 귀여울 것 같아요.요정도 분량이면 한 두분이서 드실 수 있지 않을까 싶네요.아이랑 겨울 간식으로 해드셔도 좋을 것 같요 ^^.굽는 시간은 총 30분으로 적어두었는데 30분 지켜서 굽지 마시고 20분 넘어가면서 부터 중간중간 색을 확인해주세요.아마 20분 정도면 안에는 다 익어있을거라 오븐 사양에 따라서 윗면이 너무 익어 타버릴 수도 있거든요'
  , 80 ,51 ,62 ,  sysdate , 1);
         
         
   

         -- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '<백종원 액젓소불고기> 만들기' , 'foodImg_09.png'  ,  '고기 반찬을 찾다가 눈에 들어온 액젓불고기.신기하게도 액젓맛은 안느껴지는 감칠맛 도는 불고기 탄생.고기에 설탕을 넣고 버무려서 그런가 고기에서 단맛이 느껴졌던 불고기.다른 백종원씨 레시피 처럼 많이 달지는 않지만 입맛에 따라 설탕은 조금 줄여 사용해도 괜찮을 것 같다. 손쉬게 실패없는 불고기 전골을 만들어보고픈 분들께 추천드리는 오늘의 요리.맛있게 해드세요 :)' , 'https://tv.naver.com/embed/1764850?autoPlay=true' , '소고기 불고기감,송송 썬 대파,설탕,액젓,다진마늘,참기름, 양파,버섯(표고버섯, 느타리버섯, 팽이버섯 등 취향것), 물,설탕,다진마늘,간장' ,  '500g,  1주먹 ,4TS , 4TS, 2TS ,  1/2개 ,적당량, 3/4컵 ,  1TS,  1TS,  2TS' ,  '대파는 송송 썰어둔다,불고기용 소고기는 가위를 사용해 먹기 좋은 크기로 잘라둔다,고기에 설탕 4TS를 넣고 조물조물 버무린 뒤 액젓, 다진마늘, 대파 1주먹을 넣고 버무리다 참기름을 넣어 주세요,양파를 채 썰은 뒤 불고기에 넣고 버무린다,볼에 육수 재료를 넣고 섞어요,골냄비에 불고기, 버섯, 대파, 양파 등을 취향에 맞게 올린다,불에 올린 뒤 육수를 부어 끓여낸다.',   1500  , 100,   '60분이내' , '국물 없이 그냥 구워먹으면 무슨 맛일지 매우 궁금한 액젓소불고기어떻게 배도 없고 양파를 갈아 넣은 것도 아닌데 이런 맛이 나는지신기할 따름인 백종원씨표 불고기 황금레시피.설거지에서는 분명 액젓 냄새가 나는데 먹을 때는 거의 액젓 맛을 느낄 수가 없다.고기를 따로 재우지 않아도 재운 것과 같은 깊은 맛이 난다.육수도 물과 간장 등으로 내었는데 멸치육수가 있다면 물 대신 사용할 경우더 깊이있는 맛을 낼 수 있다.', 10 ,31 ,22 ,  sysdate,1);


     
     
   

 -- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '오징어어묵무침 충무김밥' , 'foodImg_33.jpg'  ,  
   '안녕하세요.오늘은 오랜만에 김밥 레시피를 올려보아요.제가 매우 좋아하는 김밥이 바로 충무김밥인데요 아무래도 무 무침 만들기가 번거로워서 집에서 해먹기보다는 나가서 사먹는 메뉴 중 하나였거든요.저 처럼 무 무침 만들기가 부담스러우신 분들을 위한 레시피랍니다.맛있게 해드세요 :)' 
   , 'https://tv.naver.com/v/9428813' , '오징어,사각어묵,밥,김밥용김,참기름,소금,고춧가루,액젓,간장,고추장,올리고당,다진마늘,다진 파,참기름,통깨' ,  '1마리, 1.5장, 2공기, 2장,2TS, 0.1TS,2.5TS, 1TS, 1.5TS, 0.5TS, 3TS, 0.5TS, 2TS, 0.7TS, 0.2TS' 
   ,  '볼에 양념 재료를 섞어둔다,어묵은 납작하게 썰고 끓는 물에 살짝 데친 뒤 찬물에 헹궈 식힌다,오징어는 끓는 물에 데치고 먹기 좋은 크기로 썬다,볼에 물기를 제거한 오징어와 어묵, 양념을 넣고 잘 버무린다,김밥용 김은 6등분으로 자른 뒤 밥을 조금 넣어 말아주고 참기름에 소금을 소량 넣은 참기름장을 만들어 같이낸다.',   
   1500  , 100,   '90분이내' , '충무김밥이 통영의 명물인건 다들 아시죠?통영이 충무로 불리던 시기에 고기잡이를 나가는 남편을 위해 한 아내가 만든 것에서 유래되었다고 해요.일반적인 김밥과 달리 속재료를 따로 담아내기 때문에 쉽게 상하지 않아서 여름철에 해먹기 더 좋은 것 같아요.매콤한 맛으로 정신이 번쩍 들었던 아침.간편한 방법으로 맛있게 해드세요 ^^', 
   10 ,11 ,62 ,  sysdate,1);
      
         
         
         
         
         
         
         
         
         
         
         
         



/*     ==========   2   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'12345','12345','김한식','김한식','9011230523200','ab3c1@13d23v2er.com',12312225999,sysdate,'photo_02.png','쉐프',10);


-- 클래스 승인 대기 데이터 --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )
       
   values(class_info_seq.nextval, member_info_seq.currval , '인기요리 쿠지라이식 라면 만들기' , 'foodImg_01.png'  , 
  '요즘 SNS에서 핫 한 요리라고 이밥차에서 알려주었는데 넘나도 처음 보는 레시피.이름도 신기한 쿠지라이식 라면을 만들어 보았다.찾아보니 이 라면은 목요일의 플루트라는 일본 만화에서 등장한 라면이라고 한다.분명 일반 라면으로 끓였는데 국물이 없는 라면.그렇다고 볶음면은 또 아니고 볶음면과 일반 라면의 중간 어딘가에 있는 라면,궁극의 라면 레시피이니 집에 라면이 있으시다면 지금 바로 따라해드셔보세요 :)' ,'https://tv.naver.com/embed/1992437?autoPlay=true' 
  , '짬뽕라면 또는 매운 라면,물,계란,슬라이스 치즈,통깨,송송 썬 쪽파,김가루' ,  '1봉,2컵,1개,1/2장,조금,조금,조금' , '물 2컵에 라면 스프 1/2봉을 넣고 끓인다,물이 끓어오르면 면과 후레이크를 넣고 중간중간 젓가락으로 저어가며 물이 반 정도로 졸아들 때 까지 끓인다, 팬 가운데에 홈을 내어 계란을 깨뜨려 넣고 쪽파를 뿌린 뒤 뚜껑을 닫아 반숙으로 익힌다,불에서 내린 뒤 슬라이스 치즈 1/2장과 김가루, 통깨를 뿌려 마무리 한다.', 500  , '50일'  , '10분이내'
  , '볶음면 스타일인 줄 알고 국도 꺼냈는데 국물이 없는게 아니라 국은 별로 필요없는 것 같다.오징어 짬뽕 라면으로 맛있게 해먹었는데 다른 라면으로는 또 무슨 맛이 날까 매우 궁금하다는...SNS에서 인기몰이 중인 레시피는 왠만하면 실시간으로 해먹어보는데  이건 왜 이제야 알게된 것인지...?!?!라면은 최근에 거의 안먹었는데 백종원씨의 집밥 백선생 라면 편과 이밥차 9월호 (라면이 요리라면) 덕에 하루 건너 하루 끓여먹고 있는 것 같다.', 
  30 ,11 ,62 ,  sysdate , 0);
         




-- 클래스 승인 대기 데이터 --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '딸기바나나토스트/샌드위치 만들기' , 'foodImg_02.png', 
                          '오늘은 딸기철이 지나가기 전에 꼭 해드셔야 할 예쁘도고 맛있는 요리를 하나 소개해드려요.이전에 티 샌드위치라고 포스팅해드렸던 적이 있는데 약간 변형된 딸기 바나나, 딸바 토스트 또는 샌드위치 :).구운빵은 아니니 샌드위치라고 말하는게 더 맞을 것도 같아 보이네요. 재료도 간단하니 맛있는 샌드위치. 딸기철 지난 후에 후회하지 말고 지금 당장 해드셔보셔용 :)' 
                          , 'https://tv.naver.com/embed/2596306?autoPlay=true' , '딸기, 바나나, 식빵, 초코스프레드', '2-3개,1개,1장,1-2TS' ,'딸기와 바나나는 같은 두께로 슬라이스 한다,식빵 위에 초코스프레드를 빈틈없이 바른다,슬라이스 한 딸기와 바나나를 최대한 공간을 남기지 않고 붙여준다,테두리를 잘라내고 먹기 좋은 크기로 잘라낸다.'
                          , 500  , 100,  '10분이내' ,'정말 10분이면 만드는 초간단요리.다가올 발렌타인데이 대비용 간단 요리로도 좋은 오늘의 요리 꼭 딸기와 바나나가 아니어도 좋으니 좋아하는 과일 활용하셔서 다양한 색으로 맛있게 만들어보셔용 ^^',
                          
                          70 ,51 ,62 ,  sysdate,0);
              
                     
                     
                     

-- 클래스 데이터 --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '굽지 않고 만드는 레어치즈케이크' , 'foodImg_19.jpg'  , 
   '베리젤리를 넣어 만든 찐한 치즈케이크 레시피!오븐이 없어서 엄두가 안나는 홈베이킹 걱정을 타파!베리젤리가 아니여도 다양한 젤리를 넣어 만들어도 좋아요:)' , 'https://www.youtube.com/embed/jNy35qNEjQk' , '다이제,녹인 무염버터,크림치즈,플레인요거트,생크림,레몬즙,판젤라틴,라즈베리퓨레,딸기퓨레,설탕,레몬즙,판젤라틴', '6개,25g,200g,설탕 80g,100g,200g,2큰술, 7g,60g,  60g,  20g,  5g,  5g' ,
   '다이제는 잘게 부숴 녹인 버터를 넣고 잘 섞는다,틀에 쿠키반죽을 넣고 스푼이나 손으로 꾹꾹 눌러 바닥을 만든 후 냉장고에 넣어 굳힌다,볼에 얼음물을 준비하고 판젤라틴을 한장씩 넣고 불린다,볼에 크림치즈를 넣고 거품기로 가볍게 풀고 설탕을 넣고 섞는다,플레인요거트와 생크림을 넣고 섞는다,얼음물에 불린 젤라틴을 건져 물기를 짜고 물 2T를 넣고 중탕으로 녹인다,크림치즈 반죽에 녹인 젤라틴을 넣고 섞는다,쿠키를 깐 틀에 크림치즈 반죽을 1/2을 채우고 굳힌 베리 젤리를 중앙에 넣어준다,그 위에 나머지 크림 치즈 반죽을 부어주고 윗면을 평평하게 정리 후 냉장고에 넣어 2시간 이상 굳힌다,굳힌 치즈케이크는 뜨거운 물을 적신 행주 등으로 틀 주변을 감싸 열을 준 후 틀을 분리한다,케이크를 접시에 옮겨 완성한다.'
   , 1000  , '200',  '60분이내' ,'[팁!][미리준비하기]1>크림치즈는 실온에 둔다.2>무염버터는 녹여 준비한다.3>얼음물 준비한다.4>12cm 원형링 랩 한쪽면에 랩을 씌워 준비한다.[도구준비하기]볼/ 체/ 실리콘주걱/ 1호 원형틀(15cm 높이 7cm)/ 거품기/ 12cm원형링/ 랩'
   ,80 ,51 ,62 ,  sysdate,1);
                
                

-- 클래스 데이터 --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '에어프라어 통닭구이' , 'foodImg_21.jpg'  , 
   ' 통닭구이 만드는법 을 알려드리도록 할게요. 에어프라이어가 있으시다면 누구나 한번쯤은 해 먹어봤을법한 치킨요리!!보통 그냥 절단육을 사와서 소금 후추 뿌리고 돌려서 먹잖아요 그런데 전 이날 생닭 한마리를 몽땅 넣었네요.)' ,
   'https://www.youtube.com/embed/hEkTDP7cSnk' , '생닭,소금,후추,파프리카 색깔별로,감자,당근,양송이 버섯', '1마리,조금,조금,1/3개씩,1/2개,1/2개,조금' ,
   '먼저 생닭을 깨끗하게 씻어주세요,소금과 후추를 뿌려주세요.이때 닭을 앞뒤로 뒤집어 가면서 뿌려주세요,1차 180도에서 25분 돌려주시고요 그리고 뒤집어서 다시 25분!!기름이 너무 많이 나오면 중간에 종이 호일은 한번 갈아주세요. 그 다음 마지막으로 같은 온도 180도에서 10분만 돌려주면 바삭하고 맛있는 통닭구이가 완성된답니다.'
   , 3000  , '200',  '60분이내' ,'[팁!]에어프라이어에 먼저 종이 호일을 한장 깔아주면 설거지하기 편하답니다:)'
   ,90 ,11 ,32 ,  sysdate,1);
                          




-- 클래스 데이터 --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '간단한 두부반찬 <김치 연두부냉채> 만드는법' , 'foodImg_27.jpg'  , 
   '안녕하세요~~오늘은 정말이지 간단하고도 간단한 반찬 레시피를 하나 알려드릴게요.야채라곤 질색팔색하는 초딩입맛의 남편이 매우 좋아했던 반찬이라 반찬고민하시는 분들께 강추드리는 레시피랍니다.저도 큰 기대를 안하고 만들어서 그런지 더 맛있었던 것 같아요 ㅋㅋ이제까지 연두부로 해먹은 요리 중에 마파두부를 제외하고는 탑이 아닐까 싶어요 :)' ,
   'https://tv.naver.com/v/10769167' , '연두부,다진 김치, 참기름,쪽파,통깨,간장,맛술,설탕', '1/2개 또는 작은 것 1개, 2TS,조금, 조금, 조금,0.5TS, 0.5TS, 0.5ts' ,
   '볼에 양념 재료를 넣고 섞어둔다,김치는 잘게 다지고 쪽파는 송송 썬다,접시에 연두부를 담고 김치를 올린 뒤 섞어둔 양념을 가장자리에 뿌린다,쪽파와 통깨를 뿌린 뒤 참기름을 조금 뿌려 마무리한다.'
   , 1000  , '50',  '5분이내' ,'5분이면 만들 수 있는 초간단 반찬.차갑게 먹을 수록 더 맛있어요~손님 초대용으로 만드실 경우 접시에 두부, 김치, 쪽파까지는 담아서 냉장보관하셨다가 내기 전에 소스랑 통깨 뿌려내시면 좋을 것 같아요:)'
   ,70 ,41 ,62 ,  sysdate,1);
                          
                          
                          
                          
                          




/*     ==========   3   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'111','111','백밥','백주부','9121235223200','ab3c1@13s323v2er.com',12312209999,sysdate,'photo_03.png','쉐프',30);



-- 클래스 승인 대기 데이터 --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '버섯을 넣어 구수한 <들깨 순두부찌개> 만들기' , 'foodImg_03.png'  , 
                          ' 들깨를 넣어 끓여 본 맑은 느낌의 순두부찌개.살짝 칼칼하게 드시고 싶으신 분들은 청양고추 조금 썰어넣어도 매우 맛있을 것 같다.재료는 많이 필요하지 않지만 국물 때문인지 왠지 먹고나면 보양식 먹은 기분이 드는 들깨 순두부찌개.찌개 끓이기 날씨가 조금 덥긴 하지만 그래도 맛은 있으니 기력이 허하신 분들께 들깨 순두부찌개를 추천 드려용 :)' , 'https://tv.naver.com/embed/1788324?autoPlay=true' , '물,다시마,물용 멸치,순두부,양파,버섯,대파,청양고추,들깨가루,찹쌀가루 + 물,국간장,다진마늘' ,  '3컵,8*8cm 1장,10마리,1봉,1/2개,2-3줌,1/2대 , 1개 (옵션),4TS,1TS+(물) 2-3TS,1TS,0.5TS' ,  '딸기와 바나나는 같은 두께로 슬라이스 한다,식빵 위에 초코스프레드를 빈틈없이 바른다,슬라이스 한 딸기와 바나나를 최대한 공간을 남기지 않고 붙여준다,테두리를 잘라내고 먹기 좋은 크기로 잘라낸다.',  500  ,  150, '30분이내' ,'보통 들깨 드러간 국은 맑게 먹는 편인데 진득한 느낌의 국이 먹고 싶어서 찹쌀가루를 개어서 넣어주었다.기호에 따라서 찹쌀가루는 넣어도 되고 빼고 되긴 하지만 넣을 경우 꼭 물에 개어서 넣어야지 아니면 한덩이로 다 뭉쳐버릴 수도 있다', 10 ,21 ,52 ,  sysdate,0);
            
            
                        

-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
 values(class_info_seq.nextval, member_info_seq.currval , '플라워 아이스볼 꽃얼음 만들기' , 'foodImg_15.png'  ,   '안녕하세요. 오늘은 조금 재미난 요리를 소개해볼게요.. 식용 꽃으로 뭘 해먹을까 고민하다가 만들은 <플라워 아이스볼>.아이스볼 메이커에 식용꽃을 넣고 얼려주시면 되는 초간단한 요리..?랍니다.맛있게 해드세요 :)' , 'https://tv.naver.com/v/14630653' , '찬물, 식용꽃, 실리콘 아이스볼 몰드, 작은 볼과 접시, 집게' ,  ' 적당량,  해먹을만큼,  식용꽃양만큼,  예쁜그릇준비!,  집게준비!' , '사용할만한 식용 꽃을 골라낸 뒤 줄기와 잎을 정리한다,찬물에 꽃을 넣고 집게로 흔들어가며 헹군다,아이스볼 몰드에 물을 담는다, 식용 꽃을 섞어가며 올린다,실리콘 몰드의 뚜껑을 덮고 물을 채워넣는다,몰드의 뚜껑을 벗겨낸 뒤 실온에 잠시두어 성에를 녹여낸다.', 1000   , '100,'  , '60분이내','입맛없을 때 꽃얼음과 함께 해드시기 좋은 것 같아요 :).제가 사용한 틀은 비스바바 실리콘 몰드이고 생각보다 실리콘도 단단하고 다른 몰드보다 물 넣는 구멍이 커서 얼음 만들기가 쉬운 것 같아요. :)', 90 ,61 ,62 ,  sysdate,1);




-- 클래스 승인 대기 데이터 --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '육회/육회비빔밥 만들기' , 'foodImg_22.jpg'  , 
   
   '이제 진짜 초가을인가봐요.어느새 아침 저녁으로는 시원한 바람이 제법 기분을 좋게만든답니다.저희집에 수험생이 있는데요.그 수험생이 몇달전부터 노래부르던 요리가 있어요.바로 육회비빔밥인데요. 마침 저도 육회가 먹고싶었던 터라 만들게 되었답니다.육회를 만들때 더 맛있게 만드는 팁도 설명드릴께요.그리고 육회를 만들고 남은건 육회비빔밥으로 했는데 정말 꿀맛이더라구요.온가족이 만족하면서 푸짐하게 먹은 육회와 육회비빔밥 만들기 시작할께요. ' 
   , 'https://www.youtube.com/embed/2WVTNv-T8WA' , '우둔살,배,무순,달걀 노른자,구운소금,설탕,참기름,고추기름,백후추,다진 마늘,다진 파,육회,상추,어린잎 채소,무순,고추장,올리고당,매실청,간장,참기름' ,  
   '400g,1/2개,약간,1개,1T, 30g,1.5T,0.5t,약간,0.5T,0.5T,약간,3장,약간,약간,3T,2T,1T,1T,1T' , 
   '먼저 정육점에서 우둔살이나 홍두께살을 육회용으로 썰어오세요.고기 400g은 키친타월에서 핏물을 제거해주세요,구운소금/설탕/참기름/고추기름을 넣어주세요,비닐팩에 넣고 냉장실에서 2시간정도 두시면 더욱 좋아요.아니면 냉동실에서 30분간 두시면 더 시원하고 맛있게 드실수 있답니다,이제 배를 채썰어주세요,배를 깔고 그 위에 육회를 올리고 맨윗부분은 편평하게 하셔야 노른자를 올릴때 좋아요.노른자를 올리고 무순으로 장식하면 맛있는 육회끝,상추와 어린잎 무순은 깨끗이 씻어서 물기를 제거해주세요,이제 상추는 먹기좋은 크기로 썰어주세요,고추장 양념을 만들어 줄께요. 고추장/,올리고당/매실청/간장/참기름 을넣고 잘 섞어주세요,그릇에 밥을 넣고 그 위에 야채를 올려주세요.가운데 부분에 육회를 담고 그 옆부분에 고추장을 넣어주세요.마지막으로 노른자를 올리면 육회비빔밥 완성이랍니다.',
   2000  ,  100, '60분이내' 
   ,'육회 양념이 잘배게 하는 방법은 바로 구운소금이랍니다.입자가 고와 양념이 잘 배는 특성이 있어요. 마지막으로 고추기름을 넣으면 깔끔한 칼칼한맛이 더 좋아져요.'
   , 10 ,21 ,22 ,  sysdate,0);
           

-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
 values(class_info_seq.nextval, member_info_seq.currval , '조개찜 <크리미 조개 스튜> 만들기' , 'foodImg_23.jpg'  ,  
 '요리를 이제 몇 년 해오다보니 잘 못하면 망할 수 있는 요리와 절대 망하지 않을 요리를 구분할 수 있는데 일단 조개가 주가 되는 레시피는 실패할 확률이 0.000001% 정도라고 보면 된다. 고로 이 레시피는 그대로 따라하면 절대 실패하지 않을 레시피.메인으로도 좋고 사이드로도 좋고 술안주로 단독으로 먹어도 좋은 요리.조개 좋아하시는 분들은 조개만 먹어도 맛있고 국물 좋아하시는 분들은 국물만 떠먹어도 맛있고둘 다 별로라면 빵을 찍어 먹어도 정말 맛있다.크림 스튜이지만 크림의 양이 그렇게 많이 들어가지 않고 레몬즙이 들어가 느끼함은 싹 잡아주는 레시피 :)' 
 , 'https://tv.naver.com/v/2515725' 
 , '백합, 바지락 등의 조개,버터,다진 마늘,송송 썬 쪽파,화이트 와인,치킨스탁,레몬즙,생크림,다진 파슬리' ,  ' 500-600g,  1.5TS,  2TS,2TS,  3/4컵,  3/4컵, 3/4TS,  4TS,  조금' ,
 '조개는 소금물에 넣어 해감한다,냄비를 달구고 버터 1TS를 넣고 녹인 뒤 다진마늘과 송송 썬 쪽파를 넣고 볶아 향을낸다, 조개를 넣고 약 5분간 볶는다,화이트와인과 치킨스탁을 넣고 끓여올린 뒤 불을 줄이고 조개가 모두 입을 벌릴 때 까지 끓인다,불에서 내린 뒤 레몬즙, 버터 0.5TS, 크림을 넣고 섞는다,다진 파슬리를 뿌려 낸다.'
 , 1500   , 100  , '2시간이내','취중에 만들었는데도 넘나 판타스틱 했던 조개스튜.서양요리지만 조개찜 비스무리한 맛이라 평소에 크림 요리나 서양음식을 별로 안좋아하시는 분들이라도 부담없이 드실 수 있을거예요.',
 20 ,21 ,42 ,  sysdate,1);



insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'2222','2222','댕댕이','댕댕댕','9132230225200','ab32c1@23s323v2er.com',12322355999,sysdate,'photo_04.jpg','쉐프',40);



-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime, admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '새콤달콤 맛있는 중국식 닭고기요리 <유린기> 만들기' , 'foodImg_04.png'  , '유린기는 중국식 닭고기 요리, 정확히는 닭튀김요리이다. 직역하면 기름을 뿌린 닭고기라고 하는데,닭고기에 전분을 입혀 바삭하게 튀겨낸 뒤 양상추/ 고추/ 새콤한 소스와 함께 곁들여 먹는 요리.집에서 만들어 먹기에도 부담스럽지 않고 바삭한 튀김과 새콤한 소스가 어우러지는 맛이 일품이라
우리 입맞에도 딱 맞는 닭 요리. 레몬과 식초가 들어간 소스의 맛이 입맛 돌리기에도 최고라 샐러드 처럼 먹어도 좋고 메인 요리로 내기에도 좋다. 며칠 빈곤한 저녁 밥상을 받아먹다 갑자기 메뉴가 업그레이드되니 매우 좋아했던 남편 ㅎㅎ간만에 식탁에 힘주고픈 분들께 추천 드리는 유린기. 맛있게 해드세용 :)' , 'https://tv.naver.com/embed/2164811?autoPlay=true' , '닭다리살,꽈리고추,청양고추,홍고추,양상추,전분가루, 간장,간 생강,청주,소금,후추,대파 흰 부분, 레몬 슬라이스, 간장,식초,설탕,물' ,  '300g,6개,2개,1개,3장, 2/3컵,1/2TS,1/3ts,1TS,약간,1대,1장,3TS,2⅔TS,2TS,2TS' , '파와 고추는 송송 썰어 준비한다,작은 볼에 닭고기 양념재료를 섞은 뒤 닭에 넣고 버무려둔다,볼에 소스 재료를 넣고 섞어 소스를 만든다,닭고기에 전분가루를 입힌 뒤 스며들도록 잠시 둔다,후라이팬에 기름을 달궈 4의 닭고기를 넣어 앞 뒤로 노란색이 나도록 튀긴다,1차로 튀긴 닭은 기름망에 올려 잠시 식혔다가 온도를 높인 기름에 넣어 다시 한 번 노릇하게 튀겨낸다,접시에 손으로 양상추를 뜯어 올린다,그 위에 썰은 닭고기, 꽈리고추, 청양고추, 홍고추 순으로 올리고 소스를 뿌려 마무리 한다', 3000  , 50,  '90분이내', '보통 들깨 드러간 국은 맑게 먹는 편인데 진득한 느낌의 국이 먹고 싶어서 찹쌀가루를 개어서 넣어주었다.기호에 따라서 찹쌀가루는 넣어도 되고 빼고 되긴 하지만 넣을 경우 꼭 물에 개어서 넣어야지 아니면 한덩이로 다 뭉쳐버릴 수도 있다', 40 ,21 ,32 ,  sysdate,1);
                          



-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime, admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '토마토 돼지갈비스튜' , 'foodImg_24.png'  , '갈비소스와 토마토소스로 만든 스튜!스튜는 주물냄비나 두꺼운 냄비로 만들어야속까지 촉촉하고 부드럽게 만들수 있어요!' 
   , 'https://www.youtube.com/embed/k8H3vUNxB_c' , '돼지갈비,마늘,샐러리,당근,감자,양파,홀토마토,갈비양념,물,베트남고추,청주,식용유,소금,후추,파마산치즈가루' ,  '600g,10톨,1대,1/2개,1개,1/2개,1+1/2종이컵,1종이컵,1종이컵,4개,2숟가락,약간,약간,약간,1/2종이컵' 
   , '돼지갈비는 찬물에 담가 핏물을 제거한다,끓는 물에 청주 2숟가락을 넣고 데쳐 찬물에 헹군다,마늘 3톨은 으깨고, 당근, 감자는 먹기 좋은 크기로 썬다,양파는 굵게 다진다,냄비에 식용유를 두르고 돼지갈비를 넣고 겉면만 노릇하게 굽는다,으깬 마늘, 다진 양파, 당근, 감자, 베트남고추, 샐러리를 넣고 볶는다,홀토마토, 갈비양념, 물 1종이컵을 넣고 끓인다,갈비스튜가 익을 동안 팬에 식용유를 넉넉히 두르고 통마늘을 노릇하게 약 불로 익힌다,스튜가 완성되면 통마늘, 파마산치즈을 얹어 뚜껑을 닫아 치즈를 살짝 녹인다,후추를 뿌려 완성한다.',
   1500  , 100,  '60분이내', '[팁]!홀 토마토 대신 토마토소스를 사용할 경우 2/3종이컵으로 분량을 줄여주세요', 20 ,31 ,12 ,  sysdate,1);
                          





-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime, admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '20분 완성! 쌀국수 만들기' , 'foodImg_32.jpg'  , '올해부터 구독하기 시작한 BBC 굿푸드 잡지에 나와있던 아주쉽다는 쌀국수 레시피.면도 버미셀리에 고기는 다짐육이라 정말 쌀국수가 되려나 의문스러웠는데, 생각했던 맛과는 조금 다르긴 했지만 정말로 쌀국수가 완성되었다' 
   , 'https://tv.naver.com/v/2792941' , '버미셀리,소고기 다짐육, 표고버섯,쪽파,다진 고수잎,간장,비프 스탁,홍고추,스타아니스 (팔각) ,참기름' ,  '50g, 100g,1-2개, 1대,1TS, 4ts, 350ml, 1/2개,1개, 조금' 
   , '냄비에 물을 끓인 뒤 불을 끄고 버미셀리를 넣어 3분간 불린다,면은 찬물에 헹구고 체에 받쳐 물기를 제거한 뒤 참기름 몇방울을 넣어 버무려둔다,소고기는 간장 1ts를 넣고 섞어둔다,홍고추는 어슷 썰고 버섯은 슬라이스 하고 쪽파는 길게 썰어둔다,비프스탁에 홍고추와 팔각을 넣고 끓여 육수를 만는다,기름을 살짝 두른 팬에 밑간한 소고기를 넣어 주걱으로 으깨어가며 볶다가 버섯을 넣고 볶는다,볼에 면과 길게 썬 쪽파, 다진 고수, 간장 3ts, 후추를 넣은 뒤 육수와 고추를 부어준다,볶은 고기와 버섯을 넣어 마무리 한다',
   3000  , 50,  '20분이내', '비프스탁은 액상 스탁을 사용했는데 이전엔 치킨스탁이고 비프스탁이고,구하기도 힘들고 고형이라 사용하기도 힘들었는데,이제는 액상으로 나와서 물에 원하는 농도로 넣어 만들 수 있으니 넘나 편한 것!브랜드별로 2-3 종류는 있는 것 같으니 다음에 마트갈 때 조미료 코너를 잘 찾아보셔요 :)',
   50 ,41 ,62 ,  sysdate,1);
                          




/*     ==========   4   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'321','321','쉐프고영희','고영고영','9123215223200','ab331@13s1323v2er.com',12342201999,sysdate,'photo_05.jpg','쉐프',10);



-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , ' <해선장소스 삼겹살구이 덮밥>만들기' , 'foodImg_05.png'  , 
                          '대표적인 중국 소스 중 하나인 해선장 소스를 발라서 삼겹살을 재운 뒤에 오븐에 굽고 청경채와 함께 내는 요리인데 색감이 예뻐서 그럴싸한 한그릇 요리로 최고이다. 그냥 고기만 구워먹는 것 보다 기름도 덜 한 것 같고 야채가 있으니 건강식을 먹는 것 같은 느낌마저 드는 요리. 고기 양념에 들어가는 해선장 소스는 영어로 hoisin 이라고 부르는데 약간 달달하면서 짭쪼름하기도 하고 부드럽고 단 버전의 춘장같은 느낌이다. ' ,'https://tv.naver.com/embed/2158819?autoPlay=true' , '삼겹살,청경채,물,마늘,홍고추,밥,통깨,고수잎,참기름,해선장 소스,간장,갈은 생강' ,  '350g,2개,1/2컵,2개,1/2개,2공기,조금,취향것,1/2TS,4TS,1TS,1ts' ,'볼에 고기 양념 재료를 넣고 섞어둔다,삼겹살에 소스를 앞 뒤로 발라 최소 3시간 이상-하루 재운다,2를 오븐용기에 담고 190도로 예열한 오븐에 넣어 중간에 한 번 뒤집어가며 25-30분 가량 익힌다,청경채는 1/2-1/4등분으로 자르고 마늘은 편 썬다,작은 팬에 청경채와 마늘, 물을 넣고 3-4분 가량 끓여 익힌다,접시에 밥을 담고 그 위에 구운 삼겹살을 썰어 올린 뒤 청경채, 마늘을 올리고 송송 썰은 홍고추, 고수잎으로 장식한 뒤 통깨를 뿌려 낸다.',  2000  ,  200,  '60분이내'  , '해외 블로그 레시피를 참고했는데 원 레시피에 있던대로 구우니 좀 타는 듯 해서 굽는 시간을 조금 조절해서 적어두었다. 우리집 오븐의 경우 190도에서 한 25분이면 다 구워지는 듯 또한 원 레시피에는 그냥 호일깔고 구우라 되어있지만 그렇게 하니 고기가 조금 마르는 경향이 있어서 남은 소스와 함께 오븐용기에 담아서 구우니 더 맛있게 구워졌다. 홍고추와 고수는 없다면 생략해도 상관은 없는데 고수가 들어가면 맛이 확 달라져서 드실 수 있는 분이시라면 추천 드린다.', 50 ,11 ,12 ,  sysdate,1);




-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '완전 쉬운 닭볶음탕 만들기 <압력솥닭다리살볶음탕> 레시피' , 'foodImg_28.jpg'  , 
   '오늘은 저녁에 바로 해드실 수 있는 만만한 한식 레시피 하나를 알려드릴게요.이 닭볶음탕을 만들기 위해서 필요한 것이 하나 있는데요.그건 바로 압력솥!물이 많이 들어가지 않더라도 그리고 오래 익히지 않아도 야채와 고기가 푹 익어요.특히나 설탕은 하나도 들어가지 않았는데 양파 때문인지 달큰하니 맛있답니다.개인적으로 닭은 허벅지살을 가장 좋아하는데 이건 다리살로만 만들어서 더 좋아요.그치만 원하시는 다른 부위가 있다면 활용하셔도 상관 없어요' 
   ,'https://tv.naver.com/v/5585452' , '닭다리살,감자,양파,당근,파,물,고추장,고춧가루,다진마늘' ,  '4,1개,1/2개,1/2개,1대,1/2컵,2TS, 1ts,간장 1/2ts, 1ts' 
   ,'양념재료는 미리 섞어둔다,야채는 큼직하게 썰고 대파는 5cm 길이로 썰고 닭다리살은 4등분한다,압력솥에 닭과 야채를 넣고 양념을 끼얹은 뒤 뒤적인다,뚜껑을 덮고 중-강 불에서 끓이다 추가 울리면 약불로 낮춰 15분간 끓인다,뜸을 들인 뒤 뚜껑을 연다.'
   ,  1500  ,  100,  '2시간이내'  , '야채랑 닭 손질 이후로는 불 킨 것 빼곤 손하나 까딱하지 않고 요리를 완성했어요.밥솥이 있으시다면 밥솥으로 하셔도 괜찮을 것 같네요.'
   , 10 ,11 ,32 ,  sysdate,1);





-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '<쇼가야키동/쇼가야끼동> 만드는 법' , 'foodImg_30.jpg'  , 
  '대패 삼겹살을 사용해 간단하게 만들 수 있는 일본식 돼지고기 덮밥.쇼가야키동을 만들어보았어요.일본말로 쇼가는 생강을 뜻한다고 해요.야끼는 굽는다는 뜻을 가지고 있구요.돼지고기를 생강섞인 양념에 굽는 요리인데 이 요리느 덮밥이 되었지만 일반적인 쇼가야키는 밥 없이 고기만 나와요.이것은 밥 위에 올라갔으니 쇼가야키 <동 (돈부리)> 가 되었답니다. 맛있게 해드세요 :)'
  ,'https://tv.naver.com/v/4305249' , '밥,대패삼겹살 또는 돼지고기 앞다릿살,양파,양상추,청주,간장,설탕,미소된장,다진 생강,생강가루,후춧가루' ,   '1공기, 100g, 1/2개, 3장, 1TS, 1/2TS, 1ts, 1ts,1/4ts , 조금,  조금' ,
  '양파와 양상추는 채 썬다,양념 재료는 미리 섞어둔 뒤 돼지고기에 넣어 버무린다,달군 팬에 기름을 두르고 양파를 볶는다,돼지고기를 넣고 고기가 익을 때 까지 같이 볶는다,접시에 밥을 담고 양상추와 고기를 올려 마무리 한다.'
  ,  1000  ,  100,  '60분이내'  , '원 레시피에는 생강이 다져서 들어가는데 저는 생강가루를 사용했어요.생강이 양념 일부로 들어가는 레시피에는 생강 대신 가루 사용해도 괜찮더라구요.조금씩 팔지도 않고 아무래도 집에 계속 가지고 있기가 힘든 재료 중 하나라 저희 집 냉장고에는 있을 때 보다 없을 때가 더 많은 것 같은데 가루로 사용하니 매우 편해요.둘 다 없으시면 빼셔도 되지만 그러면 쇼가야키동이 아니니 넣으실 것을 추천드려요 ㅎㅎ.반찬 고민하지 말고 간단하게 맛있는 덮밥 한그릇 해드세요 ^^'
  , 30 ,11 ,12 ,  sysdate,1);







-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '은은한 파의 향기가 좋은 <중국식 도미찜 (aka. 잘자어)> 만들기' , 'foodImg_31.jpg'  , 
  '오늘의 요리는 정말정말 맛있는 생선 요리.아마 생선 좋아하지 않는 분들도 맛있게 드실 수 있지 않을까 싶다.간장 소스로 만드는 중국식 생선요리인 이 요리는 이전에 성시경씨가 방송에서<잘자어>라는 이름으로 만드셔서 아마 많이들 해드셔보셨을 수도 있을 것 같다. 맛있게 해드세요 :)'
  ,'https://tv.naver.com/v/2248735' , '대파,도미,편 썰은 생강,식용유,간장,물,청주,설탕' ,   '2대,  1마리,  5-6조각,  4TS,4TS,  3TS,  2TS,  1TS' ,
  '대파 흰 부분은 채 썰고 푸른 부분은 큼직하게 썰어둔다,생강은 껍질을 벗기고 편 썬다,생선은 배를 갈라 내장을 제거하고 칼집을 낸 뒤 파의 푸른 부분과 생강을 뱃속에 채운다,찜통에 남은 대파 푸른부분을 깔고 그 위에 도미를 올려 20-25분간 쪄낸다,소스팬에 양념 재료를 넣고 설탕이 녹도록 끓인다,찐 도미 안에 들은 파와 생강을 제거한 뒤 접시에 올리고 파채의 반을 올린다,끓인 소스를 부은 뒤 남은 파채를 올리고 뜨겁게 달군 식용유를 뿌려 마무리 한다'
  ,  2000  ,  200,  '90분이내'  , 'Steamed Sea bass in soy sauce 이런 이름으로 해외에 있는 대부분의 중식 레스토랑에서는 찾아볼 수 있는 요리라 혹시 해외 여행 중에 중국 음식점을 가게되시는 분들이 계시다면 시켜서 실패 안하는 메뉴 중 하나이니 강추 ㅎㅎ'
  , 40 ,21 ,42 ,  sysdate,1);




/*     ==========   5   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'4321','4321','도치도치','치치치','3121225223200','ab331@15s1323v2er.com',12344205999,sysdate,'photo_06.png','쉐프',20);


  
-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '리코타치즈샐러드 <리스샐러드> 만들기' , 'foodImg_06.png'  , 
                          '매년 연말에 열심히 해먹는 요리 중 하나인데 이제까지 레시피를 올려드린 적이 없어 부랴부랴 정리해 올리는 오늘의 요리. 간단하지만 식탁 분위기를 확 살리는 샐러드랍니다. 아마 많이들 보셨을 수도 있는데 이 샐러드의 이름은 리스 샐러드. 동그랑 O형 모양의 화관인 리스와 비슷한 모양이라 리스 샐러드라고 불리우는데 일반 리코타 치즈 샐러드와 들어가는 재료는 같지만 모양은 한 20배 더 예뻐요.' , 'https://tv.naver.com/embed/2532656?autoPlay=true' , '베이비 채소, 칼라 방울토마토, 아몬드 슬라이스, 리코타치즈,발사믹 식초 ,꿀,디종머스터드,올리브오일,소금, 후추' , '적당량, 적당량,적당량,적당량, 1TS,  1/2TS,  1/2ts,  1.5TS,  약간' , '볼에 드레싱 재료를 섞어둔다,방울 토마토는 슬라이스 한다,접시에 베이비 채소를 가운데가 빈 원형으로 둘러 담는다,슬라이스 한 방울토마토를 듬성듬성 올린다, 치즈와 아몬드 슬라이스를 뿌리고 드레싱과 함께 낸다.',   1000   , 50, '15분이내','방울토마토는 빨간것으로만 사용해도 되긴 하지만 이렇게 칼라로 사용하시면 더 예뻐요. 일반 샐러드용 채소 말고 베이비 채소 사용하시는게 더 좋구요. 프리제라는 곱슬곱슬한 샐러드 풀을 사용해도 예쁘답니다.',60 ,41 ,52 ,  sysdate,1);



      
        
        -- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '제철맞은 바지락으로 만드는 요리 <봉골레 파스타> 만들기' , 'foodImg_08.png'  , 
                          '오늘은 파스타 요리 중에서도 아마 가장 맛 내기가 쉬운 봉골레 파스타 만드는 법을 알려드려요. 이태리어로 vongole는 조개를 뜻하고 따라서 spaghetti alle vongole는 조개 스파게티를 말해요.
올리브오일 베이스 파스타 종류로는 아마 가장~ 유명하지 않을까 싶은 요리. 일단 조개가 들어가면 육수에서 어느정도 맛이 우러나오기 때문에 맛이 없기가 힘들어요. 집에 스파게티 면이 없고 얇은 링귀니 비슷한게 있어서 사용했는데 개인적으로 이 파스타는 짧은 것 보다는 긴 것이 어울리고 넓은 면 보다는 얇은 면이 더 잘 어울리는 것 같아요.' , 'https://tv.naver.com/embed/2671154?autoPlay=true' , '링귀니,조개,페퍼론치노,마늘,화이트와인,파슬리가루,또는 다진 생 파슬리 ,소금, 후추' ,  '80g,  200g,  3개,  2-3개,  1/4컵, 1/2ts 1/2TS, 약간' , '마늘은 편 썰고 조개는 해감해 준비한다 ,끓는 물에 소금을 넣고 링귀니를 봉지에 적힌 조리시간에서 1분 덜 조리한다,달군 팬에 올리브오일을 두르고 편 썰은 마늘을 넣어 볶다가 페퍼론치노를 넣고 같이 볶는다,조개를 넣고 뒤적인 뒤 화이트와인을 넣고 덮어 조개가 입을 벌릴 때 까지 끓인다
,삶은 면을 넣고 소스가 베도록 뒤섞어준다가 파슬리를 넣고 소금, 후추로 간한다. ※ 면수를 조금씩 추가해가며 끓여준다,마지막에 올리브오일을 살짝 둘러넣어 버무린 뒤 접시에 담아낸다.',  3000   , 200  , '90분이내' , '요리 재료 중에 페퍼론치노라는 이태리식 작은 고추가 들어가는데 작지만 생각보다 엄청 매워서 하나 두개 정도만 들어가도 상당히 매콤해요. 약간 매운 향만 느끼고 싶다면 한 개 정도 넣어도 되고 매운 맛이 싫다면 그냥 빼셔도 상관 없어요.오일 베이스 파스타의 경우 마지막에 올리브오일을 살짝 더 넣고 버무려주면 우리나라 음식 마지막에 참기름을 넣는 것과 같은 비슷한 효과가 나서더 맛있답니다.', 20 ,11 ,42 ,  sysdate,1);






/*     ==========   6   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'321321','321321','새앰김','김샘','3121515223200','ab341@1351323v2er.com',12342201599,sysdate,'photo_07.png','쉐프',30);



-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime,admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '냉라면 <히야시츄카> 만들기' , 'foodImg_10.png'  ,  '일본요리책을 볼 때면 꽤 자주 등장해서 이름을 알고 있었던 요리인 히야시츄카
일본어로 冷やし中華를 직역하면 차가운 중화풍의 것이 되는데 중화냉면이 일본에와서 자리를 잡아 탄생한 요리라고 한다. 면 위에 색색의 다양한 고명을 올린 뒤 타레소스를 뿌려 먹는 면요리. 맛있게 해드세요 :)' ,
 'https://tv.naver.com/embed/1814533?autoPlay=true' , '샌드위치햄,계란,오이,브런치크랩,토마토,또는 방울토마토,중면,통깨,꿀,식초,물,간장,참기름,쪽파,통깨' ,   ' 4장,  1개,  1/2개,  4개,1개 6-7개,  2인분, 3TS,  2TS,  4TS,  1TS,  2TS,  1TS, 1대,  조금' , '오이, 햄은 길게 채 썰고 계란은 소금을 약간 넣고 풀어 지단을 부친 뒤 채 썰고 토마토는 반으로 갈라 웨지 형태로 자른다. 브런치 크랩은 포장을 제거하고 손으로 뜯어둔다,깨를 깨갈이에 넣고 갈은 뒤 나머지 소스 재료를 넣고 섞는다, 끓는 물에 면을 넣고 중간중간 찬물을 부어가며 끓인다,접시 위에 면을 담고 햄, 크랩, 오이, 계란, 토마토를 올려준 뒤 소스를 뿌려 낸다.',  1000   , '50'  , '30분이내', '올라가는 고명은 가능한 얇게 썰어주어야 예쁘다.고명은 미리 준비해두었다 사용해도 되기 때문에  요리하기 싫은 여름철 매우 잘 써먹을 수 있는 요리.
우리나라의 냉면과는 또 다른 중독성 있는 맛의 냉면이라 여름 지나가기 전에 한 번 해드셔보시라 추천 드려요 :)', 30 ,61 ,62 ,  sysdate,1);



-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '심야식당 <배추삼겹살나베> 만드는법' , 'foodImg_29.jpg'  , 
  '보통 이런건 2인분 기준으로 드실테니 전 분량을 2인분으로 맞춰서 올려드립니다.간단한데 야채에서 우러나오는 육수의 맛도 좋고 달달한 배추의 맛도 좋은 나베.요즘 같은 날씨에 사케 한잔과 딱이겠죠? 맛있게 해드세요 :)'
  ,'https://tv.naver.com/v/4549052' , '배춧잎,표고버섯,당근,두부,팽이버섯,물,가쓰오부시,다시마,시판 폰즈소스,레몬' ,   ' 4장, 1개, 1/3개, 1/2모, 1/2개,1L,  10g, 1장,적당량, 1조각' ,
  '냄비에 물과 다시마를 넣고 끓이다 물이 끓어오르면 다시마를 제거하고 가쓰오부시를 넣은다음 불을 끈 뒤 20분간 우려낸다,팽이버섯은 2등분하고 배추는 한입크기로 썰고 두부는 슬라이스 한다,표고버섯은 밑동을 잘라내고 모양내어 잘라준다. 당근도 모양내어 자른다,냄비에 돼지고기와 야채를 모두 넣고 1의 육수를 재료가 잠길 정도로 부어준 뒤 청주 1TS를 넣는다,재료가 충분히 다 익을 때까지 끓여낸다,폰즈 소스에 물을 살짝 넣어 희석한 뒤 레몬 1조각을 넣는다.'
  ,  3000  ,  200,  '90분이내'  , '저는 폰즈소스를 물에 조금 희석해서 같이 내었는데 취향에 따라서 참깨 소스나 다른 소스를 같이 내어도 좋아요.'
  , 30 ,21 ,12 ,  sysdate,1);





/*     ==========   7   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'1212','1212','배추총각','배추사세요','3121115223200','ab341@135s1323v2er.com',12312541999,sysdate,'photo_08.png','쉐프',40);




-- 클래스 데이터 --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '감자칩 오믈렛 만드는법' , 'foodImg_25.jpg'  , 
  '오믈렛 레시피는 여러번 올린 것 같은데 이번에는 조금 특별하게 집에 남아있던 감자칩을 활용해 만들어보았답니다.마치 생감자를 넣은 것처럼 고소하니 맛있는 오믈렛이예요.이 오믈렛은 뒤집거나 접을 필요도 없고 팬에 계란물을 부어 그대로 구워 익히면 되기 때문에 만들기도 매우 쉬워요. 한가지 팁은 감자칩의 일부는 계란물 안에 일부는 위에 토핑으로 올려 부드러운 계란의 맛과 바삭한 감자칩의 맛을 동시에 즐길 수 있도록 만드는거예요. 맛있게 해드세요 :)'
  ,'https://tv.naver.com/v/14004403' , '계란,감자칩 으깬 것,다진 쪽파,버터,소금, 후추' ,   '2개, 1컵, 2TS, 1ts,약간,약간' ,
  '쪽파는 송송 썬다,감자칩은 대강 부수어서 준비한다,볼에 계란을 넣어 풀고 다진 쪽파, 감자칩 절반, 소금, 후추를 넣고 섞는다,팬에 버터를 녹인다,계란물을 부어넣고 약불에서 익힌다,80%정도 익었을 때 위에 감자칩을 뿌리고 조금 더 익혀 마무리한다.'
  ,  2000  ,  200,  '30분이내'  , '계란 굽기는 취향에 따라서 조절하셔도 괜찮아요.제가 만든 것보다 덜 익히셔도 잔열에 의해서 먹는 사이에 계란이 거의 익은 상태이기 때문에 조금 더 부드러운 식감을 원하시는 분들께는 더 추천하는 방법이예요.요거 정말 위에 감자칩을 안뿌렸다면 감자칩이 안에 들어간지도 모르고 먹었을 것 같아요 ㅎㅎ.조금 더 리치하게 드시고싶다면 체다치즈 갈아서 뿌리셔도 괜찮을 것 같아요.브런치로 정말 딱인 오믈렛요리.스페인 요리 중에 감자가 들어가는 또르띠아라는 오믈렛 요리가 있는데 그것의 가벼운 버전 같기도 한 감자칩 오믈렛이예요.'
  , 70 ,11 ,62 ,  sysdate,1);



--멤버추가
--select * from member_info;
insert into member_info values(member_info_seq.nextval, 'qwe123', 'qwe123', '냥냥', 'ㅎㅇ', '9500332121221', 'haj1003@naver.com', '01033334455', sysdate, 'photo_09.png', '일반', 5, '일반인', 10);


insert into member_info values(member_info_seq.nextval, 'kkk123', 'qwe123', '백수', '펭펭', '9500442121221', 'rnlwneh@naver.com', '01022311455', sysdate, 'photo_10.png', '일반', 5, '일반인', 10);



insert into member_info values(member_info_seq.nextval, '1111', '1111', '문대리', '문대리', '9600442121221', 'mmm123@naver.com', '01122311455', sysdate, 'photo_12.png', '일반', 5, '일반인', 10);
--select * from member_info;


commit;


--select class_no,class_title,mem_no,admin_app from class_info;

--select mem_no,mem_pic,mem_grade_no from member_info;

--select * from review;

--select mem_no,class_no from pay_info;





/*  랭킹 임의 데이터 만들기  */

/* 클래스 결제 */

insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 11  , 16  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 8  , 16  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 6  , 16  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 2  , 16  , '카드결제' , '결제완료');

 
insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 10  , 16  , '카드결제' , '결제완료');
 
 
 insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 12  , 16  , '카드결제' , '결제완료');
 
  
 insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 4  , 16  , '카드결제' , '결제완료');
 
 
 

insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 11  , 6  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 6  , 6  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 13  , 6  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 6  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 5  , 6  , '카드결제' , '결제완료');





insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 26  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 6  , 26  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 26  , '카드결제' , '결제완료');

insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 10  , 26  , '카드결제' , '결제완료');






insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 23  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 23  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 9  , 23  , '카드결제' , '결제완료');





insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 5  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 13  , 5  , '카드결제' , '결제완료');



insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 6  , 20  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 3  , 24  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 5  , 12  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 22  , '카드결제' , '결제완료');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 27  , '카드결제' , '결제완료');



insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 7  , '카드결제' , '결제완료');






/*  랭킹 임의 데이터 만들기  */

/* 리뷰 평균  */


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  11  , 16  , '1', 5 , '맛있어요',sysdate);


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  8  , 16  , '1', 5 , '짱맛! 조개있으면 다 해먹어!!',sysdate);
 
 
insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  6  , 16  , '1', 4 , '생각보다 만들기도 쉬워요',sysdate);
 
 
insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  10  , 16  , '1', 5 , '해장하려고 만들었는데 또 술먹음 ^^',sysdate);




insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  11  , 5  , '1', 4 , '개존마아아아앗!',sysdate);


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
values(review_seq.nextval,  13  , 5  , '1', 4 , '푸딩푸딩푸딩',sysdate);
 
 
 
 
 
insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
values(review_seq.nextval,  11  , 26  , '1', 2 , '생각보다 만들기 어려움',sysdate);
 


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  6  , 26  , '1', 4 , '좋아요...',sysdate);



insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  10  , 26  , '1', 3 , '이시국에...일식...',sysdate);



insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  9  , 23  , '1', 2 , '괜히 샀어...',sysdate);



insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  5  , 6  , '1', 1 , '사지마사지마...',sysdate);







--거래처 목록 테이블 추가
insert into trade_list values(trd_list_no_sq.nextval, '이마트', '이마트담당', '01012341234', sysdate, sysdate);
insert into trade_list values(trd_list_no_sq.nextval, '과일가게', '과일담당', '01043211234', sysdate, sysdate);
insert into trade_list values(trd_list_no_sq.nextval, '고깃집', '고깃집담당', '01098881234', sysdate, sysdate);
--select * from trade_list

--상품추가
--select * from store_product;
insert into store_product values(str_pro_no_sq.nextval, 1, '꼬북칩.PNG', '꼬북칩.PNG', '맛있는 꼬북칩', '꼬북칩', '500', '500', '1500',0);
insert into store_product values(str_pro_no_sq.nextval, 1, '군만두.PNG', '군만두.PNG', '맛있는 군만두', '군만두', '400', '3000', '5000',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '김치.PNG', '김치.PNG', '맛있는 김치', '김치', '0', '2000', '8000',0);
insert into store_product values(str_pro_no_sq.nextval, 1, '떡갈비.PNG', '떡갈비.PNG', '맛있는 떡갈비', '떡갈비', '50', '6000', '10000',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '라면.PNG', '라면.PNG', '맛있는 라면', '라면', '500', '600', '1200',0);
insert into store_product values(str_pro_no_sq.nextval, 1, '비비고.PNG', '비비고.PNG', '맛있는 비비고', '비비고', '950', '2000', '4000',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '이슬.PNG', '이슬.PNG', '맛있는 이슬', '이슬', '0', '800', '1800',0);

insert into store_product values(str_pro_no_sq.nextval, 2, '과일선물.PNG', '과일선물.PNG', '맛있는 과일선물', '과일선물', '30', '12000', '30000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '딸기.PNG', '딸기.PNG', '맛있는 딸기', '딸기', '200', '3000', '7000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '메론.PNG', '메론.PNG', '맛있는 메론', '메론', '0', '8000', '14000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '풋사과.PNG', '풋사과.PNG', '맛있는 풋사과', '풋사과', '500', '1500', '2500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '포도.PNG', '포도.PNG', '맛있는 포도', '포도', '0', '2000', '3000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '사과.PNG', '사과.PNG', '맛있는 사과', '사과', '700', '2000', '3000',0);
insert into store_product values(str_pro_no_sq.nextval, 2, '컵과일.PNG', '컵과일.PNG', '맛있는 컵과일', '컵과일', '20', '5000', '10000',0);
insert into store_product values(str_pro_no_sq.nextval, 2, '토마토.PNG', '토마토.PNG', '맛있는 토마토', '토마토', '900', '1000', '2000',1);

insert into store_product values(str_pro_no_sq.nextval, 3, '닭고기.PNG', '닭고기.PNG', '맛있는 닭고기', '닭고기', '500', '2000', '5000',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '돼지고기.PNG', '돼지고기.PNG', '맛있는 돼지고기', '돼지고기', '500', '5000', '8000',0);
insert into store_product values(str_pro_no_sq.nextval, 3, '바베큐.PNG', '바베큐.PNG', '맛있는 바베큐', '바베큐', '50', '15000', '30000',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '양고기.PNG', '양고기.PNG', '맛있는 양고기', '양고기', '100', '15000', '30000',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '오리고기.PNG', '오리고기.PNG', '맛있는 오리고기', '오리고기', '100', '8000', '15000',0);
insert into store_product values(str_pro_no_sq.nextval, 3, '소고기.PNG', '소고기.PNG', '맛있는 소고기', '소고기', '0', '20000', '50000',1);
--select * from store_product

--주문테이블 추가
--select * from store_order;
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 1, 5, '서울시 가디역',to_date(20201229000723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 5, 4, '서울시 가디역',to_date(20201229010723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 9, 9, '서울시 가디역',to_date(20201229020723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 2, 8, '서울시 가디역',to_date(20201229030723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 4, 7, '서울시 가디역',to_date(20201229040723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 7, 6, '서울시 가디역',to_date(20201229070723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 8, 1, '서울시 가디역',to_date(20201229080723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 5, 3, '서울시 가디역',to_date(20201229090723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 3, 2, '서울시 가디역',to_date(20201229010723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 6, 11, '서울시 가디역',to_date(20201229110723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 9, 15, '서울시 가디역',to_date(20201229120723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 8, 14, '서울시 가디역',to_date(20201229130723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 1, 13, '서울시 가디역',to_date(20201229140723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 5, 12, '서울시 가디역',to_date(20201229150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 3, 11, '서울시 가디역',to_date(20201229160723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1,11, 25, '서울시 가디역',to_date(20201221180723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 15, 4, '서울시 가디역',to_date(20201229180723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 14, 9, '서울시 가디역',to_date(20201229190723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 12, 7, '서울시 가디역',to_date(20201229200723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 13, 5, '서울시 가디역',to_date(20201229210723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 16, 3, '서울시 가디역',to_date(20201229220723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 19, 1, '서울시 가디역',to_date(20201229230723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 18, 2, '서울시 가디역',to_date(20201230000723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 17, 6, '서울시 가디역',to_date(20201230230723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 16, 7, '서울시 가디역',to_date(20201230220723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 15, 8, '서울시 가디역',to_date(20201230210723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 14, 11, '서울시 가디역',to_date(20201230200723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 13, 21, '서울시 가디역',to_date(20201230190723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 12, 16, '서울시 가디역',to_date(20201230180723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 11, 14, '서울시 가디역',to_date(20201230170723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 12, 22, '서울시 가디역',to_date(20201229170723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 13, 13, '서울시 가디역',to_date(20201230160723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 14, 14, '서울시 가디역',to_date(20201230150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 16, 17, '서울시 가디역',to_date(20201230150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 17, 4, '서울시 가디역',to_date(20201230150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 18, 1, '서울시 가디역',to_date(20201230120723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 19, 2, '서울시 가디역',to_date(20201230110723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 14, 3, '서울시 가디역',to_date(20201230090723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 15, 3, '서울시 가디역',to_date(20201230080723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 1, 4, '서울시 가디역',to_date(20201230070723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 3, 5, '서울시 가디역',to_date(20201230060723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 9, 6, '서울시 가디역',to_date(20201230050723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 7, 7, '서울시 가디역',to_date(20201230040723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 21, 8, '서울시 가디역',to_date(20201230030723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 20, 8, '서울시 가디역',to_date(20201230020723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 20, 9, '서울시 가디역',to_date(20201230010723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 21, 4, '서울시 가디역',to_date(20201230000723,'YYYY-MM-DD HH24:MI:SS'));
--select * from store_order

 /*
 --테이블 보기--
 
  select* from kind_tag;
 select* from theme_tag;
 select* from material_tag;
 select* from member_info;
 select* from recipe_info;
 select* from scrap;
 select* from subscribe;
 select* from review;
 select* from customer_care;
 select* from visit_info;
 select* from admin_info;
 select* from admin_schedule
 select* from trade_list
 select* from store_product
 select* from store_cart
 select* from pay_info
 select* from chef_request
 
 
 */


--레시피 임의의 데이터--
insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '폭립', '10.jpg', '비디오url', '집에서만드는 맛나는 폭립', '20분내외', 'Hard', '돼지 등갈비,소금,후추,바베큐소스', '800g,4꼬집,3꼬집,1통', '요리순서,요리순서,요리순서,요리순서,요리순서', 1, 0, 20, 21, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '코코넛 커리', '6.jpg', '비디오url', '집에서 만나는 동남아 요리 코코넛 커리', '40분내외', 'Normal', '닭다리살,우유반컵,인도카레가루,양파', '500g,125ml,3큰술,반개', '손질한 닭에 우유를 넣고 30분간 냉장고에 재워주세요,양파 반쪽 네모썬거 카레가루를 섞어주세요,닭다리살을 꺼내 한입 크기로 잘라주세요,양파와 닭다리살을 볶아주세요,볶아진 재료에 우유와 물을 넣고 조려주세요, 국물이 걸죽해지면 완성입니다', 1, 0, 50, 11, 32, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 4, '에그 인 헬', '5.jpg', '비디오url', '지옥에 빠진 계란 에그인헬 입니다', '40분내외', 'Normal', '계란,토마토 소스,닭가슴살,소금,후추', '3개,1통,1팩,1꼬집,1꼬집', '팬에 다진마늘 볶다가 닭가슴살 넣고 볶어요,토마토소스 300g 넣고 잘 섞어주세요,소금으로 간 맞추고 후추 굵직하게 갈아 줍니다,달걀 3개 넣었어요 노른자 터지지 않도록 조심조심~,뚜껑 덮어 노른자가 반숙이 되도록 약불로 익혀 줍니다', 1, 0, 20, 11, 32, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '콩나물 불고기', '4.jpg', '비디오url', '백종원 대패삼겹살 콩나물 불고기', '20분내외', 'Hard', '대패 삼겹살,콩나물,양파,고춧가루,고추장,간장,설탕', '500g,1봉지,반개,3스푼,3스푼,3스푼,3스푼', '양념을 섞어 양념장을 만들어 주세요,콩나물 300g을 씻어 체에 밭쳐 물기를 제거하고 준비합니다,삼겹살 500g을 준비하고,넓은 팬에 씻어 놓은 콩나물을 깔고,그 위에 대패삼겹살을 올리고,만들어 놓은 양념장을 모두 넣고,달달 볶아주면 콩나물 불고기 완성', 1, 0, 10, 31, 12, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 6, '블루베리 팬케이크', '7.jpg', '비디오url', '아이들 간식으로 블루베리 팬케이크 어떤가요?', '40분내외', 'Hard', '팬케이크 가루,블루베리,휘핑크림,버터,우유', '300g,50g,100g,1조각,200ml', '팬케이크 가루와 우유를 섞어주세요,달군팬에 버터를 두르고 구워주세요,휘핑크림을 거품기로 저어 크림을 만들어주세요,다 구워진 팬케이크에 크림과 블루베리를 올려주세요,맛있게 드시면 됩니다', 1, 0, 80, 51, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '과일을 곁들인 크레페', '8.jpg', '비디오url', '브런치로 적당한 크레페 레시피 입니다~', '40분내외', 'Normal', '밀가루,딸기,블루베리,휘핑크림,설탕,우유', '300g,100g,100g,200ml,50g,100ml', '휘핑크림과 설탕을 섞어 크림을 만들어 주세요,밀가루와 우유를 섞어주세요,달군 팬에 반죽을 얇게 구워주세요,구워진 크레페에 과일과 휘핑크림을 장식해주세요,맛있게 드시면 됨다', 1, 0, 80, 51, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '스테이크', '9.jpg', '비디오url', '집에서 만드는 고급진 스테이크 어떠세요', '40분내외', 'Hard', '소고기 안심, 아스파라거스,소금,후추,버섯', '300g,2개,한꼬집,한꼬집,50g', '스테이크를 30분전 상온에 꺼내두세요,아스파라거스와 버섯을 깨끗이 씻어주세요,기호에 맞게 스테이크를 구워주면서 소금 후추를 뿌려주세요,다구워진 스테이크를 빼고 아스파라거스와 버섯을 쌘 불에 볶아주세요,맛있게 드시면 됩니다', 1, 0, 20, 21, 22, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '당근케이크', '11.jpg', '비디오url', '연말에 가족과 같이 만드는 당근케이크', '40분내외', 'Easy', '당근,밀가루,설탕,소금,버터', '1개,500g,설탕 300g,1꼬집,300g', '밀가루를 한번 체에 걸러주세요,밀가루 설탕 소금 버터를 잘 섞어주세요,180도로 예열된 오븐에 40분간 구워주세요,맛있게 드시면 됩니다', 1, 0, 80, 51, 62, sysdate);





insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat.jpg','meat.jpg','국내산 한돈 돼지불고기용!','한돈 돼지불고기용 1kg',40,15900,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat1.jpg','meat1.jpg','돼지고기 / 소고기 모음 특가전','국산,호주산,미국산 조리별 고기 골라담기',40,4400,5000,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat2.jpg','meat2.jpg','쉐정 1++ 한우 불고기 - 숙성 투뿔 소고기 200g','남녀노소 모두가 좋아하는 부드러운 1++ 한우 불고기',40,15900,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat3.jpg','meat3.jpg','삼겹살 500g (구이용)','가락시장의 신선함을 우리집으로',40,16200,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat4.jpg','meat4.jpg','호주산 목심 500g (불고기용)','가락시장의 신선함을 우리집으로',40,13800,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat5.jpg','meat5.jpg','쉐정 한돈 찌개용 제육 - 숙성 냉장 돼지고기 500g','집밥 필수템 한돈 돼지고기 찌개용!',40,7500,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat6.jpg','meat6.jpg','한돈 안심 1+1팩(돈카츠/장조림용)','오늘은 부드러운 안심으로 꼬마돈까스 어때요??',40,9900,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat7.jpg','meat7.jpg','쉐정 1++ 한우 갈빗살 - 숙성 투뿔 소고기 200g','쫄깃한 식감이 매력적인 1++ 한우 갈빗살',40,33000,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat8.jpg','meat8.jpg','쉐정 1++ 한우 채끝살 등심 - 숙성 투뿔 소고기 200g','쫄깃하고 풍부한 육향 1++ 한우 채끝살',40,43000,9900,1);

insert into store_product values(str_pro_no_sq.nextval, 1, '송화버섯.jpg', '송화버섯.jpg', '설산소리 솔향버섯(송화버섯) 500g/1kg', '쫄깃하고 오래가는 은은함', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '제주레드비트.jpg', '제주레드비트.jpg', '제주레드비트(즙용) 5kg/10kg (제주직송, 실중량)', '제주산 레드비트로 신선함을 느껴보세요~!', '500', '15900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '쌈채소.jpg', '쌈채소.jpg', '맛군 신선하고 푸짐한 유기농 쌈채소 800g', '주문 후 수확하여 보내드리는 다양하고 싱싱한 쌈채소', '500', '11900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '케일.jpg', '케일.jpg', '케일 80g', '가락시장에서 엄선된 신선채소', '500', '3900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '베이비채소.jpg', '베이비채소.jpg', '베이비채소 50g', '신선함이 한 가득, 베이비채소', '500', '1000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '당근.jpg','당근.jpg', '세척당근 1개', '가락시장에서 엄선된 신선채소', '500', '1200', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '무.jpg', '무.jpg', '무 1개', '가락시장에서 엄선된 신선채소', '500', '7200', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '치커리.jpg', '치커리.jpg', '치커리 250g/500g', '가락시장에서 엄선된 신선채소', '500', '4900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '청경채.jpg', '청경채.jpg', '청경채 200g', '가락시장에서 엄선된 신선채소', '500', '4400', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '백오이.jpg', '백오이.jpg', '백오이 1개/3개', '가락시장에서 엄선된 신선채소', '500', '2600', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 2, '체리.jpg', '체리.jpg', '자연식탁 칠레산 고당도 프리미엄 생체리 500g 큰사이즈', '칠레산 생체리', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '파인애플.jpg', '파인애플.jpg', 'Dole 스위티오 골드파인애플 특대 2입', '새콤달콤 말이 필요없는 브랜드, 스위티오 파인애플!', '500', '8500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '자몽선물세트.jpg', '자몽선물세트.jpg', '프리미엄 자몽 선물세트 대과 12개입 (개당 400g 내외)', '자몽 선물세트로 마음을 전하세요~!', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '석류.jpg', '석류.jpg', '미국산 석류 중대과 6입', '영양 가득한 고당도 석류!', '500', '24900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '바나나.jpg', '바나나.jpg', '고당도 바나나 13kg 1박스_6~9수 선택', '달콤하고 쫀득한 고당도 바나나', '500', '20900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '라임.jpg', '라임.jpg', '라임 소과 18개입_수량선택', '싱그러움이 가득한 라임', '500', '12900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '크랜베리.jpg', '크랜베리.jpg', '냉동 크랜베리 100% 1kg', '건강과 젊음을 지켜주는 붉은 보석', '500', '6400', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '골드키위.jpg', '골드키위.jpg', '제스프리 제주 골드키위 중과, 중소과 16입_수량선택', '싱싱한 제주 제스프리 골드키위!', '500', '22900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '아보카도.jpg', '아보카도.jpg', '아보카도 1개,3개,6개,10개 택1', '숲 속의 버터 아보카도', '500', '4200', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 3, '햅쌀.jpg', '햅쌀.jpg', '20년산 햅쌀 엘그로 안씻어도 되는 청결미 10kg', '20년산 씻어나온 혼합 상품입니다.', '500', '37500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '검은콩.jpg', '검은콩.jpg', '볶은 검은콩 서리태 1kg', '몸에 좋은 검은 콩 서리태!', '500', '7100', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '이천쌀.jpg', '이천쌀.jpg', '20년산 대월농협 이천쌀10kg', '20년산 대월농협 이천쌀입니다 (10kg)', '500', '50000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '귀리.jpg', '귀리.jpg', '국내산 옥구농협 못잊어귀리 5kg (1kg * 5ea)', '국내산 농협 귀리', '500', '20500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '백미.jpg', '백미.jpg', '당일 도정 상하농원 백미 20kg', '농부의 정성과 맛과 영양을 담은 상하농원 백미', '500', '69500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '잡곡.jpg', '잡곡.jpg', '전남생협 온 가족이 함께먹는 강황쌀 500g', '온 가족이 함께먹는 강황쌀500g', '500', '10900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '씻어나온쌀.jpg', '씻어나온쌀.jpg', '20년산 엘그로 씻어나온 깨끗한쌀 청결미 3kg', '20년산 씻어나온쌀입니다', '500', '13700', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '아끼바레.jpg', '아끼바레.jpg', '2020햅쌀 한수위 아끼바레 10kg', '농부의 땀방울이 가득 담긴 경기 아끼바레', '500', '34000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '철원오대.jpg', '철원오대.jpg', '2020햅쌀 이쌀이다 철원오대 1kg', '자연의 향기가 가득담긴 이쌀이다!', '500', '5100', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 1, '쭈꾸미볶음.jpg', '쭈꾸미볶음.jpg', '26년전통 감칠맛 숙성 쭈꾸미볶음 350g', '전라도 대표 맛집~! 20년전통 숙성 쭈꾸미볶음!', '500', '6800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '알탕.jpg', '알탕.jpg', '26년전통맛집 명품 수제 알탕 3~4인분', '고니 듬뿍~ 명란 알 듬뿍~ 수제 알탕입니다~', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '씨앗호떡.jpg', '씨앗호떡.jpg', '부산명물 견과류가 가득한 씨앗쌀호떡 3팩 4종', '견과류가 가득해 고소하고 건강한 최고의 겨울간식!', '500', '4300', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '갈비.jpg', '갈비.jpg', '26년전통 맛집 소 양념 이동갈비', '청주를 넣어 잡내제거와 48시간 쿨링숙성', '500', '25600', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '파닭꼬치.jpg', '파닭꼬치.jpg', '파닭꼬치 염통 꼬치 모음전', '완전 맛나용!!! 하트백만개 나오실겁니다.', '500', '4200', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '연어장.jpg', '연어장.jpg', '특제 간장소스로 만든 인생 밥도둑', 'SNS에서 핫한 혼밥러들의 필수템!', '500', '16500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '부산어묵.jpg', '부산어묵.jpg', '수제어묵 모듬 풀세트', '원조 부산어묵 맛집!!~야들야들 수제 부산어묵..!!', '500', '16800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '훈제.jpg', '훈제.jpg', '굽네 오리지널 훈제 닭가슴살 100g 1팩', '굽네 베스트 닭가슴살', '500', '1800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '제육볶음.jpg', '제육볶음.jpg', '26년전통맛집 리얼 밥도둑 마약 제육볶음 500G', '전라도 가면~ 줄서서 먹는 수제 마약 고추장 제육볶음', '500', '7900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '명이나물.jpg', '명이나물.jpg', '경남 산청군 짜지 않고 부드러운 명이나물 장아찌 500g', '짜지않고 부드러운 명이나물 장아찌', '500', '11900', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 2, '구운란.jpg', '구운란.jpg', '촉촉한 명품 반숙란 30구 무료배송', '우리 가족 안심 먹거리! 맛있는 구운란과 반숙란!', '500', '9500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '낙지.jpg', '낙지.jpg', '삼삼해물 자연산 생 돌문어 1kg(2~3마리)', '거제 바닷속 바위 틈에서 발견한 보물!', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '오징어.jpg', '오징어.jpg', '자연식탁 포항 구룡포 동해안 정품 손질오징어 1kg', '간편한, 손질오징어!', '500', '23900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '문어숙회.jpg', '문어숙회.jpg', '한입 슬라이스 문어 숙회 200g', '손질하기 귀찮은 문어 쉽고 맛있게 즐길 수 없을까요?', '500', '7900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '딱새우.jpg', '딱새우.jpg', '홀딱! 반해버렸, 딱새우회 120g', '탱글~하고 쫀득~한 식감이 예술이예요!', '500', '14900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '가리비.jpg', '가리비.jpg', '맛군 싱싱한 통영 홍가리비 1kg', '달착지근하고 고소한 가리비!', '500', '6900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '우렁이.jpg', '우렁이.jpg', '지리산 하동 오동통 삶은 우렁이살', '자연에서 키운 오동통한 삶은 우렁이 살!', '500', '12800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '굴.jpg', '굴.jpg', '맛군 탱글탱글 한 통영 생굴 1kg', '바다의 우유, 통영굴', '500', '16900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '브라운크랩.jpg', '브라운크랩.jpg', '자연식탁 살이 가득한 영국산 자숙 브라운크랩 1마리', '살이 가득한 영국산 자숙 브라운크랩 1마리', '500', '15900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '키조개.jpg', '키조개.jpg', '삼삼해물 키조개 1마리', '압도적인 비주얼의 조개!', '500', '4500', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 3, '반건조오징어.jpg', '반건조오징어.jpg', '맛군 촉촉 쫄깃 반건조 오징어 10미', '맥주안주로 최고! 쫄깃한 반건조오징어', '500', '19900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '아귀포.jpg', '아귀포.jpg', '맛있는 통마리 꼬리아귀포', '안주로도 제격인 통마리 꼬리아귀포!', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '과메기.jpg', '과메기.jpg', '맛군 구룡포 과메기 반손질', '꾸덕꾸덕한 구룡포 과메기', '500', '5900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '쥐포.jpg', '쥐포.jpg', '프리미엄 AAA급 두꺼운 쥐포 ', '쩐내?비릿내? 안나요! 정말 맛있어요', '500', '19800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '진미채.jpg', '진미채.jpg', '특A급 부드러운 진미채 1kg', '특A급 백진미채!', '500', '19900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '고등어.jpg', '고등어.jpg', '노르웨이 순살 고등어', '홈쇼핑에서도 대박났던 상품!!', '500', '13500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '껍데기.jpg', '껍데기.jpg', '대구맛집 갈비양념 벌집껍데기', '대구맛집 갈비양념 벌집껍데기', '500', '3900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '양갈비.jpg', '양갈비.jpg', '양 갈비 스테이크', '호주의 농장과 직계약하여, 냉장 숙성', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '막창.jpg', '막창.jpg', '대구맛집 직화 막창', '대구맛집 직화 막창', '500', '4900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '국.jpg', '국.jpg', '우리 아이를 위한 맛있는 국', '영양도 굿! 맛도 굿!', '500', '3500', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 1, '붕어빵.jpg', '붕어빵.jpg', '에어프라이어 꿀맛 붕어빵', '대한민국엔 청담동 미니붕어빵이 있어요!', '500', '13400', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '순대곱창.jpg', '순대곱창.jpg', '옛날 순대 곱창 전골', '옛날 순대곱창전골', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '장조림.jpg', '장조림.jpg', '메추리알 장조림', '탱글한 식감이 살아있는 메추리알 장조림', '500', '35000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '쫄면.jpg', '쫄면.jpg', '쫄면 풀셋트 !', '쫄면 풀셋트 !', '500', '12900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '떡갈비.jpg', '떡갈비.jpg', '한우와 한돈으로 만든 고인돌 떡갈비', '아이들 간식, 반찬! 떡볶이떡이 들어있는 떡갈비', '500', '6300', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '수제돈까스.jpg', '수제돈까스.jpg', '수제 돈까스', '100% 수제로 만들었습니다~!', '500', '4900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '닭갈비.jpg', '닭갈비.jpg', '향적궁 닭갈비 350g', '푸짐한 양의 향적궁 닭갈비로 몸보신 하기!', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '새우튀김.jpg', '새우튀김.jpg', '튀겨나온 60새우', '아이들 간식으로, 어른들 안주로 딱!', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '된장찌개.jpg', '된장찌개.jpg', '간편한 한끼 누구나 시래기 된장찌개', '쉽고 편리한 시래기 된장찌개', '500', '16500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '감자칩.jpg', '감자칩.jpg', '포테이토 칩스 2kg', '리얼감자칩! 소리까지 맛있는 포테이토칩!', '500', '7800', '1500',1);




insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
                   visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 11, '삼계탕', '10.jpg', '비디오url', '집에서만드는 맛나는 삼계탕', '20분내외', 'Hard', '재료,재료,재료,재료', '재료량,재료량,재료량,재료량,재료량', '요리순서,요리순서,요리순서,요리순서,요리순서', 1, 0, 10, 11, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
                   visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 12, '삼계탕', '10.jpg', '비디오url', '집에서만드는 맛나는 삼계탕', '20분내외', 'Hard', '재료,재료,재료,재료', '재료량,재료량,재료량,재료량,재료량', '요리순서,요리순서,요리순서,요리순서,요리순서', 1, 0, 10, 11, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
                   visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '삼계탕', '10.jpg', '비디오url', '집에서만드는 맛나는 삼계탕', '20분내외', 'Hard', '재료,재료,재료,재료', '재료량,재료량,재료량,재료량,재료량', '요리순서,요리순서,요리순서,요리순서,요리순서', 1, 0, 10, 11, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 4, '우삼겹살 두부조림', '우삼겹두부조림.jpg', '비디오url', '매콤 칼칼하고, 고소한 우삼겹 두부 조림, 밥 한공기 후딱, 밥도둑이 따로 없습니다.
오늘같이 비오고 쌀쌀해지는 날 술안주로도 좋습니다.', '30분내외', 'Normal', '두부,우삼겹살,된장,양파,대파,풋고추,물,식용유,매운고춧가루,고추장,간장,맛술,된장,다진마늘', '800g,200g,3큰술,1개,1대,2개,1.2리터,넉넉히,6큰술,3큰술,3큰술,3큰술,1큰술,2큰술', '손두부는 큼직하게 썰어 주세요.,된장 3 큰술에 물 800ml 을 붓고, 풀어 준 후 두부를 넣고 그대로 두세요.(10~20분 정도),*양파를 작게 썰어 주세요.
*대파와 풋고추는 어슷 썰어 주세요.,*위의 분량의 양념을 넣고,양념장을 만들어 주세요.
*우삼겹살은 3~4 등분으로 썰어 주세요.,웍에 식용유를 두르고, 양파를 넣고, 센불에서 투명 해질때 까지 볶아 주세요.,우삼겹살을 넣고 볶아 주세요.,된장에 담가둔 두부를 건져서 넣고 대파 풋고추 양념장을 넣고 물 400ml를 붓고, 양념을 고루 섞은 후 끓여 주세요.,국물이 자작 해지면 전골 냄비에 담아 주세요.', 1, 0, 10, 31, 22, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 4, '두부시금치무침 이 레시피가 제일 맛있네요', '두부시금치무침.jpg', '비디오url', '시금치 좋아하세요?  부드럽고 고소한 맛이 좋아 아이들이 참 좋아한답니다. 시금치두부무침 황금 RECIPE 만들어볼게요~'
, '15분내외', 'Easy', '시금치,두부,간장,참기름,깨소금,설탕,소금', '1단,1/2모,2T,1T,1T,0.5T,0.5T', '두부 반모는 칼등으로 잘게 으깨어준다.,참기름 1T, 간장 2T, 깨소금 1T, 설탕 0.5T 를 넣고 양념을 만들어 준다.,팬에 으깬 두부를 넣고 만들어진 양념 1/2 분량을 부어 준 뒤 수분이 날아갈 때 쯤 꺼내어 볼에 담아둔다.
,시금치는 지저분한 잎을 떼어낸 뒤 흐르는 물에 깨끗하게 씻어 준다.,깨끗하게 씻은 시금치는 밑둥을 자르고 먹기좋은 크기로 2등분 한다.,끓는 물에 소금 0.5t를 넣어준 뒤 시금치를 넣고 20초간 삶아준다.,데친 시금치는 찬물에 헹구어 손으로 물기를 꼭 짠다. 두부가 담긴 볼에 시금치를 넣고 나머지 양념을 다 넣어준 뒤 손으로 조물조물 무쳐준다. 부족한 간은 소금 (0.5t) 를 넣고 마무리한다.'
, 1, 0, 10, 11, 52, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '두부강정 ,두부반찬, 아이반찬', '두부강정.jpg', '비디오url', '두부에서 마늘간장치킨맛이나요 ㅋㅋㅋㅋ
신블리mom야매요리답게
진정한 야매요리가 나왔어요 ㅋㅋㅋㅋㅋ', '10분내외', 'Easy', '두부,부침가루,진간장,다진마늘,올리고당', '1모,1/2종이컵,5T,1T,2T', '두부는 깍뚝썰기 해주세요,
키친타올로 대충 물기를 제거해주세요,그리고 비닐팩에 부침가루를 넣고 살살 흔들어주세요,그다음 팬에 기름을 넉넉히 두른후
노릇노릇해질때까지 구워주세요~,물을 먼저 넣어준후 나머지양념들을 넣어주세요
그래야 타지않아요~', 1, 0, 10, 51, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '밥도둑 명란두부찌개', '명란두부찌개.jpg', '비디오url', '명란두부찌개 ~ 간단하고 국물의 시원함이 끝내줍니다.밥도둑이에요', '30분 내외', 'Easy', '명란젓, 두부, 대파, 홍고추, 청양고추, 양파, 호박', '3개,1/2모,약간,약간,약간,1/2개,1/4개', '물 650ml에 멸치와 다시마를 넣고 15분간 끓여 육수를 내어 주세요,필요한 재료를 손질  세척하여 준비하여 줍니다,재료를 썰어주세요,멸치 육수에 호박과 양파를 먼저 넣고 끓여주기 시작합니다,호박과 양파가 반쯤 익었으면 두부 먼저 넣고 명란을 넣고 끓여 주세요~,명란젓이 모두 익으면,
마지막으로 대파와 청양고추와 홍고추를 넣어 한소끔 끓여주면 완성입니다.
간을 보시고 모자라면 소금으로 맞추어 주세요', 1, 0, 10, 31, 42, sysdate);




insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '아침국으로...두부김치계란탕', '두부김치계란탕.jpg', '비디오url', '입이 깔깔한 아침에 국이 없으면 밥먹기 힘들것 같아 국이나 탕, 찌개 하나 쯤은 있어야 하기에 있는 재료로 간단하게 건더기도 푸짐한 두부김치계란탕을 끓였습니다.'
, '30분 내외', 'Normal', '계란, 대파초록부분, 양파, 두부, 국간장, 후추, 소금,다진김치,참기름,다시마멸치육수,소금', '3개,1/2대,1/4대,200g,1큰술,약간,3꼬집,1컵,1/2큰술,3컵,약간', '계란 3개, 소금 3꼬집, 대파 초록부분 1/2대를 쏭쏭 썰어 넣고 고루 잘 풀어 줍니다.,냄비에 다진 김치 1컵과  양파 1/4개를 다져 넣고 참기름 1/2큰술로 고르게 볶아 주었습니다. , 참기름이 쏙 배도록 볶아지면 두부 200g을 넣고 으깨면서 고르게 볶아 줍니다.,그리고 다시마 멸치육수 3컵을 붓고.....,국간장 1큰술로 간을 하고 끓여 줍니다.,그리고 준비한 계란을 한 곳에 붓지 마시고 계란이 큰덩이로 뭉치지않게 고르게 둘러주면서 끊어 붓고 크게 한번 휘~ 저어 끓여 줍니다.,부족한 간은 소금 후추 약간으로 해주세요~~'
, 1, 0, 10, 11, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '밥도둑이 따로 없는 감칠맛! 고춧잎무침, 고추잎 나물, 밑반찬', '고춧잎무침.jpg', '비디오url', '액젓과 고춧가루로 조물조물 감칠맛 가득 맛있게 무쳐낸 밥도둑 밑반찬 고추잎무침~'
, '10분 내외', 'Easy', '삶은고춧잎, 물, 소금, 고춧가루, 진간장, 멸치액젓, 설탕,다진마늘,참기름,통깨', '150g,약간,약간,1.5큰술,1.5큰술,1.5큰술,1큰술,0.5큰술,1큰술,한꼬집', '소금 반큰술 넣은 물이 끓으면 고추잎을 넣고 1분내로 삶아냅니다.,찬물에 충분히 헹구어 주세요. 이때 살짝 쓴맛과 아린맛이 날아간답니다., 멸치액젓 1.5큰술 다진마늘 1/2큰술 진간장 1.5큰술 설탕 1큰술 고춧가루 1.5큰술 참기름 깨소금 약간씩, 조물조물 무치면 맛있는 나물반찬~ 완성!!,넉넉히 만들어서 맛있게 드셔보세요~'
, 1, 0, 10, 11, 52, sysdate);




insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '[참치 강된장]밥도둑 참치 강된장으로 밥한공기 뚝딱', '참치강된장.jpg', '비디오url', '강된장 만들때 해물을 주로 사용하는데 해물대신 다른 재료를 생각해보다가 참치를 넣어봤더니 맛있더라구요. 입맛없을때 이것 하나면 밥한공기 뚝딱. 쌈싸먹을때도 좋아요.'
, '15분 내외', 'Normal', '참치캔, 애호박, 양파작은것, 청양고추, 표고버섯, 멸치다시마육수, 된장,고추장,설탕', '1개,1/4개,1개,1개,1개,150ml,4T,2T,1T', '참치는 채반에 받쳐서 기름을 빼주세요.,야채들은 다져주세요. 너무 작게 다지면 씹히는 식감이 없기때문에 너무 작게 다지지는 마세요.
야채는 냉장고에 남아있는 짜투리 야채를 사용해도 됩니다., 양념장 분량대로 양념장을 만들어주세요, 뚝배기에 다진 재료와 육수 또는 물, 양념장을 넣고 끓여주세요. 자글자글 끓을때까지만 끓여주시면 되는데 밑이 타지 않게 여러번 뒤집어 주셔야 합니다.'
, 1, 0, 10, 11, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '백종원 김무침 만드는 법 밥도둑이네', '김무침.jpg', '비디오url', '오래된 김을 맛있게 활용할 수 있는
백종원 김무침 만드는 법 알려드릴께요'
, '5분 내외', 'Easy', '김, 진간장, 설탕, 참기름, 깨소금, 쪽파 또는 대파', '5장,2T,0.5T,1T,0.5T,조금', '달군 팬에 약불로 줄인 후 앞 뒤로 한번씩 바싹 구워주시는데 바삭한 식감에
고소한 맛이 강해져 입맛을
사로잡는 듯 해요,잘 구워진 김을 비닐봉지에 넣고
손으로 비벼가며 마구 부셔주세요,진간장과 설탕과 참기름과 깨소금를 넣고 양념장을 만들어 주시는데요, 썰어놓은 파를 넣어 섞어주시고요
쪽파로 하면 조금 더 깔끔하겠지만
없으시면 대파로 하셔도 상관없답니다.,부셔 놓은 김을 버무릴 볼에 옮겨담고 만들어 놓은 양념장을 넣어주시는데 구워서 수분이 없는 상태이기 때문에 양념장을 금방 흡수하니 한곳에 뭉치지 않도록 골고루 뿌려서 조물조물 해주세요,
그릇에 옮겨 담은 후 통깨를 톡톡 뿌리고요 적당한 짭조름에 바삭 촉촉함이 느껴져 밑반찬으로 곁들여 먹기 괜찮더라고요'
, 1, 0, 10, 11, 52, sysdate);



insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '게다리로 맛을 낸 깊은 감칠맛!!!밥도둑 간장게장~', '간장게장.jpg', '비디오url', '
깊은 감칠맛 밥도둑 만들기 어렵지않아요^^'
, '2시간이내', 'Hard', '암꽃게, 양파큰거, 마른고추, 대파15cm, 다시마, 감초,통마늘,양조간장,물', '5kg,1개,6개,2개,2조각,2조각,20개,1.7리터 한병,3.4리터', '양조간장 1.7리터 한병과 물3.4리터를 붓고 양파 대파 감초 마른고추 다시마 통마늘 집게다리 10개를 넣고 끓으면 약불에 30분정도 더 끓여줍니다,그사이 게를 솔로 구석구석 박박 문질러 씻어서 물기를 빼줍니다,
물기가 어느정도 빠지면 집게 다리는 떼어내고 나머지 다리는 끝에 뾰족한 쪽을 잘라줍니다,손질한 게를 통에 차곡차곡 담으시고 끓여 논 간장이 완전히 식은후 부어주세요.(게가 잠겨야해요)
그대로 김치냉장고에 넣어두시고 2-3일후부터 드시면 됩니다,
드시기전 먹기좋게 분리해 담아주시고 쪽파,청양고추등을 잘게 썰어서 같이 드셔도 좋아요'
, 1, 0, 10, 11, 42, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '아보카도 장 밥도둑', '간장게장.jpg', '비디오url', 
'밥도둑 아보카도 장입니다.'
, '30분내외', 'Normal', '다진생강, 참기름, 고추냉이, 통깨', '약간,1큰술,약간,1큰술', '아보카도 장 재료로
 양파 반개와 아보카도3개 방울토마토 10개 레몬 반개
양념장: 설탕1큰술+식초2큰술+간장8큰술_+매실청1큰술 +다진파1큰술
다진생강약간+고추냉이 약간+참기름1큰술+통깨1큰술이 필요합니다., 양파반개는 채썰어주고 아보카도는 반으로 갈라 씨 제거하고 껍질을 벗겨
납작 모양으로 썰어주면 됩니다.,방울토마토와 레몬은 깨끗이 씻어 방울토마토는 2등분해주고 레몬은 반달모양으로
만들어요.,양념장을 만들어요.
설탕 식초 간장 매실청 다진파 다진생강 고추냉이 참기름 참깨 넣어 만든 양념장,밀폐 용기에 아보카도 방울토마토  양파 레몬을 담아요.,양념장을 넣고 냉장실에서 반나절 숙성해주면 됩니다.,
숙성한 아보카도 장은 밥에 곁들어 먹으면 너무 맛있겠죠.
아보카도 장은 냉장보관해 3~4일 안으로 먹는 것이 좋답니다.,밥도둑 아보카도 장'
, 1, 0, 10, 11, 52, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '쩝쪼롬한 밥도둑 보리굴비와 보리굴비손질법', '보리굴비.jpg', '비디오url', 
'?보리굴비는 예로부터 해풍에 말린 굴비를 항아리에 보리를 채워
변질되지 않도록 만든데서 유래되었는데요
잘 마른 굴비는 쌀뜨물에 불려 쪄서 먹으면 되지요'
, '60분내외', 'Normal', '보리굴비, 참기름', '3마리,2T', '잘 마른 보리굴비 손질부터 할게요,보리굴비는 쌀뜨물에 30분 정도 불려
비늘을 칼등으로 벗겨 줍니다
굴비가 뜨지 않도록 위에 무거운 것 눌러두면 더 좋아요,한 김 오른 찜판에 올려 20분정도 쪄 줍니다,오동통하니 맛나게 쪄 졌어요
한 김 식혀 살만 발라 녹찻물에 밥 말아 보리굴비 올려 먹으면 완전 별미죠 ㅎ,저는 쪄진 보리굴비를 참기름 발라 팬에 잠시 구웠습니다
꼬신내가 진동을 합니다 ㅎㅎ
쫄깃쫄깃~~
짭쪼롬하니 아주 맛난 밥도둑 보리굴비 입니다'
, 1, 0, 10, 11, 42, sysdate);




insert into rpatest values('mmm123@naver.com',sysdate);      
insert into rpatest values('haj1003@naver.com',sysdate);
insert into rpatest values('rnlwneh@naver.com',sysdate);



commit;


