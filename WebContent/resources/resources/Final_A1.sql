

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


 -- pay_info���̺� foreign key �������� ���� --
alter table pay_info drop constraint pay_info_str_pro_no_fk;
alter table pay_info drop constraint pay_info_mem_no_fk;

-- chef_request ���̺� foreign key �������� ���� --
alter table chef_request drop constraint chef_request_mem_no_fk;

-- store_cart ���̺� foreign key �������� ���� --
  alter table store_cart drop constraint store_cart_mem_no_fk;
alter table store_cart drop constraint store_cart_str_pro_no_fk;

 -- store_product ���̺� foreign key �������� ���� --
  alter table store_product drop constraint store_product_trd_list_no_fk;

 -- admin_schedule ���̺� foreign key �������� ���� --
  alter table admin_schedule drop constraint admin_schedule_ad_no_fk;


 -- member_info ���̺� foreign key �������� ���� --
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

 
/* ��¥ ��ȯ */

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
 
--�α��γ��� ������
create sequence loginlog_seq
	start with 1
	increment by 1;


/* ���� �±� ������ */

create sequence kind_tag_seq

	start with 1

	increment by 1;
    

create sequence store_order_sq

	start with 1

	increment by 1;

/* �׸� �±� ������ */

create sequence theme_tag_seq

	start with 1

	increment by 1;

 

/* ����� �±� ������ */

create sequence material_tag_seq

	start with 1

	increment by 1;


/* ȸ������ ������ */
create sequence member_info_seq

	start with 1

	increment by 1;

 

/* �丮���� ������ */

create sequence class_info_seq

	start with 1

	increment by 1;

 

/* ������ ������ */

create sequence recipe_info_seq

	start with 1

	increment by 1;

 

/* ��ũ�� ������ */

create sequence scrap_seq

	start with 1

	increment by 1;

 

/* ���� ������ */

create sequence subscribe_seq

	start with 1

	increment by 1;

 

/* �ı� ������ */

create sequence review_seq

	start with 1

	increment by 1;



/* ������ ������ */

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
    
    
    
   

/*�����±״� fk�� ���� ������ �����±׺��� create �ؾߴ�

�׳� ������� �巡�� �ϰ� �����ϸ� �˴ϴ� */

 

 

/*���� ���� �±� ���̺�*/

CREATE table kind_tag(
        kind_tag_no number(4),
        kind_tag_name varchar2(40) not null,

        PRIMARY key (kind_tag_no)

);



/*�׸� �±� ���̺�*/

CREATE table theme_tag(
        theme_tag_no number(4),
        theme_tag_name varchar2(40) not null,

        PRIMARY key (theme_tag_no)

);


/*����� �±� ���̺�*/

CREATE table material_tag(
        material_tag_no number(4),
        material_tag_name varchar2(40) not null,

        PRIMARY key (material_tag_no)
);



/*ȸ�� ���� ���̺�*/

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

--rpatest ���̺�
create table rpatest(
mem_email varchar2(30),
chef_regdate date);


/*Ŭ���� ���� ���̺�*/
create table class_info (
        class_no number(5),
        mem_no number(5) not null,
        class_title  varchar2(80) not null,
        class_thumbnail  varchar2(80) not null,
        class_content  varchar2(800),       
        class_recipe_video varchar2(80) not null,
        mate_name varchar2(600), --���--
        mate_cnt varchar2(600), --���---
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
        --fk���� mete, step �����ߴ��� �P���--
        PRIMARY key (class_no),
        foreign key(mem_no) REFERENCES member_info(mem_no),
        foreign key(kind_tag_no) REFERENCES kind_tag(kind_tag_no),
        foreign key(theme_tag_no) REFERENCES theme_tag(theme_tag_no),
        foreign key(material_tag_no) REFERENCES material_tag(material_tag_no)
);



/*���������� ���̺�*/

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


/*���� ���̺� Type�� Ŭ���� 1�� ������ 2��*/

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


--��ũ�� ���̺�--
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


/*���� ���̺�*/
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


--���� ��� �� �����--
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
    where m.mem_grade_no = '����'
    group by m.mem_no, m.mem_grade_no, r.mem_no, m.mem_nickname, k.kind_tag_name, 
m.kind_tag_no, m.mem_pic;
    

/*������ ���̺�*/
CREATE TABLE customer_care(

    cuscare_no  number(5),
    mem_no  number(5) not null,
    question  varchar2(80) not null,
    answer  varchar2(400) not null,
    cuscare_time date default sysdate,

    PRIMARY KEY(cuscare_no),
    foreign key(mem_no) REFERENCES member_info(mem_no)

);



/*�湮 ���� ���̺�*/

CREATE TABLE visit_info(

    mem_no  number(5),
    visit_ip  varchar2(20) not null,
    visit_date  date default sysdate,
    visit_refer  varchar2(200) not null,
    visit_agent  varchar2(200) not null

);




-- ������ ���� ���̺� ���� --
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

-- ������ ���� ���̺� ���� --
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



-- �ŷ�ó ��� ���̺� ���� --
create table trade_list (
        trd_list_no number(3),
        trd_list_name varchar2(30)  not null,
        trd_list_mng_name  varchar2(20)  not null,
        trd_list_mng_phone  char(11),
        trd_list_orderdate date default sysdate,
        trd_list_receivedate date default sysdate,
       primary key(trd_list_no)
);



-- ����� ��ǰ ���̺� ���� --
--���� str_pro_detail_image // str_pro_content �߰�
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


--��ǰ ����--

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


-- ����� ��ٱ��� ���̺� ����--
create table store_cart (
        str_cart_no number(5),
        mem_no number(5),
        str_pro_no  number(5),
        str_cart_cnt  number(3) default 0,
       primary key(str_cart_no),
    constraint store_cart_mem_no_fk foreign key(mem_no) references member_info(mem_no),
    constraint store_cart_str_pro_no_fk  foreign key(str_pro_no) references store_product(str_pro_no)
);

--������ֹ� ���̺�
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

-- �������� ���̺� ���� --
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
     

-- ���� ��û ���̺� ����--
create table chef_request (
        chef_req_no number(5),
        mem_no number(5),
        chef_req_content varchar2(120) not null,
        chef_regdate  date default sysdate,
       primary key(chef_req_no),
    constraint chef_request_mem_no_fk foreign key(mem_no) references member_info(mem_no)
);


 --�α��� ���� ���̺�
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
 

 

/*�±׿� �̸� ������ �־����*/

 

insert into kind_tag values(10,'�ѽ�');

insert into kind_tag values(20,'���');

insert into kind_tag values(30,'�Ͻ�');

insert into kind_tag values(40,'�߽�');

insert into kind_tag values(50,'�ƽþ�');

insert into kind_tag values(60,'Vegan');

insert into kind_tag values(70,'Quick Food');

insert into kind_tag values(80,'Dessert');

insert into kind_tag values(90,'��Ÿ');

 

 

insert into theme_tag values(11,'�ϻ�');

insert into theme_tag values(21,'�մ�����');

insert into theme_tag values(31,'������');

insert into theme_tag values(41,'���̾�Ʈ');

insert into theme_tag values(51,'����');

insert into theme_tag values(61,'��Ÿ');

 

 

insert into material_tag values(12,'�������');

insert into material_tag values(22,'�Ұ��');

insert into material_tag values(32,'�߰��');

insert into material_tag values(42,'�ػ깰');

insert into material_tag values(52,'ä�ҷ�/���Ϸ�');

insert into material_tag values(62,'��Ÿ');






--������ �߰�
insert into admin_info values(ad_sq.nextval, '����', '01055332218', 'asd@naver.com', 'rhksflwk1', '������,��������,ȸ������', sysdate, sysdate, sysdate);
insert into admin_info values(ad_sq.nextval, 'ȸ��������', '01012341234', 'asd1@naver.com', 'rhksflwk1', 'ȸ������', sysdate, sysdate, sysdate);
insert into admin_info values(ad_sq.nextval, '����������', '01014231235', 'asd2@naver.com', 'rhksflwk1', '��������', sysdate, sysdate, sysdate);

--select * from admin_info



-- ��� ������ --

insert into member_info values(member_info_seq.nextval, 'abc123', 'qwe123', 'A��', '������', '9500112121221', 'abc123@naver.com', '01024434455', sysdate, 'photo_11.png', '�Ϲ�', 5, '�Ϲ���', 10);




/*     ==========   1   ================    */

-- ��� ������ --

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'12341234','12341234','���Ͻ�','���Ͻ�','9111233223200','ab3c1@13233v2er.com',12302239999,sysdate,'photo_01.png','����',20);



-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )
                            
   values(class_info_seq.nextval, member_info_seq.currval , '�̳��� ���������' , 'foodImg_16.jpg'  , 
  '�̳����� ��ö�̶� ���� ���̵� ��ô� �� ������ �ְ��� �丮��ῡ�� �濵�� �丮�������Բ��� �˷��ֽ� ������. �˷ϴ޷� ���� ���� ���� ������ �ƻ�ƻ��� �̳����� �İ��� ����� ��� �� �ִ� �����忹��:)' ,'https://tv.naver.com/v/3038881' , '�̳���,�����, ����丶��, ���ä��,  �ұ�,���, ����ֽ�, ���� ����, ����, �������,����Ʈ�� ���� �ø�����, �ұ�, ����, ������, �Ľ�������' ,  '100g, 150g, 8��, 10g, �ణ, 1.5TS ,1TS, 0.5TS,1ts,2TS,3TS,�ణ,1TS,1TS, 1TS' , '���� �巹�� ��Ḧ �ְ� ����д�,����丶��� ������ ������,���� ���� �ұ��� �ణ �ְ� ���츦 2-3�а� ��ģ��,�̳����� ������ �� ���� ũ��� ��� ������ ��� ��ŵд�,���ÿ� ���⸦ ������ �̳����� ��� ä�Ҹ� �ø���,����丶��, ���츦 �ø� �� �Ա� ���� �巹���� �ѷ�����.', 2000  , '50��'  , '10���̳�', '�մ��ʴ�丮�� ��� �ſ� ���� �� ���� ������.�Ƹ� �ҽ��� ������� �ٷ� ���� �̰� ����� �Ȱǰ� ���� ������ �ϼ��̵Ǵµ� �װ��� �½��ϴ� ����. �Ľ��� ������ �Ǵ��Ⱑ ���Ƽ� �ѷ��� �� �� �� ����� �ѷ����ؿ�. ���� ����� ��¦ �μ�� ������ �� ����ϴٰ� �ϳ׿�~', 20 ,21 ,42 ,  sysdate , 1);



