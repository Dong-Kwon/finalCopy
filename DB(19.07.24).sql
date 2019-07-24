--Final----------------------------------------------------------------------------------
drop table admin;
drop sequence admin_seq;
drop table members;
drop table title_img;
drop table notice;
drop table message;
drop table payments;
drop table inquiring;
drop table report;
drop table point_using;
drop table point_charging;
drop table auction_board;
drop table auction_img_board;
drop table used_transaction_board;
drop table used_transaction_img_board;
drop table tender;
drop table comments;
drop table order_t;
drop table delivery;
drop table trade_cart;
drop table auction_cart;
drop table comments2;
drop sequence tender_seq;
drop sequence comments_seq;
drop sequence t_no_seq;
drop sequence n_no_seq;
drop sequence p_no_seq;
drop sequence e_no_seq;
drop sequence r_no_seq;
drop sequence a_no_seq;
drop sequence a_i_seq;
drop sequence u_no_seq;
drop sequence u_t_i_no_seq;
drop sequence p_u_no_seq;
drop sequence p_c_no_seq;
drop sequence order_seq;
drop sequence delivery_seq;
drop sequence comments_seq2;
create table members( --ȸ������ ���̺�
    id varchar(30) primary key,
    pw varchar(100) ,
    name varchar(20),
    phone varchar(20),
    point number default 0,
    zipcode varchar(100) ,
    address1 varchar(100) ,
    address2 varchar(100) ,
    joindate timestamp default sysdate,
    ipaddress varchar(20) not null,
    logintype varchar(20) not null,
    member_class varchar(20) default '����',
    blacklist char(1) default 'n',
    admin char(1) default 'n'
);
create table title_img( --����ȭ�� �̹���
    no number not null,
    filename varchar(300) not null,
    oriflename varchar(300) not null,
    filepath varchar(300) not null,
    filesize number not null
);

create sequence t_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table notice( --�������� ���̺�
    no number not null,
    title varchar(100) not null,
    contents varchar(3000) not null,
    image varchar(300),
   viewcount number default 0,
     joindate timestamp default sysdate
);

create sequence n_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table message( --���� ���̺�
    id varchar(50) not null,
    receiver varchar(50) not null,
    title varchar(100) not null,
    contents varchar(3000) not null,
     joindate timestamp default sysdate
);

create table payments( --���� ���̺�
    no number not null,
    name varchar(20) not null ,
    id varchar(50) not null,
    phone varchar(20) not null,
    price number not null,
    joindate timestamp default sysdate
);

create sequence p_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table inquiring( --��� ���̺�
    no number not null,
    id varchar(50) not null,
    name varchar(20) ,
    contents varchar(3000) not null,
    joindate timestamp default sysdate,
    seller varchar(1) check (seller in ('n','y'))
);

create sequence e_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table report( --�Ű� ���̺�
    no number not null,
    title varchar(1000) not null,
    sender varchar(50) not null,
    reason varchar(100)not null, 
    contents varchar(1000) not null
);

create sequence r_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table point_using( --����Ʈ ��볻��
no number primary key,
    id varchar(50) not null,
    title varchar(100) not null,
    payment number not null,
     joindate timestamp default sysdate
);
create sequence p_u_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
create table point_charging( --����Ʈ ��������
       no number primary key,
    id varchar(50) not null,
    money number not null,
     joindate timestamp default sysdate
);
create sequence p_c_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table auction_board( --��� �Խ���
    no number primary key,
    id varchar(50) not null,
    title varchar(100) not null,
    title_img varchar(300) not null,
    phone varchar(20) not null,
    contents varchar(3000) not null,
    viewCount number default 0,
    start_date varchar(50) default to_char(sysdate,'YY-MM-DD HH:mi:ss'),   -- ������
    end_date varchar(50) not null,  -- ������
    starting_price number not null, -- ���۰�
    min_price number not null,      -- �ּ� ���� ����
    present_price number default 0, -- ���簡
    member_class varchar(20) not null, -- ȸ�����
    account varchar(30) not null,      --����
    bid_count number default 0, --����� �����ߴ���
    category varchar(20) not null,
    trade_type varchar(30) not null, --� ���� �ŷ�����
    delivery varchar(30) default '������', -- ����/ ����/ ������
    delivery_cost number default 0 ,-- �ù���
    onGoing char(1) default 'y' --����������?
);

