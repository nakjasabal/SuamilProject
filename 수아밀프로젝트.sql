/*** system계정에서 실행 ***/

--계정 생성
create user suamil identified by 1234;

--권한 부여
grant connect, resource to suamil;


/*** 수아밀 계정에서 실행 ***/

create table sua_comments
(	
	com_idx number, 
	com_name varchar2(50), 
	com_content varchar2(2000), 
	com_pass varchar2(30), 
	com_regidate date default sysdate, 
	board_idx number
) ;

create table sua_members 
(	
	id varchar2(30), 
	pass varchar2(30), 
	name varchar2(30), 
	tel varchar2(13), 
	mobile varchar2(13), 
	email varchar2(100), 
	zipcode char(5), 
	addr1 varchar2(100), 
	addr2 varchar2(200), 
	regidate date default sysdate
) ;
 
create table sua_community 
(	
	idx number, 
	name varchar2(50), 
	title varchar2(300), 
	content varchar2(2000), 
	postdate date default sysdate, 
	attachedfile varchar2(100), 
	downcount number(5,0), 
	pass varchar2(30), 
	visitcount number default 0, 
	bgroup number default 0, 
	bstep number default 0, 
	bindent number default 0, 
	b_flag varchar2(10) default 'pds'
);

create table sua_board
(	
	num number, 
	title varchar2(200), 
	content varchar2(2000), 
	postdate date default sysdate, 
	id varchar2(30), 
	visitcount number, 
	chumfile varchar2(100), 
	b_flag varchar2(20) default 'notice'
);

create sequence seq_borad_num
	increment by 1 
	start with 1
	minvalue 1 
	nomaxvalue 	
	nocache  
	nocycle ;
    



   
   
   