-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )
    
   values(class_info_seq.nextval, member_info_seq.currval , '�����ä ������ġ' , 'foodImg_20.png'  , 
  '�ȳ��ϼ���. Jay�Դϴ�. ä�������ڿ� ���������ڸ� ���ÿ� ������ų �� �ִ� ������ġ �����Ǹ� �Ұ��� �帱�Կ�. ����� ���� �佺�� �ҽ��� ����� <���� ��ä ������ġ>����. ������ �̱��� �İ��� �״�� ����ִ� ������ġ��. ��ä�����δ� �����Ͻôٸ�? ��⸸ ������ ������ġ�� �Բ� ��鿩������. �� �� �Ļ�� ����ϴ�ϴ�.' 
  ,'https://www.youtube.com/embed/qk1Ht_Er-AU' , '��ȣ��,�����̹���,������ī,����,����丶��,�ƽ��Ķ�Ž�,������ä��,�ұ�/����,���� �佺��,�ø������,�߻�� �ҽ�,������,��,�ұ�/����,�߻�ͽ���,�漳��,�ø����,ġ�ƹ�Ÿ' ,  '1��,2��,1/2��,1/2��,10��,2��,�ణ,�ణ,11/2ū��,3ū��,2������,1ū��,1������,�ణ,30g,3.6g,3.6g4��' , '��ȣ���� ������,������ī/����/������ ä���, �ƽ��Ķ�Ž�/����丶��� 3~4���, ������ ��ä�� ���� ���� �㰡��������,������ ��ä�� �⸧�� �θ� �׸� �ҿ��� �븩���� ������ �����ּ���,���� �߻�� �ҽ��� ������ �ؿ�.�߻�� ���ʸ� �� �ҿ� �����ּ���.���� �������� �پ��� �漳��, �ø������ �ְ� �߾�ҿ� �������� ������ �����ϴ�,���� �佺��/�ø������/�߻�� �ҽ�/ ������/��/�ұݰ� ���尡�� �ְ� �����ݴϴ�,ġ�ƹ�Ÿ ������ 2/3 ���� ����ּ���.���� ��ä�� ������ ä�� �׸��� �巹���� �����ּ���.ġ�ƹ�Ÿ�� ���� ��ä�� �÷��ݴϴ�.'
  , 1500  , '150��'  , '20���̳�', '��ſ�� ���� �����ѵ� ���־��.����µ� �ð��� ���� �Ȱɸ��� �ſ� ���ٴ� :)', 60 ,51 ,52 ,  sysdate , 1);
    
      
       
 -- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )   
    
   values(class_info_seq.nextval, member_info_seq.currval , '�����߳� �߰����� (�����߳� ġŲ) ���� �����' , 'foodImg_17.jpg'  , 
  '�߰������� ������ ������ �����Ҵ�ϴ�.�߰������� �õ��ǿ� �׻� �ִ� ����ε� ���� �����ϴ� ������ �ƴ϶� ��ĩ ��ġ�صθ� �����ڿ� �߰��ϰԵǴ��󱸿�. ������ ������ �߰����쵵 ���ְ� ���� �� �ִ� �����Ǹ� �˷��帱�Կ�:)' ,'https://tv.naver.com/v/12082071' , '�߰�����, ��, ����, ���, �ұ�, ����,û��, ����, ����,����, ����' ,  '1��, 1����, 1��, �ణ,�ణ,1TS,1TS,1TS,1TS,1/2TS' , '�߰��� �Ա� ���� ũ��� �߶� �ұ�, ���߿� �������д�,���Ĵ� �ۼ� ��� ��� ���� ����д�,�ޱ� �ҿ� �⸧�� ��¦ �θ��� �߰������� �־� �Ѹ��� �Ͼ�� �ǵ��� ���´�, ����� ����� �ְ� ��¦ �������� ������ ������,���� ���� ��� �߰�⸦ �ø� �� �ҿ� ���� �ҽ��� ����´�,���Ŀ� ����� �ѷ� �������Ѵ�', 1000  , '100��'  , '60���̳�', '��ſ�� ���� �����ѵ� ���־��.����µ� �ð��� ���� �Ȱɸ��� �ſ� ���ٴ� :).������ ���� ���� �ʹ� ���������� �������� ���� �ֱ� ������ �Ѹ鿡 ���� �ٲ�� �ٷ� ��� �ְ� �����ּ���. ��¦ �����ϰ� ���Ƶ� �ҽ��� �ʹ� ������ ������ �� ���� �ҿ� ���� �ҽ��� ���� �� ��! �ѷ��ֽñ���', 90 ,61 ,32 ,  sysdate , 1);
         
         

 -- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )   
    
   values(class_info_seq.nextval, member_info_seq.currval , '������ ����� ������ Ǫ�� <����Ǫ��> ����¹�' , 'foodImg_26.jpg'  , 
  '�ȳ��ϼ���.�̰��� ������ ����� Ǫ��!���������ϰ� ��� ���� �ְ� ������ ���� ���� ���� �־��.������ �ɽ��� ���� �ִ� Ǫ���� ǫ ���� ���Ⱑ ��鿩�� �������� ���ִ� Ǫ���̶��ϴ�.Ǫ���� ��� �� ���⸦ ���ݾ� ������ ���� ��ø� ���� ������.�������̳� ����������� �� �ٸ� ��!���� �Ϲ����� Ǫ���� �������� �����ִµ� �̰� ���� ���� �׳� �������� �Ѹ��� ���̽ô� �� ó�� ��¦ �������� ������ �ʹ´�ϴ�.�ȿ��� �Ϲ����� Ǫ���� ���� �İ��̿���.:)' 
  ,'https://tv.naver.com/v/12003447' , '����,�ް�,����,��ũ��,����,�а���,�����Ŀ��' ,  '100g, 1��, 75g, 50ml, 75ml, 1TS, �����' ,
  '���� ����, ��ũ��, ����, ����� �ְ� ���� �� �а��縦 �ְ� ��ġ�� �ʵ��� �� Ǯ���ش�,����� ������ �����Ѵ�,�����⿡ ���⸦ �ø� �� 1�� ������� �ξ��ش�,180���� ������ ���쿡�� 30�а� ������ �� �����Ŀ���� �ѷ� �������Ѵ�'
  , 1000  , '50��'  , '2�ð��̳�', '���� �ϳ��� ũ�� �����´µ� ���� ���Ų ��� ������ ������ �Ϳ��� �� ���ƿ�.������ �з��̸� �� �κ��̼� ��� �� ���� ������ �ͳ׿�.���̶� �ܿ� �������� �ص�ŵ� ���� �� ���� ^^.���� �ð��� �� 30������ ����ξ��µ� 30�� ���Ѽ� ���� ���ð� 20�� �Ѿ�鼭 ���� �߰��߰� ���� Ȯ�����ּ���.�Ƹ� 20�� ������ �ȿ��� �� �;������Ŷ� ���� ��翡 ���� ������ �ʹ� �;� Ÿ���� ���� �ְŵ��'
  , 80 ,51 ,62 ,  sysdate , 1);
         
         
   

         -- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '<������ �����ҺҰ��> �����' , 'foodImg_09.png'  ,  '��� ������ ã�ٰ� ���� ���� �����Ұ��.�ű��ϰԵ� �������� �ȴ������� ��ĥ�� ���� �Ұ�� ź��.��⿡ ������ �ְ� �������� �׷��� ��⿡�� �ܸ��� �������� �Ұ��.�ٸ� �������� ������ ó�� ���� ������ ������ �Ը��� ���� ������ ���� �ٿ� ����ص� ������ �� ����. �ս��� ���о��� �Ұ�� ������ �������� �е鲲 ��õ�帮�� ������ �丮.���ְ� �ص弼�� :)' , 'https://tv.naver.com/embed/1764850?autoPlay=true' , '�Ұ�� �Ұ�Ⱘ,�ۼ� �� ����,����,����,��������,���⸧, ����,����(ǥ�����, ��Ÿ������, ���̹��� �� �����), ��,����,��������,����' ,  '500g,  1�ָ� ,4TS , 4TS, 2TS ,  1/2�� ,���緮, 3/4�� ,  1TS,  1TS,  2TS' ,  '���Ĵ� �ۼ� ���д�,�Ұ��� �Ұ��� ������ ����� �Ա� ���� ũ��� �߶�д�,��⿡ ���� 4TS�� �ְ� �������� ������ �� ����, ��������, ���� 1�ָ��� �ְ� �������� ���⸧�� �־� �ּ���,���ĸ� ä ���� �� �Ұ�⿡ �ְ� ��������,���� ���� ��Ḧ �ְ� �����,�񳿺� �Ұ��, ����, ����, ���� ���� ���⿡ �°� �ø���,�ҿ� �ø� �� ������ �ξ� ��������.',   1500  , 100,   '60���̳�' , '���� ���� �׳� ���������� ���� ������ �ſ� �ñ��� �����ҺҰ���� �赵 ���� ���ĸ� ���� ���� �͵� �ƴѵ� �̷� ���� �������ű��� ������ ��������ǥ �Ұ�� Ȳ�ݷ�����.������������ �и� ���� ������ ���µ� ���� ���� ���� ���� ���� ���� ���� ����.��⸦ ���� ����� �ʾƵ� ��� �Ͱ� ���� ���� ���� ����.������ ���� ���� ������ �����µ� ��ġ������ �ִٸ� �� ��� ����� ���� �����ִ� ���� �� �� �ִ�.', 10 ,31 ,22 ,  sysdate,1);


     
     
   

 -- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '��¡����ħ �湫���' , 'foodImg_33.jpg'  ,  
   '�ȳ��ϼ���.������ �������� ��� �����Ǹ� �÷����ƿ�.���� �ſ� �����ϴ� ����� �ٷ� �湫����ε��� �ƹ����� �� ��ħ ����Ⱑ ���ŷο��� ������ �ظԱ⺸�ٴ� ������ ��Դ� �޴� �� �ϳ����ŵ��.�� ó�� �� ��ħ ����Ⱑ �δ㽺����� �е��� ���� �����Ƕ��ϴ�.���ְ� �ص弼�� :)' 
   , 'https://tv.naver.com/v/9428813' , '��¡��,�簢�,��,�����,���⸧,�ұ�,���尡��,����,����,������,�ø����,��������,���� ��,���⸧,���' ,  '1����, 1.5��, 2����, 2��,2TS, 0.1TS,2.5TS, 1TS, 1.5TS, 0.5TS, 3TS, 0.5TS, 2TS, 0.7TS, 0.2TS' 
   ,  '���� ��� ��Ḧ ����д�,��� �����ϰ� ��� ���� ���� ��¦ ��ģ �� ������ ��� ������,��¡��� ���� ���� ��ġ�� �Ա� ���� ũ��� ���,���� ���⸦ ������ ��¡��� �, ����� �ְ� �� ��������,���� ���� 6������� �ڸ� �� ���� ���� �־� �����ְ� ���⸧�� �ұ��� �ҷ� ���� ���⸧���� ����� ���̳���.',   
   1500  , 100,   '90���̳�' , '�湫����� �뿵�� ���ΰ� �ٵ� �ƽ���?�뿵�� �湫�� �Ҹ��� �ñ⿡ ������̸� ������ ������ ���� �� �Ƴ��� ���� �Ϳ��� �����Ǿ��ٰ� �ؿ�.�Ϲ����� ���� �޸� ����Ḧ ���� ��Ƴ��� ������ ���� ������ �ʾƼ� ����ö�� �ظԱ� �� ���� �� ���ƿ�.������ ������ ������ ��½ ����� ��ħ.������ ������� ���ְ� �ص弼�� ^^', 
   10 ,11 ,62 ,  sysdate,1);
      
         
         
         
         
         
         
         
         
         
         
         
         