create sequence a_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table auction_img_board( --��� �Խ��� �̹��� ���̺�
    no number primary key,
    title_img varchar(300) not null,
    middle1_img varchar(300) not null,
    middle2_img varchar(300),
    middle3_img varchar(300),
    middle4_img varchar(300),
    middle5_img varchar(300),
    middle6_img varchar(300),
    middle7_img varchar(300),
    middle8_img varchar(300),
    middle9_img varchar(300),
    middle10_img varchar(300)
);

create sequence a_i_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table used_transaction_board( --�߰�ŷ� �Խ��� ���̺�
    no number primary key,
    id varchar(50),
    title varchar(100) not null,
    title_img varchar(300) not null,
    phone varchar(20) not null,
    contents varchar(3000) not null,
    viewCount number default 0,
    price number not null,
    member_class varchar(20) not null,
    account varchar(20) not null,
    category varchar(20) not null,
    trade_type varchar(30) not null,       -- ���ŷ�? �Ƚɰŷ�?
    delivery varchar(30) default '������',  -- ����/ ����/ ������
    delivery_cost number default 0   ,      -- �ù���
    joindate varchar(50) default to_char(sysdate,'YY-MM-DD HH:mi:ss'),
    onGoing char(1) default 'y'
);

create sequence u_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table used_transaction_img_board( --�߰�ŷ� �Խ��� �̹��� ���̺�
    no number primary key,
    title_img varchar(300) not null,
    middle1_img varchar(300) not null,
    middle2_img varchar(300),
    middle3_img varchar(300),
    middle4_img varchar(300),
    middle5_img varchar(300),
    middle6_img varchar(300),
    middle7_img varchar(300),
    middle8_img varchar(300),
    middle9_img varchar(300),
    middle10_img varchar(300)
);

create sequence u_t_i_no_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table tender(--���� 
    seq number ,
    board_num number not null,
    board_title varchar(100) not null,
    board_img varchar(100),
    id VARCHAR(100),
    point number,
    time timestamp default sysdate,
    ipaddress VARCHAR(20),
    onGoing char(1) default 'y'
);  

create sequence tender_seq
start with 1
increment by 1
nocache
nomaxvalue;

create table comments(-- ���
    seq number primary key,
    boardNum number not null,
    id varchar(30) not null,
    contents VARCHAR(500) not null,
    time timestamp default sysdate,
    ipaddress varchar(30) not null
);

create sequence comments_seq
start with 1
increment by 1
nocache
nomaxvalue;
create table order_t(
    seq number primary key,
    product_num number not null,
    product_title varchar(100) not null,
    product_img varchar(200) ,
    seller varchar(50) not null,
    buyer varchar (50)not null,
    price number not null,
    type varchar(50) not null,
    join_date timestamp default sysdate,
    situation varchar(100) default '�ԱݿϷ�' not null
);
create sequence order_seq
start with 1
increment by 1
nocache
nomaxvalue;

create table admin(		      -- ������(�湮�� ��) ���̺�
no number primary key,
visitDate varchar2(50) default to_char(sysdate,'YY-MM-DD HH:mi:ss'),
visitCount number not null
);

create sequence admin_seq	      -- ������(�湮�� ��) ������
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table delivery( --��� ���� t
	seq number primary key,
	product_num number not null,
	company_code number not null,
	waybill_num varchar(200) not null,
	sender varchar(100) not null,
	recipient varchar(100) not null
);
create sequence delivery_seq	      --��� seq 
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table trade_cart(   --�� ���
    id varchar(50),
    no number not null,
    title_img varchar(300) not null,
    title varchar(100) not null,
    trade_type varchar(30) not null,       -- ���ŷ�? �Ƚɰŷ�?
    delivery varchar(30) not null, -- ����/ ����/ ������
    price number not null
);

create table auction_cart(
    id varchar(50),
    no number not null,
    title_img varchar(300) not null,
    title varchar(100) not null,
    end_date varchar(50) not null,
    delivery varchar(30) not null,
    price number not null
);  
create table comments2(-- ���
    seq number primary key,
    boardNum number not null,
    id varchar(30) not null,
    contents VARCHAR(500) not null,
    time timestamp default sysdate,
    ipaddress varchar(30) not null
);

create sequence comments_seq2
start with 1
increment by 1
nocache
nomaxvalue;


update members set point = 1000000;
insert into members values('admin@admin.com','13a95c75b44f95ead23f47f0bf10667e57b44ec5150180c8a39a39361cf56169','admin',null,default,null,null,null,default,'a','admin','���','n','y');
commit;