/*     ==========   2   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'12345','12345','���ѽ�','���ѽ�','9011230523200','ab3c1@13d23v2er.com',12312225999,sysdate,'photo_02.png','����',10);


-- Ŭ���� ���� ��� ������ --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info  ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime , admin_app )
       
   values(class_info_seq.nextval, member_info_seq.currval , '�α�丮 �������̽� ��� �����' , 'foodImg_01.png'  , 
  '���� SNS���� �� �� �丮��� �̹������� �˷��־��µ� �ѳ��� ó�� ���� ������.�̸��� �ű��� �������̽� ����� ����� ���Ҵ�.ã�ƺ��� �� ����� ������� �÷�Ʈ��� �Ϻ� ��ȭ���� ������ ����̶�� �Ѵ�.�и� �Ϲ� ������� �����µ� ������ ���� ���.�׷��ٰ� �������� �� �ƴϰ� ������� �Ϲ� ����� �߰� ��򰡿� �ִ� ���,�ñ��� ��� �������̴� ���� ����� �����ôٸ� ���� �ٷ� �����ص�ź����� :)' ,'https://tv.naver.com/embed/1992437?autoPlay=true' 
  , '«�Ͷ�� �Ǵ� �ſ� ���,��,���,�����̽� ġ��,���,�ۼ� �� ����,�谡��' ,  '1��,2��,1��,1/2��,����,����,����' , '�� 2�ſ� ��� ���� 1/2���� �ְ� ���δ�,���� ��������� ��� �ķ���ũ�� �ְ� �߰��߰� ���������� ����� ���� �� ������ ���Ƶ� �� ���� ���δ�, �� ����� Ȩ�� ���� ����� ���߷� �ְ� ���ĸ� �Ѹ� �� �Ѳ��� �ݾ� �ݼ����� ������,�ҿ��� ���� �� �����̽� ġ�� 1/2��� �谡��, ����� �ѷ� ������ �Ѵ�.', 500  , '50��'  , '10���̳�'
  , '������ ��Ÿ���� �� �˰� ���� ���´µ� ������ ���°� �ƴ϶� ���� ���� �ʿ���� �� ����.��¡�� «�� ������� ���ְ� �ظԾ��µ� �ٸ� ������δ� �� ���� ���� ���� �ſ� �ñ��ϴٴ�...SNS���� �α���� ���� �����Ǵ� �ظ��ϸ� �ǽð����� �ظԾ�µ�  �̰� �� ������ �˰Ե� ������...?!?!����� �ֱٿ� ���� �ȸԾ��µ� ���������� ���� �鼱�� ��� ��� �̹��� 9��ȣ (����� �丮���) ���� �Ϸ� �ǳ� �Ϸ� �����԰� �ִ� �� ����.', 
  30 ,11 ,62 ,  sysdate , 0);
         




-- Ŭ���� ���� ��� ������ --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '����ٳ����佺Ʈ/������ġ �����' , 'foodImg_02.png', 
                          '������ ����ö�� �������� ���� �� �ص�ž� �� ���ڵ��� ���ִ� �丮�� �ϳ� �Ұ��ص����.������ Ƽ ������ġ��� �������ص�ȴ� ���� �ִµ� �ణ ������ ���� �ٳ���, ���� �佺Ʈ �Ǵ� ������ġ :).����� �ƴϴ� ������ġ��� ���ϴ°� �� ���� �͵� ���� ���̳׿�. ��ᵵ �����ϴ� ���ִ� ������ġ. ����ö ���� �Ŀ� ��ȸ���� ���� ���� ���� �ص�ź��ſ� :)' 
                          , 'https://tv.naver.com/embed/2596306?autoPlay=true' , '����, �ٳ���, �Ļ�, ���ڽ�������', '2-3��,1��,1��,1-2TS' ,'����� �ٳ����� ���� �β��� �����̽� �Ѵ�,�Ļ� ���� ���ڽ������带 ��ƴ���� �ٸ���,�����̽� �� ����� �ٳ����� �ִ��� ������ ������ �ʰ� �ٿ��ش�,�׵θ��� �߶󳻰� �Ա� ���� ũ��� �߶󳽴�.'
                          , 500  , 100,  '10���̳�' ,'���� 10���̸� ����� �ʰ��ܿ丮.�ٰ��� �߷�Ÿ�ε��� ���� ���� �丮�ε� ���� ������ �丮 �� ����� �ٳ����� �ƴϾ ������ �����ϴ� ���� Ȱ���ϼż� �پ��� ������ ���ְ� �����ſ� ^^',
                          
                          70 ,51 ,62 ,  sysdate,0);
              
                     
                     
                     

-- Ŭ���� ������ --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '���� �ʰ� ����� ����ġ������ũ' , 'foodImg_19.jpg'  , 
   '���������� �־� ���� ���� ġ������ũ ������!������ ��� ���ΰ� �ȳ��� Ȩ����ŷ ������ Ÿ��!���������� �ƴϿ��� �پ��� ������ �־� ���� ���ƿ�:)' , 'https://www.youtube.com/embed/jNy35qNEjQk' , '������,���� ��������,ũ��ġ��,�÷��ο��Ʈ,��ũ��,������,������ƾ,�����ǻ��,����ǻ��,����,������,������ƾ', '6��,25g,200g,���� 80g,100g,200g,2ū��, 7g,60g,  60g,  20g,  5g,  5g' ,
   '�������� �߰� �ν� ���� ���͸� �ְ� �� ���´�,Ʋ�� ��Ű������ �ְ� ��Ǭ�̳� ������ �ڲ� ���� �ٴ��� ���� �� ����� �־� ������,���� �������� �غ��ϰ� ������ƾ�� ���徿 �ְ� �Ҹ���,���� ũ��ġ� �ְ� ��ǰ��� ������ Ǯ�� ������ �ְ� ���´�,�÷��ο��Ʈ�� ��ũ���� �ְ� ���´�,�������� �Ҹ� ����ƾ�� ���� ���⸦ ¥�� �� 2T�� �ְ� �������� ���δ�,ũ��ġ�� ���׿� ���� ����ƾ�� �ְ� ���´�,��Ű�� �� Ʋ�� ũ��ġ�� ������ 1/2�� ä��� ���� ���� ������ �߾ӿ� �־��ش�,�� ���� ������ ũ�� ġ�� ������ �ξ��ְ� ������ �����ϰ� ���� �� ����� �־� 2�ð� �̻� ������,���� ġ������ũ�� �߰ſ� ���� ���� ���� ������ Ʋ �ֺ��� ���� ���� �� �� Ʋ�� �и��Ѵ�,����ũ�� ���ÿ� �Ű� �ϼ��Ѵ�.'
   , 1000  , '200',  '60���̳�' ,'[��!][�̸��غ��ϱ�]1>ũ��ġ��� �ǿ¿� �д�.2>�������ʹ� �쿩 �غ��Ѵ�.3>������ �غ��Ѵ�.4>12cm ������ �� ���ʸ鿡 ���� ���� �غ��Ѵ�.[�����غ��ϱ�]��/ ü/ �Ǹ����ְ�/ 1ȣ ����Ʋ(15cm ���� 7cm)/ ��ǰ��/ 12cm������/ ��'
   ,80 ,51 ,62 ,  sysdate,1);
                
                

-- Ŭ���� ������ --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '��������� ��߱���' , 'foodImg_21.jpg'  , 
   ' ��߱��� ����¹� �� �˷��帮���� �ҰԿ�. ���������̾ �����ôٸ� ������ �ѹ����� �� �Ծ�������� ġŲ�丮!!���� �׳� �������� ��ͼ� �ұ� ���� �Ѹ��� ������ ���ݾƿ� �׷��� �� �̳� ���� �Ѹ����� ���� �־��׿�.)' ,
   'https://www.youtube.com/embed/hEkTDP7cSnk' , '����,�ұ�,����,������ī ���򺰷�,����,���,����� ����', '1����,����,����,1/3����,1/2��,1/2��,����' ,
   '���� ������ �����ϰ� �ľ��ּ���,�ұݰ� ���߸� �ѷ��ּ���.�̶� ���� �յڷ� ������ ���鼭 �ѷ��ּ���,1�� 180������ 25�� �����ֽð�� �׸��� ����� �ٽ� 25��!!�⸧�� �ʹ� ���� ������ �߰��� ���� ȣ���� �ѹ� �����ּ���. �� ���� ���������� ���� �µ� 180������ 10�и� �����ָ� �ٻ��ϰ� ���ִ� ��߱��̰� �ϼ��ȴ�ϴ�.'
   , 3000  , '200',  '60���̳�' ,'[��!]���������̾ ���� ���� ȣ���� ���� ����ָ� �������ϱ� ���ϴ�ϴ�:)'
   ,90 ,11 ,32 ,  sysdate,1);
                          




-- Ŭ���� ������ --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '������ �κι��� <��ġ ���κγ�ä> ����¹�' , 'foodImg_27.jpg'  , 
   '�ȳ��ϼ���~~������ �������� �����ϰ� ������ ���� �����Ǹ� �ϳ� �˷��帱�Կ�.��ä��� �����Ȼ��ϴ� �ʵ��Ը��� ������ �ſ� �����ߴ� �����̶� ��������Ͻô� �е鲲 ���ߵ帮�� �����Ƕ��ϴ�.���� ū ��븦 ���ϰ� ���� �׷��� �� ���־��� �� ���ƿ� ������������ ���κη� �ظ��� �丮 �߿� ���ĵκθ� �����ϰ�� ž�� �ƴұ� �;�� :)' ,
   'https://tv.naver.com/v/10769167' , '���κ�,���� ��ġ, ���⸧,����,���,����,����,����', '1/2�� �Ǵ� ���� �� 1��, 2TS,����, ����, ����,0.5TS, 0.5TS, 0.5ts' ,
   '���� ��� ��Ḧ �ְ� ����д�,��ġ�� �߰� ������ ���Ĵ� �ۼ� ���,���ÿ� ���κθ� ��� ��ġ�� �ø� �� ����� ����� �����ڸ��� �Ѹ���,���Ŀ� ����� �Ѹ� �� ���⸧�� ���� �ѷ� �������Ѵ�.'
   , 1000  , '50',  '5���̳�' ,'5���̸� ���� �� �ִ� �ʰ��� ����.������ ���� ���� �� ���־��~�մ� �ʴ������ ����� ��� ���ÿ� �κ�, ��ġ, ���ı����� ��Ƽ� ���庸���ϼ̴ٰ� ���� ���� �ҽ��� ��� �ѷ����ø� ���� �� ���ƿ�:)'
   ,70 ,41 ,62 ,  sysdate,1);
                          
                          
                          
                          
                          




/*     ==========   3   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'111','111','���','���ֺ�','9121235223200','ab3c1@13s323v2er.com',12312209999,sysdate,'photo_03.png','����',30);



-- Ŭ���� ���� ��� ������ --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '������ �־� ������ <��� ���κ��> �����' , 'foodImg_03.png'  , 
                          ' ����� �־� ���� �� ���� ������ ���κ��.��¦ ĮĮ�ϰ� ��ð� ������ �е��� û����� ���� ���־ �ſ� ������ �� ����.���� ���� �ʿ����� ������ ���� �������� ���� �԰��� ����� ���� ����� ��� ��� ���κ��.� ���̱� ������ ���� ���� ������ �׷��� ���� ������ ����� ���Ͻ� �е鲲 ��� ���κ���� ��õ ����� :)' , 'https://tv.naver.com/embed/1788324?autoPlay=true' , '��,�ٽø�,���� ��ġ,���κ�,����,����,����,û�����,�������,���Ұ��� + ��,������,��������' ,  '3��,8*8cm 1��,10����,1��,1/2��,2-3��,1/2�� , 1�� (�ɼ�),4TS,1TS+(��) 2-3TS,1TS,0.5TS' ,  '����� �ٳ����� ���� �β��� �����̽� �Ѵ�,�Ļ� ���� ���ڽ������带 ��ƴ���� �ٸ���,�����̽� �� ����� �ٳ����� �ִ��� ������ ������ �ʰ� �ٿ��ش�,�׵θ��� �߶󳻰� �Ա� ���� ũ��� �߶󳽴�.',  500  ,  150, '30���̳�' ,'���� ��� �巯�� ���� ���� �Դ� ���ε� ������ ������ ���� �԰� �; ���Ұ��縦 ��� �־��־���.��ȣ�� ���� ���Ұ���� �־ �ǰ� ���� �Ǳ� ������ ���� ��� �� ���� ��� �־���� �ƴϸ� �ѵ��̷� �� ���Ĺ��� ���� �ִ�', 10 ,21 ,52 ,  sysdate,0);
            
            
                        

-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
 values(class_info_seq.nextval, member_info_seq.currval , '�ö�� ���̽��� �ɾ��� �����' , 'foodImg_15.png'  ,   '�ȳ��ϼ���. ������ ���� ��̳� �丮�� �Ұ��غ��Կ�.. �Ŀ� ������ �� �ظ����� ����ϴٰ� ������ <�ö�� ���̽���>.���̽��� ����Ŀ�� �Ŀ���� �ְ� ����ֽø� �Ǵ� �ʰ����� �丮..?���ϴ�.���ְ� �ص弼�� :)' , 'https://tv.naver.com/v/14630653' , '����, �Ŀ��, �Ǹ��� ���̽��� ����, ���� ���� ����, ����' ,  ' ���緮,  �ظ�����ŭ,  �Ŀ�ɾ縸ŭ,  ���۱׸��غ�!,  �����غ�!' , '����Ҹ��� �Ŀ� ���� ��� �� �ٱ�� ���� �����Ѵ�,������ ���� �ְ� ���Է� ����� �󱺴�,���̽��� ���忡 ���� ��´�, �Ŀ� ���� ����� �ø���,�Ǹ��� ������ �Ѳ��� ���� ���� ä���ִ´�,������ �Ѳ��� ���ܳ� �� �ǿ¿� ��õξ� ������ �쿩����.', 1000   , '100,'  , '60���̳�','�Ը����� �� �ɾ����� �Բ� �ص�ñ� ���� �� ���ƿ� :).���� ����� Ʋ�� �񽺹ٹ� �Ǹ��� �����̰� �������� �Ǹ��ܵ� �ܴ��ϰ� �ٸ� ���庸�� �� �ִ� ������ Ŀ�� ���� ����Ⱑ ���� �� ���ƿ�. :)', 90 ,61 ,62 ,  sysdate,1);




-- Ŭ���� ���� ��� ������ --
insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '��ȸ/��ȸ����� �����' , 'foodImg_22.jpg'  , 
   
   '���� ��¥ �ʰ����ΰ�����.����� ��ħ �������δ� �ÿ��� �ٶ��� ���� ����� ���Ը����ϴ�.�������� ������� �ִµ���.�� ������� ��������� �뷡�θ��� �丮�� �־��.�ٷ� ��ȸ������ε���. ��ħ ���� ��ȸ�� �԰�;��� �Ͷ� ����� �Ǿ���ϴ�.��ȸ�� ���鶧 �� ���ְ� ����� ���� ����帱����.�׸��� ��ȸ�� ����� ������ ��ȸ��������� �ߴµ� ���� �ܸ��̴��󱸿�.�°����� �����ϸ鼭 Ǫ���ϰ� ���� ��ȸ�� ��ȸ����� ����� �����Ҳ���. ' 
   , 'https://www.youtube.com/embed/2WVTNv-T8WA' , '��л�,��,����,�ް� �븥��,����ұ�,����,���⸧,���߱⸧,������,���� ����,���� ��,��ȸ,����,��� ä��,����,������,�ø����,�Ž�û,����,���⸧' ,  
   '400g,1/2��,�ణ,1��,1T, 30g,1.5T,0.5t,�ణ,0.5T,0.5T,�ణ,3��,�ణ,�ణ,3T,2T,1T,1T,1T' , 
   '���� ���������� ��л��̳� ȫ�β����� ��ȸ������ ��������.��� 400g�� ŰģŸ������ �͹��� �������ּ���,����ұ�/����/���⸧/���߱⸧�� �־��ּ���,����ѿ� �ְ� ����ǿ��� 2�ð����� �νø� ���� ���ƿ�.�ƴϸ� �õ��ǿ��� 30�а� �νø� �� �ÿ��ϰ� ���ְ� ��Ǽ� �ִ�ϴ�,���� �踦 ä����ּ���,�踦 ��� �� ���� ��ȸ�� �ø��� �����κ��� �����ϰ� �ϼž� �븥�ڸ� �ø��� ���ƿ�.�븥�ڸ� �ø��� �������� ����ϸ� ���ִ� ��ȸ��,���߿� ��� ������ ������ �ľ ���⸦ �������ּ���,���� ���ߴ� �Ա����� ũ��� ����ּ���,������ ����� ����� �ٲ���. ������/,�ø����/�Ž�û/����/���⸧ ���ְ� �� �����ּ���,�׸��� ���� �ְ� �� ���� ��ä�� �÷��ּ���.��� �κп� ��ȸ�� ��� �� ���κп� �������� �־��ּ���.���������� �븥�ڸ� �ø��� ��ȸ����� �ϼ��̶��ϴ�.',
   2000  ,  100, '60���̳�' 
   ,'��ȸ ����� �߹�� �ϴ� ����� �ٷ� ����ұ��̶��ϴ�.���ڰ� ��� ����� �� ��� Ư���� �־��. ���������� ���߱⸧�� ������ ����� ĮĮ�Ѹ��� �� ��������.'
   , 10 ,21 ,22 ,  sysdate,0);
           

-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
 values(class_info_seq.nextval, member_info_seq.currval , '������ <ũ���� ���� ��Ʃ> �����' , 'foodImg_23.jpg'  ,  
 '�丮�� ���� �� �� �ؿ��ٺ��� �� ���ϸ� ���� �� �ִ� �丮�� ���� ������ ���� �丮�� ������ �� �ִµ� �ϴ� ������ �ְ� �Ǵ� �����Ǵ� ������ Ȯ���� 0.000001% ������� ���� �ȴ�. ��� �� �����Ǵ� �״�� �����ϸ� ���� �������� ���� ������.�������ε� ���� ���̵�ε� ���� �����ַ� �ܵ����� �Ծ ���� �丮.���� �����Ͻô� �е��� ������ �Ծ ���ְ� ���� �����Ͻô� �е��� ������ ���Ծ ���ְ�� �� ���ζ�� ���� ��� �Ծ ���� ���ִ�.ũ�� ��Ʃ������ ũ���� ���� �׷��� ���� ���� �ʰ� �������� �� �������� �� ����ִ� ������ :)' 
 , 'https://tv.naver.com/v/2515725' 
 , '����, ������ ���� ����,����,���� ����,�ۼ� �� ����,ȭ��Ʈ ����,ġŲ��Ź,������,��ũ��,���� �Ľ���' ,  ' 500-600g,  1.5TS,  2TS,2TS,  3/4��,  3/4��, 3/4TS,  4TS,  ����' ,
 '������ �ұݹ��� �־� �ذ��Ѵ�,���� �ޱ��� ���� 1TS�� �ְ� ���� �� �������ð� �ۼ� �� ���ĸ� �ְ� ���� ��������, ������ �ְ� �� 5�а� ���´�,ȭ��Ʈ���ΰ� ġŲ��Ź�� �ְ� �����ø� �� ���� ���̰� ������ ��� ���� ���� �� ���� ���δ�,�ҿ��� ���� �� ������, ���� 0.5TS, ũ���� �ְ� ���´�,���� �Ľ����� �ѷ� ����.'
 , 1500   , 100  , '2�ð��̳�','���߿� ������µ��� �ѳ� ��Ÿ��ƽ �ߴ� ������Ʃ.����丮���� ������ �񽺹����� ���̶� ��ҿ� ũ�� �丮�� ���������� ���� �������Ͻô� �е��̶� �δ���� ��� �� �����ſ���.',
 20 ,21 ,42 ,  sysdate,1);



insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'2222','2222','�����','����','9132230225200','ab32c1@23s323v2er.com',12322355999,sysdate,'photo_04.jpg','����',40);



-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime, admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '���޴��� ���ִ� �߱��� �߰��丮 <������> �����' , 'foodImg_04.png'  , '������� �߱��� �߰�� �丮, ��Ȯ���� ��Ƣ��丮�̴�. �����ϸ� �⸧�� �Ѹ� �߰���� �ϴµ�,�߰�⿡ ������ ���� �ٻ��ϰ� Ƣ�ܳ� �� �����/ ����/ ������ �ҽ��� �Բ� ��鿩 �Դ� �丮.������ ����� �Ա⿡�� �δ㽺���� �ʰ� �ٻ��� Ƣ��� ������ �ҽ��� ��췯���� ���� ��ǰ�̶�
�츮 �Ը¿��� �� �´� �� �丮. ����� ���ʰ� �� �ҽ��� ���� �Ը� �����⿡�� �ְ�� ������ ó�� �Ծ ���� ���� �丮�� ���⿡�� ����. ��ĥ ����� ���� ����� �޾ƸԴ� ���ڱ� �޴��� ���׷��̵�Ǵ� �ſ� �����ߴ� ���� ���������� ��Ź�� ���ְ��� �е鲲 ��õ �帮�� ������. ���ְ� �ص弼�� :)' , 'https://tv.naver.com/embed/2164811?autoPlay=true' , '�ߴٸ���,�ʸ�����,û�����,ȫ����,�����,���а���, ����,�� ����,û��,�ұ�,����,���� �� �κ�, ���� �����̽�, ����,����,����,��' ,  '300g,6��,2��,1��,3��, 2/3��,1/2TS,1/3ts,1TS,�ణ,1��,1��,3TS,2��TS,2TS,2TS' , '�Ŀ� ���ߴ� �ۼ� ��� �غ��Ѵ�,���� ���� �߰�� �����Ḧ ���� �� �߿� �ְ� �������д�,���� �ҽ� ��Ḧ �ְ� ���� �ҽ��� �����,�߰�⿡ ���а��縦 ���� �� ����鵵�� ��� �д�,�Ķ����ҿ� �⸧�� �ޱ� 4�� �߰�⸦ �־� �� �ڷ� ������� ������ Ƣ���,1���� Ƣ�� ���� �⸧���� �÷� ��� �����ٰ� �µ��� ���� �⸧�� �־� �ٽ� �� �� �븩�ϰ� Ƣ�ܳ���,���ÿ� ������ ����߸� ��� �ø���,�� ���� ���� �߰��, �ʸ�����, û�����, ȫ���� ������ �ø��� �ҽ��� �ѷ� ������ �Ѵ�', 3000  , 50,  '90���̳�', '���� ��� �巯�� ���� ���� �Դ� ���ε� ������ ������ ���� �԰� �; ���Ұ��縦 ��� �־��־���.��ȣ�� ���� ���Ұ���� �־ �ǰ� ���� �Ǳ� ������ ���� ��� �� ���� ��� �־���� �ƴϸ� �ѵ��̷� �� ���Ĺ��� ���� �ִ�', 40 ,21 ,32 ,  sysdate,1);
                          



-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime, admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '�丶�� ��������Ʃ' , 'foodImg_24.png'  , '����ҽ��� �丶��ҽ��� ���� ��Ʃ!��Ʃ�� �ֹ����� �β��� ����� �����߼ӱ��� �����ϰ� �ε巴�� ����� �־��!' 
   , 'https://www.youtube.com/embed/k8H3vUNxB_c' , '��������,����,������,���,����,����,Ȧ�丶��,������,��,��Ʈ������,û��,�Ŀ���,�ұ�,����,�ĸ���ġ���' ,  '600g,10��,1��,1/2��,1��,1/2��,1+1/2������,1������,1������,4��,2������,�ణ,�ణ,�ణ,1/2������' 
   , '��������� ������ �㰡 �͹��� �����Ѵ�,���� ���� û�� 2�������� �ְ� ���� ������ �󱺴�,���� 3���� ������, ���, ���ڴ� �Ա� ���� ũ��� ���,���Ĵ� ���� ������,���� �Ŀ����� �θ��� �������� �ְ� �Ѹ鸸 �븩�ϰ� ���´�,���� ����, ���� ����, ���, ����, ��Ʈ������, �������� �ְ� ���´�,Ȧ�丶��, ������, �� 1�������� �ְ� ���δ�,����Ʃ�� ���� ���� �ҿ� �Ŀ����� �˳��� �θ��� �븶���� �븩�ϰ� �� �ҷ� ������,��Ʃ�� �ϼ��Ǹ� �븶��, �ĸ���ġ���� ��� �Ѳ��� �ݾ� ġ� ��¦ ���δ�,���߸� �ѷ� �ϼ��Ѵ�.',
   1500  , 100,  '60���̳�', '[��]!Ȧ �丶�� ��� �丶��ҽ��� ����� ��� 2/3���������� �з��� �ٿ��ּ���', 20 ,31 ,12 ,  sysdate,1);
                          





-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime, admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '20�� �ϼ�! �ұ��� �����' , 'foodImg_32.jpg'  , '���غ��� �����ϱ� ������ BBC ��Ǫ�� ������ �����ִ� ���ֽ��ٴ� �ұ��� ������.�鵵 ���̼����� ���� �������̶� ���� �ұ����� �Ƿ��� �ǹ��������µ�, �����ߴ� ������ ���� �ٸ��� ������ ������ �ұ����� �ϼ��Ǿ���' 
   , 'https://tv.naver.com/v/2792941' , '���̼���,�Ұ�� ������, ǥ�����,����,���� �����,����,���� ��Ź,ȫ����,��Ÿ�ƴϽ� (�Ȱ�) ,���⸧' ,  '50g, 100g,1-2��, 1��,1TS, 4ts, 350ml, 1/2��,1��, ����' 
   , '���� ���� ���� �� ���� ���� ���̼����� �־� 3�а� �Ҹ���,���� ������ �󱸰� ü�� ���� ���⸦ ������ �� ���⸧ ������ �־� �������д�,�Ұ��� ���� 1ts�� �ְ� ����д�,ȫ���ߴ� ��� ��� ������ �����̽� �ϰ� ���Ĵ� ��� ���д�,������Ź�� ȫ���߿� �Ȱ��� �ְ� ���� ������ ���´�,�⸧�� ��¦ �θ� �ҿ� �ذ��� �Ұ�⸦ �־� �ְ����� ������� ���ٰ� ������ �ְ� ���´�,���� ��� ��� �� ����, ���� ���, ���� 3ts, ���߸� ���� �� ������ ���߸� �ξ��ش�,���� ���� ������ �־� ������ �Ѵ�',
   3000  , 50,  '20���̳�', '������Ź�� �׻� ��Ź�� ����ߴµ� ������ ġŲ��Ź�̰� ������Ź�̰�,���ϱ⵵ ����� �����̶� ����ϱ⵵ ������µ�,������ �׻����� ���ͼ� ���� ���ϴ� �󵵷� �־� ���� �� ������ �ѳ� ���� ��!�귣�庰�� 2-3 ������ �ִ� �� ������ ������ ��Ʈ�� �� ���̷� �ڳʸ� �� ã�ƺ��ſ� :)',
   50 ,41 ,62 ,  sysdate,1);
                          




/*     ==========   4   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'321','321','��������','����','9123215223200','ab331@13s1323v2er.com',12342201999,sysdate,'photo_05.jpg','����',10);



-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , ' <�ؼ���ҽ� ���챸�� ����>�����' , 'foodImg_05.png'  , 
                          '��ǥ���� �߱� �ҽ� �� �ϳ��� �ؼ��� �ҽ��� �߶� ������ ��� �ڿ� ���쿡 ���� û��ä�� �Բ� ���� �丮�ε� ������ ������ �׷����� �ѱ׸� �丮�� �ְ��̴�. �׳� ��⸸ �����Դ� �� ���� �⸧�� �� �� �� ���� ��ä�� ������ �ǰ����� �Դ� �� ���� �������� ��� �丮. ��� ��信 ���� �ؼ��� �ҽ��� ����� hoisin �̶�� �θ��µ� �ణ �޴��ϸ鼭 ¬�ɸ��ϱ⵵ �ϰ� �ε巴�� �� ������ ���尰�� �����̴�. ' ,'https://tv.naver.com/embed/2158819?autoPlay=true' , '����,û��ä,��,����,ȫ����,��,���,�����,���⸧,�ؼ��� �ҽ�,����,���� ����' ,  '350g,2��,1/2��,2��,1/2��,2����,����,�����,1/2TS,4TS,1TS,1ts' ,'���� ��� ��� ��Ḧ �ְ� ����д�,���쿡 �ҽ��� �� �ڷ� �߶� �ּ� 3�ð� �̻�-�Ϸ� ����,2�� �����⿡ ��� 190���� ������ ���쿡 �־� �߰��� �� �� ������� 25-30�� ���� ������,û��ä�� 1/2-1/4������� �ڸ��� ������ �� ���,���� �ҿ� û��ä�� ����, ���� �ְ� 3-4�� ���� ���� ������,���ÿ� ���� ��� �� ���� ���� ������ ��� �ø� �� û��ä, ������ �ø��� �ۼ� ���� ȫ����, ��������� ����� �� ����� �ѷ� ����.',  2000  ,  200,  '60���̳�'  , '�ؿ� ��α� �����Ǹ� �����ߴµ� �� �����ǿ� �ִ���� ����� �� Ÿ�� �� �ؼ� ���� �ð��� ���� �����ؼ� ����ξ���. �츮�� ������ ��� 190������ �� 25���̸� �� �������� �� ���� �� �����ǿ��� �׳� ȣ�ϱ�� ����� �Ǿ������� �׷��� �ϴ� ��Ⱑ ���� ������ ������ �־ ���� �ҽ��� �Բ� �����⿡ ��Ƽ� ����� �� ���ְ� ��������. ȫ���߿� ����� ���ٸ� �����ص� ����� ���µ� ����� ���� ���� Ȯ �޶����� ��� �� �ִ� ���̽ö�� ��õ �帰��.', 50 ,11 ,12 ,  sysdate,1);




-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '���� ���� �ߺ����� ����� <�з¼ܴߴٸ��캺����> ������' , 'foodImg_28.jpg'  , 
   '������ ���ῡ �ٷ� �ص�� �� �ִ� ������ �ѽ� ������ �ϳ��� �˷��帱�Կ�.�� �ߺ������� ����� ���ؼ� �ʿ��� ���� �ϳ� �ִµ���.�װ� �ٷ� �з¼�!���� ���� ���� �ʴ��� �׸��� ���� ������ �ʾƵ� ��ä�� ��Ⱑ ǫ �;��.Ư���� ������ �ϳ��� ���� �ʾҴµ� ���� �������� ��ū�ϴ� ���ִ�ϴ�.���������� ���� ��������� ���� �����ϴµ� �̰� �ٸ���θ� ���� �� ���ƿ�.��ġ�� ���Ͻô� �ٸ� ������ �ִٸ� Ȱ���ϼŵ� ��� �����' 
   ,'https://tv.naver.com/v/5585452' , '�ߴٸ���,����,����,���,��,��,������,���尡��,��������' ,  '4,1��,1/2��,1/2��,1��,1/2��,2TS, 1ts,���� 1/2ts, 1ts' 
   ,'������� �̸� ����д�,��ä�� ŭ���ϰ� ��� ���Ĵ� 5cm ���̷� ��� �ߴٸ����� 4����Ѵ�,�з¼ܿ� �߰� ��ä�� �ְ� ����� ������ �� �����δ�,�Ѳ��� ���� ��-�� �ҿ��� ���̴� �߰� �︮�� ��ҷ� ���� 15�а� ���δ�,���� ���� �� �Ѳ��� ����.'
   ,  1500  ,  100,  '2�ð��̳�'  , '��ä�� �� ���� ���ķδ� �� Ų �� ���� ���ϳ� ������� �ʰ� �丮�� �ϼ��߾��.����� �����ôٸ� ������� �ϼŵ� ������ �� ���׿�.'
   , 10 ,11 ,32 ,  sysdate,1);





-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '<���Ű��/��߳���> ����� ��' , 'foodImg_30.jpg'  , 
  '���� ������ ����� �����ϰ� ���� �� �ִ� �Ϻ��� ������� ����.���Ű���� �����Ҿ��.�Ϻ����� ��� ������ ���Ѵٰ� �ؿ�.�߳��� ���´ٴ� ���� ������ �ֱ���.������⸦ �������� ��信 ���� �丮�ε� �� �丮�� ������ �Ǿ����� �Ϲ����� ���Ű�� �� ���� ��⸸ ���Ϳ�.�̰��� �� ���� �ö����� ���Ű <�� (���θ�)> �� �Ǿ���ϴ�. ���ְ� �ص弼�� :)'
  ,'https://tv.naver.com/v/4305249' , '��,���л��� �Ǵ� ������� �մٸ���,����,�����,û��,����,����,�̼ҵ���,���� ����,��������,���尡��' ,   '1����, 100g, 1/2��, 3��, 1TS, 1/2TS, 1ts, 1ts,1/4ts , ����,  ����' ,
  '���Ŀ� ����ߴ� ä ���,��� ���� �̸� ����� �� ������⿡ �־� ��������,�ޱ� �ҿ� �⸧�� �θ��� ���ĸ� ���´�,������⸦ �ְ� ��Ⱑ ���� �� ���� ���� ���´�,���ÿ� ���� ��� ����߿� ��⸦ �÷� ������ �Ѵ�.'
  ,  1000  ,  100,  '60���̳�'  , '�� �����ǿ��� ������ ������ ���µ� ���� �������縦 ����߾��.������ ��� �Ϻη� ���� �����ǿ��� ���� ��� ���� ����ص� �������󱸿�.���ݾ� ������ �ʰ� �ƹ����� ���� ��� ������ �ֱⰡ ���� ��� �� �ϳ��� ���� �� ������� ���� �� ���� ���� ���� �� ���� �� ������ ����� ����ϴ� �ſ� ���ؿ�.�� �� �����ø� ���ŵ� ������ �׷��� ���Ű���� �ƴϴ� ������ ���� ��õ����� ����.���� ������� ���� �����ϰ� ���ִ� ���� �ѱ׸� �ص弼�� ^^'
  , 30 ,11 ,12 ,  sysdate,1);







-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '������ ���� ��Ⱑ ���� <�߱��� ������ (aka. ���ھ�)> �����' , 'foodImg_31.jpg'  , 
  '������ �丮�� �������� ���ִ� ���� �丮.�Ƹ� ���� �������� �ʴ� �е鵵 ���ְ� ��� �� ���� ������ �ʹ�.���� �ҽ��� ����� �߱��� �����丮�� �� �丮�� ������ ���ð澾�� ��ۿ���<���ھ�>��� �̸����� ����ż� �Ƹ� ���̵� �ص�ź����� ���� ���� �� ����. ���ְ� �ص弼�� :)'
  ,'https://tv.naver.com/v/2248735' , '����,����,�� ���� ����,�Ŀ���,����,��,û��,����' ,   '2��,  1����,  5-6����,  4TS,4TS,  3TS,  2TS,  1TS' ,
  '���� �� �κ��� ä ��� Ǫ�� �κ��� ŭ���ϰ� ���д�,������ ������ ����� �� ���,������ �踦 ���� ������ �����ϰ� Į���� �� �� ���� Ǫ�� �κа� ������ ��ӿ� ä���,���뿡 ���� ���� Ǫ���κ��� ��� �� ���� ���̸� �÷� 20-25�а� �ǳ���,�ҽ��ҿ� ��� ��Ḧ �ְ� ������ �쵵�� ���δ�,�� ���� �ȿ� ���� �Ŀ� ������ ������ �� ���ÿ� �ø��� ��ä�� ���� �ø���,���� �ҽ��� ���� �� ���� ��ä�� �ø��� �̰߰� �ޱ� �Ŀ����� �ѷ� ������ �Ѵ�'
  ,  2000  ,  200,  '90���̳�'  , 'Steamed Sea bass in soy sauce �̷� �̸����� �ؿܿ� �ִ� ��κ��� �߽� ������������� ã�ƺ� �� �ִ� �丮�� Ȥ�� �ؿ� ���� �߿� �߱� �������� ���Եǽô� �е��� ��ôٸ� ���Ѽ� ���� ���ϴ� �޴� �� �ϳ��̴� ���� ����'
  , 40 ,21 ,42 ,  sysdate,1);




/*     ==========   5   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'4321','4321','��ġ��ġ','ġġġ','3121225223200','ab331@15s1323v2er.com',12344205999,sysdate,'photo_06.png','����',20);


  
-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '����Ÿġ������� <����������> �����' , 'foodImg_06.png'  , 
                          '�ų� ������ ������ �ظԴ� �丮 �� �ϳ��ε� �������� �����Ǹ� �÷��帰 ���� ���� �η��η� ������ �ø��� ������ �丮. ���������� ��Ź �����⸦ Ȯ �츮�� ��������ϴ�. �Ƹ� ���̵� ������ ���� �ִµ� �� �������� �̸��� ���� ������. ���׶� O�� ����� ȭ���� ������ ����� ����̶� ���� �������� �Ҹ���µ� �Ϲ� ����Ÿ ġ�� ������� ���� ���� ������ ����� �� 20�� �� ������.' , 'https://tv.naver.com/embed/2532656?autoPlay=true' , '���̺� ä��, Į�� ����丶��, �Ƹ�� �����̽�, ����Ÿġ��,�߻�� ���� ,��,�����ӽ��͵�,�ø������,�ұ�, ����' , '���緮, ���緮,���緮,���緮, 1TS,  1/2TS,  1/2ts,  1.5TS,  �ణ' , '���� �巹�� ��Ḧ ����д�,��� �丶��� �����̽� �Ѵ�,���ÿ� ���̺� ä�Ҹ� ����� �� �������� �ѷ� ��´�,�����̽� �� ����丶�並 �뼺�뼺 �ø���, ġ��� �Ƹ�� �����̽��� �Ѹ��� �巹�̰� �Բ� ����.',   1000   , 50, '15���̳�','����丶��� ���������θ� ����ص� �Ǳ� ������ �̷��� Į��� ����Ͻø� �� ������. �Ϲ� ������� ä�� ���� ���̺� ä�� ����Ͻô°� �� ������. ��������� ���������� ������ Ǯ�� ����ص� ���ڴ�ϴ�.',60 ,41 ,52 ,  sysdate,1);



      
        
        -- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '��ö���� ���������� ����� �丮 <���� �Ľ�Ÿ> �����' , 'foodImg_08.png'  , 
                          '������ �Ľ�Ÿ �丮 �߿����� �Ƹ� ���� �� ���Ⱑ ���� ���� �Ľ�Ÿ ����� ���� �˷������. ���¸���� vongole�� ������ ���ϰ� ���� spaghetti alle vongole�� ���� ���İ�Ƽ�� ���ؿ�.
�ø������ ���̽� �Ľ�Ÿ �����δ� �Ƹ� ����~ �������� ������ ���� �丮. �ϴ� ������ ���� �������� ������� ���� �췯������ ������ ���� ���Ⱑ ������. ���� ���İ�Ƽ ���� ���� ���� ���ʹ� ����Ѱ� �־ ����ߴµ� ���������� �� �Ľ�Ÿ�� ª�� �� ���ٴ� �� ���� ��︮�� ���� �� ���ٴ� ���� ���� �� �� ��︮�� �� ���ƿ�.' , 'https://tv.naver.com/embed/2671154?autoPlay=true' , '���ʹ�,����,���۷�ġ��,����,ȭ��Ʈ����,�Ľ�������,�Ǵ� ���� �� �Ľ��� ,�ұ�, ����' ,  '80g,  200g,  3��,  2-3��,  1/4��, 1/2ts 1/2TS, �ణ' , '������ �� ��� ������ �ذ��� �غ��Ѵ� ,���� ���� �ұ��� �ְ� ���ʹϸ� ������ ���� �����ð����� 1�� �� �����Ѵ�,�ޱ� �ҿ� �ø�������� �θ��� �� ���� ������ �־� ���ٰ� ���۷�ġ�븦 �ְ� ���� ���´�,������ �ְ� ������ �� ȭ��Ʈ������ �ְ� ���� ������ ���� ���� �� ���� ���δ�
,���� ���� �ְ� �ҽ��� ������ �ڼ����شٰ� �Ľ����� �ְ� �ұ�, ���߷� ���Ѵ�. �� ����� ���ݾ� �߰��ذ��� �����ش�,�������� �ø�������� ��¦ �ѷ��־� ������ �� ���ÿ� ��Ƴ���.',  3000   , 200  , '90���̳�' , '�丮 ��� �߿� ���۷�ġ���� ���¸��� ���� ���߰� ���µ� ������ �������� ��û �ſ��� �ϳ� �ΰ� ������ ���� ����� �����ؿ�. �ణ �ſ� �⸸ ������ �ʹٸ� �� �� ���� �־ �ǰ� �ſ� ���� �ȴٸ� �׳� ���ŵ� ��� �����.���� ���̽� �Ľ�Ÿ�� ��� �������� �ø�������� ��¦ �� �ְ� �������ָ� �츮���� ���� �������� ���⸧�� �ִ� �Ͱ� ���� ����� ȿ���� ������ ���ִ�ϴ�.', 20 ,11 ,42 ,  sysdate,1);






/*     ==========   6   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'321321','321321','���ڱ�','���','3121515223200','ab341@1351323v2er.com',12342201599,sysdate,'photo_07.png','����',30);



-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info ,
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime,admin_app  )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '�ö�� <���߽���ī> �����' , 'foodImg_10.png'  ,  '�Ϻ��丮å�� �� ���� �� ���� �����ؼ� �̸��� �˰� �־��� �丮�� ���߽���ī
�Ϻ���� �Ҫ䪷������ �����ϸ� ������ ��ȭǳ�� ���� �Ǵµ� ��ȭ�ø��� �Ϻ����ͼ� �ڸ��� ��� ź���� �丮��� �Ѵ�. �� ���� ������ �پ��� ����� �ø� �� Ÿ���ҽ��� �ѷ� �Դ� ��丮. ���ְ� �ص弼�� :)' ,
 'https://tv.naver.com/embed/1814533?autoPlay=true' , '������ġ��,���,����,�귱ġũ��,�丶��,�Ǵ� ����丶��,�߸�,���,��,����,��,����,���⸧,����,���' ,   ' 4��,  1��,  1/2��,  4��,1�� 6-7��,  2�κ�, 3TS,  2TS,  4TS,  1TS,  2TS,  1TS, 1��,  ����' , '����, ���� ��� ä ��� ����� �ұ��� �ణ �ְ� Ǯ�� ������ ��ģ �� ä ��� �丶��� ������ ���� ���� ���·� �ڸ���. �귱ġ ũ���� ������ �����ϰ� ������ ���д�,���� �����̿� �ְ� ���� �� ������ �ҽ� ��Ḧ �ְ� ���´�, ���� ���� ���� �ְ� �߰��߰� ������ �ξ�� ���δ�,���� ���� ���� ��� ��, ũ��, ����, ���, �丶�並 �÷��� �� �ҽ��� �ѷ� ����.',  1000   , '50'  , '30���̳�', '�ö󰡴� ����� ������ ��� ����־�� ���ڴ�.����� �̸� �غ��صξ��� ����ص� �Ǳ� ������  �丮�ϱ� ���� ����ö �ſ� �� ����� �� �ִ� �丮.
�츮������ �ø���� �� �ٸ� �ߵ��� �ִ� ���� �ø��̶� ���� �������� ���� �� �� �ص�ź��ö� ��õ ����� :)', 30 ,61 ,62 ,  sysdate,1);



-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '�ɾ߽Ĵ� <���߻��쳪��> ����¹�' , 'foodImg_29.jpg'  , 
  '���� �̷��� 2�κ� �������� ����״� �� �з��� 2�κ����� ���缭 �÷��帳�ϴ�.�����ѵ� ��ä���� �췯������ ������ ���� ���� �޴��� ������ ���� ���� ����.���� ���� ������ ���� ���ܰ� ���̰���? ���ְ� �ص弼�� :)'
  ,'https://tv.naver.com/v/4549052' , '������,ǥ�����,���,�κ�,���̹���,��,�������ν�,�ٽø�,���� ����ҽ�,����' ,   ' 4��, 1��, 1/3��, 1/2��, 1/2��,1L,  10g, 1��,���緮, 1����' ,
  '���� ���� �ٽø��� �ְ� ���̴� ���� ��������� �ٽø��� �����ϰ� �������νø� �������� ���� �� �� 20�а� �������,���̹����� 2����ϰ� ���ߴ� ����ũ��� ��� �κδ� �����̽� �Ѵ�,ǥ������� �ص��� �߶󳻰� ��系�� �߶��ش�. ��ٵ� ��系�� �ڸ���,���� �������� ��ä�� ��� �ְ� 1�� ������ ��ᰡ ��� ������ �ξ��� �� û�� 1TS�� �ִ´�,��ᰡ ����� �� ���� ������ ��������,���� �ҽ��� ���� ��¦ �־� ���� �� ���� 1������ �ִ´�.'
  ,  3000  ,  200,  '90���̳�'  , '���� ����ҽ��� ���� ���� ���ؼ� ���� �����µ� ���⿡ ���� ���� �ҽ��� �ٸ� �ҽ��� ���� ��� ���ƿ�.'
  , 30 ,21 ,12 ,  sysdate,1);





/*     ==========   7   ================    */

insert into member_info(mem_no,mem_id,mem_pwd,mem_name,mem_nickname,mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no)
values(member_info_seq.nextval,'1212','1212','�����Ѱ�','���߻缼��','3121115223200','ab341@135s1323v2er.com',12312541999,sysdate,'photo_08.png','����',40);




-- Ŭ���� ������ --

insert into class_info(class_no , mem_no  , class_title  , class_thumbnail  , 
                           class_content  , class_recipe_video , mate_name , mate_cnt, step, 
                           class_price  , class_period  , class_cooktime  ,  class_detail_info , 
                            kind_tag_no ,theme_tag_no ,material_tag_no ,class_uploadtime ,admin_app )
   
    
   values(class_info_seq.nextval, member_info_seq.currval , '����Ĩ ���ɷ� ����¹�' , 'foodImg_25.jpg'  , 
  '���ɷ� �����Ǵ� ������ �ø� �� ������ �̹����� ���� Ư���ϰ� ���� �����ִ� ����Ĩ�� Ȱ���� �����Ҵ�ϴ�.��ġ �����ڸ� ���� ��ó�� ����ϴ� ���ִ� ���ɷ��̿���.�� ���ɷ��� �����ų� ���� �ʿ䵵 ���� �ҿ� ������� �ξ� �״�� ���� ������ �Ǳ� ������ ����⵵ �ſ� ������. �Ѱ��� ���� ����Ĩ�� �Ϻδ� ����� �ȿ� �Ϻδ� ���� �������� �÷� �ε巯�� ����� ���� �ٻ��� ����Ĩ�� ���� ���ÿ� ��� �� �ֵ��� ����°ſ���. ���ְ� �ص弼�� :)'
  ,'https://tv.naver.com/v/14004403' , '���,����Ĩ ���� ��,���� ����,����,�ұ�, ����' ,   '2��, 1��, 2TS, 1ts,�ణ,�ణ' ,
  '���Ĵ� �ۼ� ���,����Ĩ�� �밭 �μ�� �غ��Ѵ�,���� ����� �־� Ǯ�� ���� ����, ����Ĩ ����, �ұ�, ���߸� �ְ� ���´�,�ҿ� ���͸� ���δ�,������� �ξ�ְ� ��ҿ��� ������,80%���� �;��� �� ���� ����Ĩ�� �Ѹ��� ���� �� ���� �������Ѵ�.'
  ,  2000  ,  200,  '30���̳�'  , '��� ����� ���⿡ ���� �����ϼŵ� �����ƿ�.���� ���� �ͺ��� �� �����ŵ� �ܿ��� ���ؼ� �Դ� ���̿� ����� ���� ���� �����̱� ������ ���� �� �ε巯�� �İ��� ���Ͻô� �е鲲�� �� ��õ�ϴ� ����̿���.��� ���� ���� ����Ĩ�� �Ȼѷȴٸ� ����Ĩ�� �ȿ� ������ �𸣰� �Ծ��� �� ���ƿ� ����.���� �� ��ġ�ϰ� ��ð�ʹٸ� ü��ġ�� ���Ƽ� �Ѹ��ŵ� ������ �� ���ƿ�.�귱ġ�� ���� ���� ���ɷ��丮.������ �丮 �߿� ���ڰ� ���� �Ǹ���ƶ�� ���ɷ� �丮�� �ִµ� �װ��� ������ ���� ���⵵ �� ����Ĩ ���ɷ��̿���.'
  , 70 ,11 ,62 ,  sysdate,1);



--����߰�
--select * from member_info;
insert into member_info values(member_info_seq.nextval, 'qwe123', 'qwe123', '�ɳ�', '����', '9500332121221', 'haj1003@naver.com', '01033334455', sysdate, 'photo_09.png', '�Ϲ�', 5, '�Ϲ���', 10);


insert into member_info values(member_info_seq.nextval, 'kkk123', 'qwe123', '���', '����', '9500442121221', 'rnlwneh@naver.com', '01022311455', sysdate, 'photo_10.png', '�Ϲ�', 5, '�Ϲ���', 10);



insert into member_info values(member_info_seq.nextval, '1111', '1111', '���븮', '���븮', '9600442121221', 'mmm123@naver.com', '01122311455', sysdate, 'photo_12.png', '�Ϲ�', 5, '�Ϲ���', 10);
--select * from member_info;


commit;


--select class_no,class_title,mem_no,admin_app from class_info;

--select mem_no,mem_pic,mem_grade_no from member_info;

--select * from review;

--select mem_no,class_no from pay_info;





/*  ��ŷ ���� ������ �����  */

/* Ŭ���� ���� */

insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 11  , 16  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 8  , 16  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 6  , 16  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 2  , 16  , 'ī�����' , '�����Ϸ�');

 
insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 10  , 16  , 'ī�����' , '�����Ϸ�');
 
 
 insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 12  , 16  , 'ī�����' , '�����Ϸ�');
 
  
 insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 4  , 16  , 'ī�����' , '�����Ϸ�');
 
 
 

insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 11  , 6  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
 values(pay_info_no_sq.nextval,  sysdate , 6  , 6  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 13  , 6  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 6  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 5  , 6  , 'ī�����' , '�����Ϸ�');





insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 26  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 6  , 26  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 26  , 'ī�����' , '�����Ϸ�');

insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 10  , 26  , 'ī�����' , '�����Ϸ�');






insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 23  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 23  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 9  , 23  , 'ī�����' , '�����Ϸ�');





insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 5  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 13  , 5  , 'ī�����' , '�����Ϸ�');



insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 6  , 20  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 3  , 24  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 5  , 12  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 22  , 'ī�����' , '�����Ϸ�');


insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 11  , 27  , 'ī�����' , '�����Ϸ�');



insert into pay_info(pay_info_no , pay_info_date  , mem_no  , class_no  , 
                           pay_info_type  , str_ord_status)
       
values(pay_info_no_sq.nextval,  sysdate , 8  , 7  , 'ī�����' , '�����Ϸ�');






/*  ��ŷ ���� ������ �����  */

/* ���� ���  */


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  11  , 16  , '1', 5 , '���־��',sysdate);


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  8  , 16  , '1', 5 , '¯��! ���������� �� �ظԾ�!!',sysdate);
 
 
insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  6  , 16  , '1', 4 , '�������� ����⵵ ������',sysdate);
 
 
insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  10  , 16  , '1', 5 , '�����Ϸ��� ������µ� �� ������ ^^',sysdate);




insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  11  , 5  , '1', 4 , '�������ƾƾƾ�!',sysdate);


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
values(review_seq.nextval,  13  , 5  , '1', 4 , 'Ǫ��Ǫ��Ǫ��',sysdate);
 
 
 
 
 
insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
values(review_seq.nextval,  11  , 26  , '1', 2 , '�������� ����� �����',sysdate);
 


insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  6  , 26  , '1', 4 , '���ƿ�...',sysdate);



insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  10  , 26  , '1', 3 , '�̽ñ���...�Ͻ�...',sysdate);



insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  9  , 23  , '1', 2 , '���� ���...',sysdate);



insert into review(review_no , mem_no  , class_no  , type,
                           star_rate  , review_content,review_date)
       
 values(review_seq.nextval,  5  , 6  , '1', 1 , '������������...',sysdate);







--�ŷ�ó ��� ���̺� �߰�
insert into trade_list values(trd_list_no_sq.nextval, '�̸�Ʈ', '�̸�Ʈ���', '01012341234', sysdate, sysdate);
insert into trade_list values(trd_list_no_sq.nextval, '���ϰ���', '���ϴ��', '01043211234', sysdate, sysdate);
insert into trade_list values(trd_list_no_sq.nextval, '�����', '��������', '01098881234', sysdate, sysdate);
--select * from trade_list

--��ǰ�߰�
--select * from store_product;
insert into store_product values(str_pro_no_sq.nextval, 1, '����Ĩ.PNG', '����Ĩ.PNG', '���ִ� ����Ĩ', '����Ĩ', '500', '500', '1500',0);
insert into store_product values(str_pro_no_sq.nextval, 1, '������.PNG', '������.PNG', '���ִ� ������', '������', '400', '3000', '5000',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '��ġ.PNG', '��ġ.PNG', '���ִ� ��ġ', '��ġ', '0', '2000', '8000',0);
insert into store_product values(str_pro_no_sq.nextval, 1, '������.PNG', '������.PNG', '���ִ� ������', '������', '50', '6000', '10000',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '���.PNG', '���.PNG', '���ִ� ���', '���', '500', '600', '1200',0);
insert into store_product values(str_pro_no_sq.nextval, 1, '����.PNG', '����.PNG', '���ִ� ����', '����', '950', '2000', '4000',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�̽�.PNG', '�̽�.PNG', '���ִ� �̽�', '�̽�', '0', '800', '1800',0);

insert into store_product values(str_pro_no_sq.nextval, 2, '���ϼ���.PNG', '���ϼ���.PNG', '���ִ� ���ϼ���', '���ϼ���', '30', '12000', '30000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '����.PNG', '����.PNG', '���ִ� ����', '����', '200', '3000', '7000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '�޷�.PNG', '�޷�.PNG', '���ִ� �޷�', '�޷�', '0', '8000', '14000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, 'ǲ���.PNG', 'ǲ���.PNG', '���ִ� ǲ���', 'ǲ���', '500', '1500', '2500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '����.PNG', '����.PNG', '���ִ� ����', '����', '0', '2000', '3000',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '���.PNG', '���.PNG', '���ִ� ���', '���', '700', '2000', '3000',0);
insert into store_product values(str_pro_no_sq.nextval, 2, '�Ű���.PNG', '�Ű���.PNG', '���ִ� �Ű���', '�Ű���', '20', '5000', '10000',0);
insert into store_product values(str_pro_no_sq.nextval, 2, '�丶��.PNG', '�丶��.PNG', '���ִ� �丶��', '�丶��', '900', '1000', '2000',1);

insert into store_product values(str_pro_no_sq.nextval, 3, '�߰��.PNG', '�߰��.PNG', '���ִ� �߰��', '�߰��', '500', '2000', '5000',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '�������.PNG', '�������.PNG', '���ִ� �������', '�������', '500', '5000', '8000',0);
insert into store_product values(str_pro_no_sq.nextval, 3, '�ٺ�ť.PNG', '�ٺ�ť.PNG', '���ִ� �ٺ�ť', '�ٺ�ť', '50', '15000', '30000',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '����.PNG', '����.PNG', '���ִ� ����', '����', '100', '15000', '30000',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '�������.PNG', '�������.PNG', '���ִ� �������', '�������', '100', '8000', '15000',0);
insert into store_product values(str_pro_no_sq.nextval, 3, '�Ұ��.PNG', '�Ұ��.PNG', '���ִ� �Ұ��', '�Ұ��', '0', '20000', '50000',1);
--select * from store_product

--�ֹ����̺� �߰�
--select * from store_order;
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 1, 5, '����� ����',to_date(20201229000723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 5, 4, '����� ����',to_date(20201229010723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 9, 9, '����� ����',to_date(20201229020723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 2, 8, '����� ����',to_date(20201229030723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 4, 7, '����� ����',to_date(20201229040723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 7, 6, '����� ����',to_date(20201229070723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 8, 1, '����� ����',to_date(20201229080723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 5, 3, '����� ����',to_date(20201229090723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 3, 2, '����� ����',to_date(20201229010723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 6, 11, '����� ����',to_date(20201229110723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 9, 15, '����� ����',to_date(20201229120723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 8, 14, '����� ����',to_date(20201229130723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 1, 13, '����� ����',to_date(20201229140723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 5, 12, '����� ����',to_date(20201229150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 3, 11, '����� ����',to_date(20201229160723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1,11, 25, '����� ����',to_date(20201221180723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 15, 4, '����� ����',to_date(20201229180723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 14, 9, '����� ����',to_date(20201229190723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 12, 7, '����� ����',to_date(20201229200723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 13, 5, '����� ����',to_date(20201229210723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 16, 3, '����� ����',to_date(20201229220723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 19, 1, '����� ����',to_date(20201229230723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 18, 2, '����� ����',to_date(20201230000723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 17, 6, '����� ����',to_date(20201230230723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 16, 7, '����� ����',to_date(20201230220723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 15, 8, '����� ����',to_date(20201230210723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 14, 11, '����� ����',to_date(20201230200723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 13, 21, '����� ����',to_date(20201230190723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 12, 16, '����� ����',to_date(20201230180723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 11, 14, '����� ����',to_date(20201230170723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 12, 22, '����� ����',to_date(20201229170723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 13, 13, '����� ����',to_date(20201230160723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 14, 14, '����� ����',to_date(20201230150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 16, 17, '����� ����',to_date(20201230150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 17, 4, '����� ����',to_date(20201230150723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 18, 1, '����� ����',to_date(20201230120723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 19, 2, '����� ����',to_date(20201230110723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 14, 3, '����� ����',to_date(20201230090723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 15, 3, '����� ����',to_date(20201230080723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 1, 4, '����� ����',to_date(20201230070723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 3, 5, '����� ����',to_date(20201230060723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 9, 6, '����� ����',to_date(20201230050723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 7, 7, '����� ����',to_date(20201230040723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 21, 8, '����� ����',to_date(20201230030723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 3, 20, 8, '����� ����',to_date(20201230020723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 1, 20, 9, '����� ����',to_date(20201230010723,'YYYY-MM-DD HH24:MI:SS'));
insert into store_order values(str_cart_no_sq.nextval,store_order_sq.nextval, 2, 21, 4, '����� ����',to_date(20201230000723,'YYYY-MM-DD HH24:MI:SS'));
--select * from store_order

 /*
 --���̺� ����--
 
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


--������ ������ ������--
insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '����', '10.jpg', '����url', '����������� ������ ����', '20�г���', 'Hard', '���� ���,�ұ�,����,�ٺ�ť�ҽ�', '800g,4����,3����,1��', '�丮����,�丮����,�丮����,�丮����,�丮����', 1, 0, 20, 21, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '���ڳ� Ŀ��', '6.jpg', '����url', '������ ������ ������ �丮 ���ڳ� Ŀ��', '40�г���', 'Normal', '�ߴٸ���,��������,�ε�ī������,����', '500g,125ml,3ū��,�ݰ�', '������ �߿� ������ �ְ� 30�а� ����� ����ּ���,���� ���� �׸��� ī�����縦 �����ּ���,�ߴٸ����� ���� ���� ũ��� �߶��ּ���,���Ŀ� �ߴٸ����� �����ּ���,������ ��ῡ ������ ���� �ְ� �����ּ���, ������ ���������� �ϼ��Դϴ�', 1, 0, 50, 11, 32, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 4, '���� �� ��', '5.jpg', '����url', '������ ���� ��� �������� �Դϴ�', '40�г���', 'Normal', '���,�丶�� �ҽ�,�߰�����,�ұ�,����', '3��,1��,1��,1����,1����', '�ҿ� �������� ���ٰ� �߰����� �ְ� �����,�丶��ҽ� 300g �ְ� �� �����ּ���,�ұ����� �� ���߰� ���� �����ϰ� ���� �ݴϴ�,�ް� 3�� �־���� �븥�� ������ �ʵ��� ��������~,�Ѳ� ���� �븥�ڰ� �ݼ��� �ǵ��� ��ҷ� ���� �ݴϴ�', 1, 0, 20, 11, 32, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '�ᳪ�� �Ұ��', '4.jpg', '����url', '������ ���л��� �ᳪ�� �Ұ��', '20�г���', 'Hard', '���� ����,�ᳪ��,����,���尡��,������,����,����', '500g,1����,�ݰ�,3��Ǭ,3��Ǭ,3��Ǭ,3��Ǭ', '����� ���� ������� ����� �ּ���,�ᳪ�� 300g�� �ľ� ü�� ���� ���⸦ �����ϰ� �غ��մϴ�,���� 500g�� �غ��ϰ�,���� �ҿ� �ľ� ���� �ᳪ���� ���,�� ���� ���л����� �ø���,����� ���� ������� ��� �ְ�,�޴� �����ָ� �ᳪ�� �Ұ�� �ϼ�', 1, 0, 10, 31, 12, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 6, '��纣�� ������ũ', '7.jpg', '����url', '���̵� �������� ��纣�� ������ũ �����?', '40�г���', 'Hard', '������ũ ����,��纣��,����ũ��,����,����', '300g,50g,100g,1����,200ml', '������ũ ����� ������ �����ּ���,�ޱ��ҿ� ���͸� �θ��� �����ּ���,����ũ���� ��ǰ��� ���� ũ���� ������ּ���,�� ������ ������ũ�� ũ���� ��纣���� �÷��ּ���,���ְ� ��ø� �˴ϴ�', 1, 0, 80, 51, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '������ ����� ũ����', '8.jpg', '����url', '�귱ġ�� ������ ũ���� ������ �Դϴ�~', '40�г���', 'Normal', '�а���,����,��纣��,����ũ��,����,����', '300g,100g,100g,200ml,50g,100ml', '����ũ���� ������ ���� ũ���� ����� �ּ���,�а���� ������ �����ּ���,�ޱ� �ҿ� ������ ��� �����ּ���,������ ũ���信 ���ϰ� ����ũ���� ������ּ���,���ְ� ��ø� �ʴ�', 1, 0, 80, 51, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '������ũ', '9.jpg', '����url', '������ ����� ����� ������ũ �����', '40�г���', 'Hard', '�Ұ�� �Ƚ�, �ƽ��Ķ�Ž�,�ұ�,����,����', '300g,2��,�Ѳ���,�Ѳ���,50g', '������ũ�� 30���� ��¿� �����μ���,�ƽ��Ķ�Ž��� ������ ������ �ľ��ּ���,��ȣ�� �°� ������ũ�� �����ָ鼭 �ұ� ���߸� �ѷ��ּ���,�ٱ����� ������ũ�� ���� �ƽ��Ķ�Ž��� ������ �� �ҿ� �����ּ���,���ְ� ��ø� �˴ϴ�', 1, 0, 20, 21, 22, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '�������ũ', '11.jpg', '����url', '������ ������ ���� ����� �������ũ', '40�г���', 'Easy', '���,�а���,����,�ұ�,����', '1��,500g,���� 300g,1����,300g', '�а��縦 �ѹ� ü�� �ɷ��ּ���,�а��� ���� �ұ� ���͸� �� �����ּ���,180���� ������ ���쿡 40�а� �����ּ���,���ְ� ��ø� �˴ϴ�', 1, 0, 80, 51, 62, sysdate);





insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat.jpg','meat.jpg','������ �ѵ� �����Ұ���!','�ѵ� �����Ұ��� 1kg',40,15900,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat1.jpg','meat1.jpg','������� / �Ұ�� ���� Ư����','����,ȣ�ֻ�,�̱��� ������ ��� �����',40,4400,5000,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat2.jpg','meat2.jpg','���� 1++ �ѿ� �Ұ�� - ���� ���� �Ұ�� 200g','������ ��ΰ� �����ϴ� �ε巯�� 1++ �ѿ� �Ұ��',40,15900,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat3.jpg','meat3.jpg','���� 500g (���̿�)','���������� �ż����� �츮������',40,16200,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat4.jpg','meat4.jpg','ȣ�ֻ� ��� 500g (�Ұ���)','���������� �ż����� �츮������',40,13800,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat5.jpg','meat5.jpg','���� �ѵ� ��� ���� - ���� ���� ������� 500g','���� �ʼ��� �ѵ� ������� ���!',40,7500,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat6.jpg','meat6.jpg','�ѵ� �Ƚ� 1+1��(��ī��/��������)','������ �ε巯�� �Ƚ����� ������� ���??',40,9900,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat7.jpg','meat7.jpg','���� 1++ �ѿ� ������ - ���� ���� �Ұ�� 200g','�̱��� �İ��� �ŷ����� 1++ �ѿ� ������',40,33000,9900,1);

 insert into store_product(str_pro_no,trd_list_no,str_pro_image,str_pro_detail_image,str_pro_content, str_pro_name,str_pro_remind,str_pro_primecost,str_pro_salescost,str_pro_show)
values(str_pro_no_sq.nextval,trd_list_no_sq.currval,'meat8.jpg','meat8.jpg','���� 1++ �ѿ� ä���� ��� - ���� ���� �Ұ�� 200g','�̱��ϰ� ǳ���� ���� 1++ �ѿ� ä����',40,43000,9900,1);

insert into store_product values(str_pro_no_sq.nextval, 1, '��ȭ����.jpg', '��ȭ����.jpg', '����Ҹ� �������(��ȭ����) 500g/1kg', '�̱��ϰ� �������� ������', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '���ַ����Ʈ.jpg', '���ַ����Ʈ.jpg', '���ַ����Ʈ(���) 5kg/10kg (��������, ���߷�)', '���ֻ� �����Ʈ�� �ż����� ����������~!', '500', '15900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '��ä��.jpg', '��ä��.jpg', '���� �ż��ϰ� Ǫ���� ����� ��ä�� 800g', '�ֹ� �� ��Ȯ�Ͽ� �����帮�� �پ��ϰ� �̽��� ��ä��', '500', '11900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '����.jpg', '����.jpg', '���� 80g', '�������忡�� ������ �ż�ä��', '500', '3900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '���̺�ä��.jpg', '���̺�ä��.jpg', '���̺�ä�� 50g', '�ż����� �� ����, ���̺�ä��', '500', '1000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '���.jpg','���.jpg', '��ô��� 1��', '�������忡�� ������ �ż�ä��', '500', '1200', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '��.jpg', '��.jpg', '�� 1��', '�������忡�� ������ �ż�ä��', '500', '7200', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, 'ġĿ��.jpg', 'ġĿ��.jpg', 'ġĿ�� 250g/500g', '�������忡�� ������ �ż�ä��', '500', '4900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, 'û��ä.jpg', 'û��ä.jpg', 'û��ä 200g', '�������忡�� ������ �ż�ä��', '500', '4400', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�����.jpg', '�����.jpg', '����� 1��/3��', '�������忡�� ������ �ż�ä��', '500', '2600', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 2, 'ü��.jpg', 'ü��.jpg', '�ڿ���Ź ĥ���� ��絵 �����̾� ��ü�� 500g ū������', 'ĥ���� ��ü��', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '���ξ���.jpg', '���ξ���.jpg', 'Dole ����Ƽ�� ������ξ��� Ư�� 2��', '���޴��� ���� �ʿ���� �귣��, ����Ƽ�� ���ξ���!', '500', '8500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '�ڸ�������Ʈ.jpg', '�ڸ�������Ʈ.jpg', '�����̾� �ڸ� ������Ʈ ��� 12���� (���� 400g ����)', '�ڸ� ������Ʈ�� ������ ���ϼ���~!', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '����.jpg', '����.jpg', '�̱��� ���� �ߴ�� 6��', '���� ������ ��絵 ����!', '500', '24900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '�ٳ���.jpg', '�ٳ���.jpg', '��絵 �ٳ��� 13kg 1�ڽ�_6~9�� ����', '�����ϰ� �˵��� ��絵 �ٳ���', '500', '20900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '����.jpg', '����.jpg', '���� �Ұ� 18����_��������', '�̱׷����� ������ ����', '500', '12900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, 'ũ������.jpg', 'ũ������.jpg', '�õ� ũ������ 100% 1kg', '�ǰ��� ������ �����ִ� ���� ����', '500', '6400', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '���Ű��.jpg', '���Ű��.jpg', '�������� ���� ���Ű�� �߰�, �߼Ұ� 16��_��������', '�̽��� ���� �������� ���Ű��!', '500', '22900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '�ƺ�ī��.jpg', '�ƺ�ī��.jpg', '�ƺ�ī�� 1��,3��,6��,10�� ��1', '�� ���� ���� �ƺ�ī��', '500', '4200', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 3, '�ݽ�.jpg', '�ݽ�.jpg', '20��� �ݽ� ���׷� �Ⱦľ �Ǵ� û��� 10kg', '20��� �ľ�� ȥ�� ��ǰ�Դϴ�.', '500', '37500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '������.jpg', '������.jpg', '���� ������ ������ 1kg', '���� ���� ���� �� ������!', '500', '7100', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '��õ��.jpg', '��õ��.jpg', '20��� ������� ��õ��10kg', '20��� ������� ��õ���Դϴ� (10kg)', '500', '50000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '�͸�.jpg', '�͸�.jpg', '������ �������� ���ؾ�͸� 5kg (1kg * 5ea)', '������ ���� �͸�', '500', '20500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '���.jpg', '���.jpg', '���� ���� ���ϳ�� ��� 20kg', '����� ������ ���� ������ ���� ���ϳ�� ���', '500', '69500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '���.jpg', '���.jpg', '�������� �� ������ �Բ��Դ� ��Ȳ�� 500g', '�� ������ �Բ��Դ� ��Ȳ��500g', '500', '10900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '�ľ�½�.jpg', '�ľ�½�.jpg', '20��� ���׷� �ľ�� �����ѽ� û��� 3kg', '20��� �ľ�½��Դϴ�', '500', '13700', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '�Ƴ��ٷ�.jpg', '�Ƴ��ٷ�.jpg', '2020�ݽ� �Ѽ��� �Ƴ��ٷ� 10kg', '����� ������� ���� ��� ��� �Ƴ��ٷ�', '500', '34000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, 'ö������.jpg', 'ö������.jpg', '2020�ݽ� �̽��̴� ö������ 1kg', '�ڿ��� ��Ⱑ ������ �̽��̴�!', '500', '5100', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 1, '�޲ٹ̺���.jpg', '�޲ٹ̺���.jpg', '26������ ��ĥ�� ���� �޲ٹ̺��� 350g', '���� ��ǥ ����~! 20������ ���� �޲ٹ̺���!', '500', '6800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '����.jpg', '����.jpg', '26��������� ��ǰ ���� ���� 3~4�κ�', '��� ���~ ��� �� ���~ ���� �����Դϴ�~', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '����ȣ��.jpg', '����ȣ��.jpg', '�λ�� �߰����� ������ ���ѽ�ȣ�� 3�� 4��', '�߰����� ������ ����ϰ� �ǰ��� �ְ��� �ܿﰣ��!', '500', '4300', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '����.jpg', '����.jpg', '26������ ���� �� ��� �̵�����', 'û�ָ� �־� �⳻���ſ� 48�ð� �𸵼���', '500', '25600', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�Ĵ߲�ġ.jpg', '�Ĵ߲�ġ.jpg', '�Ĵ߲�ġ ���� ��ġ ������', '���� ������!!! ��Ʈ�鸸�� �����ǰ̴ϴ�.', '500', '4200', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '������.jpg', '������.jpg', 'Ư�� ����ҽ��� ���� �λ� �䵵��', 'SNS���� ���� ȥ�䷯���� �ʼ���!', '500', '16500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�λ�.jpg', '�λ�.jpg', '����� ��� Ǯ��Ʈ', '���� �λ� ����!!~�ߵ�ߵ� ���� �λ�..!!', '500', '16800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '����.jpg', '����.jpg', '���� �������� ���� �߰����� 100g 1��', '���� ����Ʈ �߰�����', '500', '1800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '��������.jpg', '��������.jpg', '26��������� ���� �䵵�� ���� �������� 500G', '���� ����~ �ټ��� �Դ� ���� ���� ������ ��������', '500', '7900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '���̳���.jpg', '���̳���.jpg', '�泲 ��û�� ¥�� �ʰ� �ε巯�� ���̳��� ����� 500g', '¥���ʰ� �ε巯�� ���̳��� �����', '500', '11900', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 2, '�����.jpg', '�����.jpg', '������ ��ǰ �ݼ��� 30�� ������', '�츮 ���� �Ƚ� �԰Ÿ�! ���ִ� ������� �ݼ���!', '500', '9500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '����.jpg', '����.jpg', '����ع� �ڿ��� �� ������ 1kg(2~3����)', '���� �ٴ�� ���� ƴ���� �߰��� ����!', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '��¡��.jpg', '��¡��.jpg', '�ڿ���Ź ���� ������ ���ؾ� ��ǰ ������¡�� 1kg', '������, ������¡��!', '500', '23900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '�����ȸ.jpg', '�����ȸ.jpg', '���� �����̽� ���� ��ȸ 200g', '�����ϱ� ������ ���� ���� ���ְ� ��� �� �������?', '500', '7900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '������.jpg', '������.jpg', 'Ȧ��! ���ع���, ������ȸ 120g', '�ʱ�~�ϰ� �˵�~�� �İ��� �����̿���!', '500', '14900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '������.jpg', '������.jpg', '���� �̽��� �뿵 ȫ������ 1kg', '���������ϰ� ����� ������!', '500', '6900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '�췷��.jpg', '�췷��.jpg', '������ �ϵ� ������ ���� �췷�̻�', '�ڿ����� Ű�� �������� ���� �췷�� ��!', '500', '12800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '��.jpg', '��.jpg', '���� �ʱ��ʱ� �� �뿵 ���� 1kg', '�ٴ��� ����, �뿵��', '500', '16900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, '����ũ��.jpg', '����ũ��.jpg', '�ڿ���Ź ���� ������ ������ �ڼ� ����ũ�� 1����', '���� ������ ������ �ڼ� ����ũ�� 1����', '500', '15900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 2, 'Ű����.jpg', 'Ű����.jpg', '����ع� Ű���� 1����', '�е����� ���־��� ����!', '500', '4500', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 3, '�ݰ�����¡��.jpg', '�ݰ�����¡��.jpg', '���� ���� �̱� �ݰ��� ��¡�� 10��', '���־��ַ� �ְ�! �̱��� �ݰ�����¡��', '500', '19900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '�Ʊ���.jpg', '�Ʊ���.jpg', '���ִ� �븶�� �����Ʊ���', '���ַε� ������ �븶�� �����Ʊ���!', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '���ޱ�.jpg', '���ޱ�.jpg', '���� ������ ���ޱ� �ݼ���', '�ٴ��ٴ��� ������ ���ޱ�', '500', '5900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '����.jpg', '����.jpg', '�����̾� AAA�� �β��� ���� ', '¾��?�񸴳�? �ȳ���! ���� ���־��', '500', '19800', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '����ä.jpg', '����ä.jpg', 'ƯA�� �ε巯�� ����ä 1kg', 'ƯA�� ������ä!', '500', '19900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '����.jpg', '����.jpg', '�븣���� ���� ����', 'Ȩ���ο����� ��ڳ��� ��ǰ!!', '500', '13500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '������.jpg', '������.jpg', '�뱸���� ������ ����������', '�뱸���� ������ ����������', '500', '3900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '�簥��.jpg', '�簥��.jpg', '�� ���� ������ũ', 'ȣ���� ����� ������Ͽ�, ���� ����', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '��â.jpg', '��â.jpg', '�뱸���� ��ȭ ��â', '�뱸���� ��ȭ ��â', '500', '4900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 3, '��.jpg', '��.jpg', '�츮 ���̸� ���� ���ִ� ��', '���絵 ��! ���� ��!', '500', '3500', '1500',1);

insert into store_product values(str_pro_no_sq.nextval, 1, '�ؾ.jpg', '�ؾ.jpg', '���������̾� �ܸ� �ؾ', '���ѹα��� û�㵿 �̴Ϻؾ�� �־��!', '500', '13400', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�����â.jpg', '�����â.jpg', '���� ���� ��â ����', '���� �����â����', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '������.jpg', '������.jpg', '���߸��� ������', '�ʱ��� �İ��� ����ִ� ���߸��� ������', '500', '35000', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�̸�.jpg', '�̸�.jpg', '�̸� Ǯ��Ʈ !', '�̸� Ǯ��Ʈ !', '500', '12900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '������.jpg', '������.jpg', '�ѿ�� �ѵ����� ���� ���ε� ������', '���̵� ����, ����! �����̶��� ����ִ� ������', '500', '6300', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�������.jpg', '�������.jpg', '���� ���', '100% ������ ��������ϴ�~!', '500', '4900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�߰���.jpg', '�߰���.jpg', '������ �߰��� 350g', 'Ǫ���� ���� ������ �߰���� ������ �ϱ�!', '500', '21900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '����Ƣ��.jpg', '����Ƣ��.jpg', 'Ƣ�ܳ��� 60����', '���̵� ��������, ��� ���ַ� ��!', '500', '9900', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '�����.jpg', '�����.jpg', '������ �ѳ� ������ �÷��� �����', '���� ���� �÷��� �����', '500', '16500', '1500',1);
insert into store_product values(str_pro_no_sq.nextval, 1, '����Ĩ.jpg', '����Ĩ.jpg', '�������� Ĩ�� 2kg', '������Ĩ! �Ҹ����� ���ִ� ��������Ĩ!', '500', '7800', '1500',1);




insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
                   visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 11, '�����', '10.jpg', '����url', '����������� ������ �����', '20�г���', 'Hard', '���,���,���,���', '��ᷮ,��ᷮ,��ᷮ,��ᷮ,��ᷮ', '�丮����,�丮����,�丮����,�丮����,�丮����', 1, 0, 10, 11, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
                   visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 12, '�����', '10.jpg', '����url', '����������� ������ �����', '20�г���', 'Hard', '���,���,���,���', '��ᷮ,��ᷮ,��ᷮ,��ᷮ,��ᷮ', '�丮����,�丮����,�丮����,�丮����,�丮����', 1, 0, 10, 11, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
                   visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '�����', '10.jpg', '����url', '����������� ������ �����', '20�г���', 'Hard', '���,���,���,���', '��ᷮ,��ᷮ,��ᷮ,��ᷮ,��ᷮ', '�丮����,�丮����,�丮����,�丮����,�丮����', 1, 0, 10, 11, 12, sysdate);

insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 4, '����� �κ�����', '����κ�����.jpg', '����url', '���� ĮĮ�ϰ�, ����� ���� �κ� ����, �� �Ѱ��� �ĵ�, �䵵���� ���� �����ϴ�.
���ð��� ����� �ҽ������� �� �����ַε� �����ϴ�.', '30�г���', 'Normal', '�κ�,�����,����,����,����,ǲ����,��,�Ŀ���,�ſ���尡��,������,����,����,����,��������', '800g,200g,3ū��,1��,1��,2��,1.2����,�˳���,6ū��,3ū��,3ū��,3ū��,1ū��,2ū��', '�յκδ� ŭ���ϰ� ��� �ּ���.,���� 3 ū���� �� 800ml �� �װ�, Ǯ�� �� �� �κθ� �ְ� �״�� �μ���.(10~20�� ����),*���ĸ� �۰� ��� �ּ���.
*���Ŀ� ǲ���ߴ� ��� ��� �ּ���.,*���� �з��� ����� �ְ�,������� ����� �ּ���.
*������� 3~4 ������� ��� �ּ���.,���� �Ŀ����� �θ���, ���ĸ� �ְ�, ���ҿ��� ���� ������ ���� ���� �ּ���.,������� �ְ� ���� �ּ���.,���忡 �㰡�� �κθ� ������ �ְ� ���� ǲ���� ������� �ְ� �� 400ml�� �װ�, ����� ��� ���� �� ���� �ּ���.,������ ���� ������ ���� ���� ��� �ּ���.', 1, 0, 10, 31, 22, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 4, '�κνñ�ġ��ħ �� �����ǰ� ���� ���ֳ׿�', '�κνñ�ġ��ħ.jpg', '����url', '�ñ�ġ �����ϼ���?  �ε巴�� ����� ���� ���� ���̵��� �� �����Ѵ�ϴ�. �ñ�ġ�κι�ħ Ȳ�� RECIPE �����Կ�~'
, '15�г���', 'Easy', '�ñ�ġ,�κ�,����,���⸧,���ұ�,����,�ұ�', '1��,1/2��,2T,1T,1T,0.5T,0.5T', '�κ� �ݸ�� Į������ �߰� �������ش�.,���⸧ 1T, ���� 2T, ���ұ� 1T, ���� 0.5T �� �ְ� ����� ����� �ش�.,�ҿ� ���� �κθ� �ְ� ������� ��� 1/2 �з��� �ξ� �� �� ������ ���ư� �� �� ������ ���� ��Ƶд�.
,�ñ�ġ�� �������� ���� ��� �� �帣�� ���� �����ϰ� �ľ� �ش�.,�����ϰ� ���� �ñ�ġ�� �ص��� �ڸ��� �Ա����� ũ��� 2��� �Ѵ�.,���� ���� �ұ� 0.5t�� �־��� �� �ñ�ġ�� �ְ� 20�ʰ� ����ش�.,��ģ �ñ�ġ�� ������ �󱸾� ������ ���⸦ �� §��. �κΰ� ��� ���� �ñ�ġ�� �ְ� ������ ����� �� �־��� �� ������ �������� �����ش�. ������ ���� �ұ� (0.5t) �� �ְ� �������Ѵ�.'
, 1, 0, 10, 11, 52, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '�κΰ��� ,�κι���, ���̹���', '�κΰ���.jpg', '����url', '�κο��� ���ð���ġŲ���̳��� ��������
�ź�mom�߸ſ丮���
������ �߸ſ丮�� ���Ծ�� ����������', '10�г���', 'Easy', '�κ�,��ħ����,������,��������,�ø����', '1��,1/2������,5T,1T,2T', '�κδ� ��ҽ�� ���ּ���,
ŰģŸ�÷� ���� ���⸦ �������ּ���,�׸��� ����ѿ� ��ħ���縦 �ְ� ��� �����ּ���,�״��� �ҿ� �⸧�� �˳��� �θ���
�븩�븩���������� �����ּ���~,���� ���� �־����� ������������ �־��ּ���
�׷��� Ÿ���ʾƿ�~', 1, 0, 10, 51, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '�䵵�� ����κ��', '����κ��.jpg', '����url', '����κ�� ~ �����ϰ� ������ �ÿ����� �����ݴϴ�.�䵵���̿���', '30�� ����', 'Easy', '�����, �κ�, ����, ȫ����, û�����, ����, ȣ��', '3��,1/2��,�ణ,�ణ,�ణ,1/2��,1/4��', '�� 650ml�� ��ġ�� �ٽø��� �ְ� 15�а� ���� ������ ���� �ּ���,�ʿ��� ��Ḧ ����  ��ô�Ͽ� �غ��Ͽ� �ݴϴ�,��Ḧ ����ּ���,��ġ ������ ȣ�ڰ� ���ĸ� ���� �ְ� �����ֱ� �����մϴ�,ȣ�ڰ� ���İ� ���� �;����� �κ� ���� �ְ� ����� �ְ� ���� �ּ���~,������� ��� ������,
���������� ���Ŀ� û����߿� ȫ���߸� �־� �ѼҲ� �����ָ� �ϼ��Դϴ�.
���� ���ð� ���ڶ�� �ұ����� ���߾� �ּ���', 1, 0, 10, 31, 42, sysdate);




insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '��ħ������...�κα�ġ�����', '�κα�ġ�����.jpg', '����url', '���� ����� ��ħ�� ���� ������ ��Ա� ����� ���� ���̳� ��, � �ϳ� ���� �־�� �ϱ⿡ �ִ� ���� �����ϰ� �Ǵ��⵵ Ǫ���� �κα�ġ������� �������ϴ�.'
, '30�� ����', 'Normal', '���, �����ʷϺκ�, ����, �κ�, ������, ����, �ұ�,������ġ,���⸧,�ٽø���ġ����,�ұ�', '3��,1/2��,1/4��,200g,1ū��,�ణ,3����,1��,1/2ū��,3��,�ణ', '��� 3��, �ұ� 3����, ���� �ʷϺκ� 1/2�븦 ���� ��� �ְ� ��� �� Ǯ�� �ݴϴ�.,���� ���� ��ġ 1�Ű�  ���� 1/4���� ���� �ְ� ���⸧ 1/2ū���� ���� ���� �־����ϴ�. , ���⸧�� �� �赵�� �������� �κ� 200g�� �ְ� �����鼭 ���� ���� �ݴϴ�.,�׸��� �ٽø� ��ġ���� 3���� �װ�.....,������ 1ū���� ���� �ϰ� ���� �ݴϴ�.,�׸��� �غ��� ����� �� ���� ���� ���ð� ����� ū���̷� ��ġ���ʰ� ���� �ѷ��ָ鼭 ���� �װ� ũ�� �ѹ� ��~ ���� ���� �ݴϴ�.,������ ���� �ұ� ���� �ణ���� ���ּ���~~'
, 1, 0, 10, 11, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '�䵵���� ���� ���� ��ĥ��! �����ٹ�ħ, ������ ����, �ع���', '�����ٹ�ħ.jpg', '����url', '������ ���尡��� �������� ��ĥ�� ���� ���ְ� ���ĳ� �䵵�� �ع��� �����ٹ�ħ~'
, '10�� ����', 'Easy', '����������, ��, �ұ�, ���尡��, ������, ��ġ����, ����,��������,���⸧,���', '150g,�ణ,�ణ,1.5ū��,1.5ū��,1.5ū��,1ū��,0.5ū��,1ū��,�Ѳ���', '�ұ� ��ū�� ���� ���� ������ �������� �ְ� 1�г��� ��Ƴ��ϴ�.,������ ����� �󱸾� �ּ���. �̶� ��¦ ������ �Ƹ����� ���ư���ϴ�., ��ġ���� 1.5ū�� �������� 1/2ū�� ������ 1.5ū�� ���� 1ū�� ���尡�� 1.5ū�� ���⸧ ���ұ� �ణ��, �������� ��ġ�� ���ִ� ��������~ �ϼ�!!,�˳��� ���� ���ְ� ��ź�����~'
, 1, 0, 10, 11, 52, sysdate);




insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 2, '[��ġ ������]�䵵�� ��ġ ���������� ���Ѱ��� �ҵ�', '��ġ������.jpg', '����url', '������ ���鶧 �ع��� �ַ� ����ϴµ� �ع���� �ٸ� ��Ḧ �����غ��ٰ� ��ġ�� �־�ô��� ���ִ��󱸿�. �Ը������� �̰� �ϳ��� ���Ѱ��� �ҵ�. �ӽθ������� ���ƿ�.'
, '15�� ����', 'Normal', '��ġĵ, ��ȣ��, ����������, û�����, ǥ�����, ��ġ�ٽø�����, ����,������,����', '1��,1/4��,1��,1��,1��,150ml,4T,2T,1T', '��ġ�� ä�ݿ� ���ļ� �⸧�� ���ּ���.,��ä���� �����ּ���. �ʹ� �۰� ������ ������ �İ��� ���⶧���� �ʹ� �۰� �������� ������.
��ä�� ����� �����ִ� ¥���� ��ä�� ����ص� �˴ϴ�., ����� �з���� ������� ������ּ���, �ҹ�⿡ ���� ���� ���� �Ǵ� ��, ������� �ְ� �����ּ���. �ڱ��ڱ� ������������ �����ֽø� �Ǵµ� ���� Ÿ�� �ʰ� ������ ������ �ּž� �մϴ�.'
, 1, 0, 10, 11, 62, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '������ �蹫ħ ����� �� �䵵���̳�', '�蹫ħ.jpg', '����url', '������ ���� ���ְ� Ȱ���� �� �ִ�
������ �蹫ħ ����� �� �˷��帱����'
, '5�� ����', 'Easy', '��, ������, ����, ���⸧, ���ұ�, ���� �Ǵ� ����', '5��,2T,0.5T,1T,0.5T,����', '�ޱ� �ҿ� ��ҷ� ���� �� �� �ڷ� �ѹ��� �ٽ� �����ֽôµ� �ٻ��� �İ���
����� ���� ������ �Ը���
������ �� �ؿ�,�� ������ ���� ��Һ����� �ְ�
������ �񺭰��� ���� �μ��ּ���,������� ������ ���⸧�� ���ұݸ� �ְ� ������� ����� �ֽôµ���, ������ �ĸ� �־� �����ֽð��
���ķ� �ϸ� ���� �� ����ϰ�����
�����ø� ���ķ� �ϼŵ� �������ϴ�.,�μ� ���� ���� ������ ���� �Űܴ�� ����� ���� ������� �־��ֽôµ� ������ ������ ���� �����̱� ������ ������� �ݹ� ����ϴ� �Ѱ��� ��ġ�� �ʵ��� ���� �ѷ��� �������� ���ּ���,
�׸��� �Ű� ���� �� ����� ���� �Ѹ���� ������ ¬������ �ٻ� �������� ������ �ع������� ��鿩 �Ա� ����������'
, 1, 0, 10, 11, 52, sysdate);



insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '�Դٸ��� ���� �� ���� ��ĥ��!!!�䵵�� �������~', '�������.jpg', '����url', '
���� ��ĥ�� �䵵�� ����� ������ʾƿ�^^'
, '2�ð��̳�', 'Hard', '�ϲɰ�, ����ū��, ��������, ����15cm, �ٽø�, ����,�븶��,��������,��', '5kg,1��,6��,2��,2����,2����,20��,1.7���� �Ѻ�,3.4����', '�������� 1.7���� �Ѻ��� ��3.4���͸� �װ� ���� ���� ���� �������� �ٽø� �븶�� ���Դٸ� 10���� �ְ� ������ ��ҿ� 30������ �� �����ݴϴ�,�׻��� �Ը� �ַ� �������� �ڹ� ������ �ľ ���⸦ ���ݴϴ�,
���Ⱑ ������� ������ ���� �ٸ��� ����� ������ �ٸ��� ���� ������ ���� �߶��ݴϴ�,������ �Ը� �뿡 �������� �����ð� ���� �� ������ ������ ������ �ξ��ּ���.(�԰� ��ܾ��ؿ�)
�״�� ��ġ����� �־�νð� 2-3���ĺ��� ��ø� �˴ϴ�,
��ñ��� �Ա����� �и��� ����ֽð� ����,û����ߵ��� �߰� �� ���� ��ŵ� ���ƿ�'
, 1, 0, 10, 11, 42, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 5, '�ƺ�ī�� �� �䵵��', '�������.jpg', '����url', 
'�䵵�� �ƺ�ī�� ���Դϴ�.'
, '30�г���', 'Normal', '��������, ���⸧, ���߳���, ���', '�ణ,1ū��,�ణ,1ū��', '�ƺ�ī�� �� ����
 ���� �ݰ��� �ƺ�ī��3�� ����丶�� 10�� ���� �ݰ�
�����: ����1ū��+����2ū��+����8ū��_+�Ž�û1ū�� +������1ū��
���������ణ+���߳��� �ణ+���⸧1ū��+���1ū���� �ʿ��մϴ�., ���Ĺݰ��� ä����ְ� �ƺ�ī���� ������ ���� �� �����ϰ� ������ ����
���� ������� ����ָ� �˴ϴ�.,����丶��� ������ ������ �ľ� ����丶��� 2������ְ� ������ �ݴ޸������
������.,������� ������.
���� ���� ���� �Ž�û ������ �������� ���߳��� ���⸧ ���� �־� ���� �����,���� ��⿡ �ƺ�ī�� ����丶��  ���� ������ ��ƿ�.,������� �ְ� ����ǿ��� �ݳ��� �������ָ� �˴ϴ�.,
������ �ƺ�ī�� ���� �信 ���� ������ �ʹ� ���ְ���.
�ƺ�ī�� ���� ���庸���� 3~4�� ������ �Դ� ���� ����ϴ�.,�䵵�� �ƺ�ī�� ��'
, 1, 0, 10, 11, 52, sysdate);


insert into recipe_info(recipe_no, mem_no, recipe_title, recipe_thumbnail, recipe_video, recipe_content, recipe_time, recipe_level, mate_name, mate_cnt, step, 
	                visit_cnt, report_cnt, kind_tag_no, theme_tag_no, material_tag_no, recipe_uploadtime)

values(recipe_info_seq.nextval, 3, '���ɷ��� �䵵�� ��������� �������������', '��������.jpg', '����url', 
'?��������� ���κ��� ��ǳ�� ���� ���� �׾Ƹ��� ������ ä��
�������� �ʵ��� ���絥�� �����Ǿ��µ���
�� ���� ����� �Ҷ߹��� �ҷ� �Ǽ� ������ ������'
, '60�г���', 'Normal', '��������, ���⸧', '3����,2T', '�� ���� �������� �������� �ҰԿ�,��������� �Ҷ߹��� 30�� ���� �ҷ�
����� Į������ ���� �ݴϴ�
���� ���� �ʵ��� ���� ���ſ� �� �����θ� �� ���ƿ�,�� �� ���� ���ǿ� �÷� 20������ �� �ݴϴ�,�������ϴ� ������ �� �����
�� �� ���� �츸 �߶� �������� �� ���� �������� �÷� ������ ���� ������ ��,���� ���� �������� ���⸧ �߶� �ҿ� ��� �������ϴ�
���ų��� ������ �մϴ� ����
�̱��̱�~~
¬�ɷ��ϴ� ���� ���� �䵵�� �������� �Դϴ�'
, 1, 0, 10, 11, 42, sysdate);




insert into rpatest values('mmm123@naver.com',sysdate);      
insert into rpatest values('haj1003@naver.com',sysdate);
insert into rpatest values('rnlwneh@naver.com',sysdate);



commit;


