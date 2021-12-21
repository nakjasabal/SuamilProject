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
    

--일정게시판 select
SELECT B.* , to_char(postdate, 'yyyy-mm') pdate 
FROM sua_board B
WHERE b_flag='program'
ORDER BY postdate ASC;



--레코드
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (1,'공지사항 게시판 입니다.','공지사항 게시판 입니다.
공지사항 게시판 입니다.
공지사항 게시판 입니다.
공지사항 게시판 입니다.
공지사항 게시판 입니다.
파일첨부는 없어요...',to_date('21/12/20','RR/MM/DD'),'nakja',7,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (2,'보라카이 공항 편의점에서','점원이 물었다...
girl?? boy??
그냥 흐뭇했당..ㅋㅋ',to_date('21/12/20','RR/MM/DD'),'nakja',4,'소년과소녀사이.jpg','photo');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (3,'자유게시판 입니다.','공지사항과 동일한 스킨을 사용합니다. 
공지사항과 동일한 스킨을 사용합니다. 
공지사항과 동일한 스킨을 사용합니다. 
공지사항과 동일한 스킨을 사용합니다. 
공지사항과 동일한 스킨을 사용합니다. ',to_date('21/12/20','RR/MM/DD'),'nakja',4,null,'free');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (4,'동해로 일출 보러가기','동해로 일출 보러가기
동해로 일출 보러가기
',to_date('21/12/31','RR/MM/DD'),'nakja',3,null,'program');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (5,'성심당 낙지소보로','귀진 누님 보고잡네..ㅋㅋ
언제 또 오시나??',to_date('21/12/20','RR/MM/DD'),'nakja',3,'성심당낙지.png','photo');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (6,'양꼬치엔 칭따오~~','맛나긋당...
칭따오 한잔~~',to_date('21/12/20','RR/MM/DD'),'nakja',4,'양꼬치(0.98).png','photo');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (7,'바나나','바나나면 나한테 반하나??
ㅋㅋㅋ',to_date('21/12/21','RR/MM/DD'),'nakja',8,'바나나.png','photo');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (8,'사과/바나나/망고','뭘로 해볼까??
내용만 바꾸면??',to_date('21/12/21','RR/MM/DD'),'nakja',4,'망고1.png','photo');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (9,'이건 그냥 한번34','일정 게시판 잘 맹글었다..ㅋㅋ34',to_date('21/12/27','RR/MM/DD'),'nakja',12,null,'program');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (10,'아~~이제 한달 남았다..','한발 남았다..
ㅋㅋ',to_date('21/12/01','RR/MM/DD'),'nakja',5,null,'program');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (11,'이제 얼마 안남았다...ㅜㅜ','아흑~~슬포라~~~
우짜노...',to_date('21/12/15','RR/MM/DD'),'nakja',0,null,'program');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (12,'공지사항 게시판 입니다2','공지사항 게시판 입니다2',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (16,'공지사항 게시물 100개 입력하기-1-2-3','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (14,'공지사항 게시물 100개 입력하기-1','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (15,'공지사항 게시물 100개 입력하기-1-2','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (173,'공지사항 게시물 100개 입력하기-60','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (174,'공지사항 게시물 100개 입력하기-61','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (175,'공지사항 게시물 100개 입력하기-62','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (176,'공지사항 게시물 100개 입력하기-63','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (177,'공지사항 게시물 100개 입력하기-64','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (178,'공지사항 게시물 100개 입력하기-65','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (179,'공지사항 게시물 100개 입력하기-66','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (180,'공지사항 게시물 100개 입력하기-67','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (181,'공지사항 게시물 100개 입력하기-68','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (182,'공지사항 게시물 100개 입력하기-69','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (183,'공지사항 게시물 100개 입력하기-70','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (184,'공지사항 게시물 100개 입력하기-71','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (185,'공지사항 게시물 100개 입력하기-72','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (186,'공지사항 게시물 100개 입력하기-73','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (187,'공지사항 게시물 100개 입력하기-74','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (188,'공지사항 게시물 100개 입력하기-75','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (189,'공지사항 게시물 100개 입력하기-76','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (190,'공지사항 게시물 100개 입력하기-77','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (191,'공지사항 게시물 100개 입력하기-78','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (192,'공지사항 게시물 100개 입력하기-79','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (193,'공지사항 게시물 100개 입력하기-80','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (194,'공지사항 게시물 100개 입력하기-81','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (195,'공지사항 게시물 100개 입력하기-82','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (196,'공지사항 게시물 100개 입력하기-83','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (197,'공지사항 게시물 100개 입력하기-84','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (198,'공지사항 게시물 100개 입력하기-85','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (199,'공지사항 게시물 100개 입력하기-86','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (200,'공지사항 게시물 100개 입력하기-87','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (201,'공지사항 게시물 100개 입력하기-88','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (202,'공지사항 게시물 100개 입력하기-89','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (203,'공지사항 게시물 100개 입력하기-90','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (204,'공지사항 게시물 100개 입력하기-91','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (205,'공지사항 게시물 100개 입력하기-92','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (206,'공지사항 게시물 100개 입력하기-93','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (207,'공지사항 게시물 100개 입력하기-94','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (208,'공지사항 게시물 100개 입력하기-95','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (209,'공지사항 게시물 100개 입력하기-96','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (210,'공지사항 게시물 100개 입력하기-97','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (211,'공지사항 게시물 100개 입력하기-98','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (212,'공지사항 게시물 100개 입력하기-99','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (213,'공지사항 게시물 100개 입력하기-100','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (214,'올해는 잘해봅시다.','올해는 잘해봅시다.
올해는 잘해봅시다.
올해는 잘해봅시다.',to_date('22/01/01','RR/MM/DD'),'nakja',2,null,'program');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (116,'공지사항 게시물 100개 입력하기-3','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (117,'공지사항 게시물 100개 입력하기-4','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (118,'공지사항 게시물 100개 입력하기-5','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (119,'공지사항 게시물 100개 입력하기-6','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (120,'공지사항 게시물 100개 입력하기-7','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (121,'공지사항 게시물 100개 입력하기-8','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (122,'공지사항 게시물 100개 입력하기-9','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (123,'공지사항 게시물 100개 입력하기-10','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (124,'공지사항 게시물 100개 입력하기-11','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (125,'공지사항 게시물 100개 입력하기-12','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (126,'공지사항 게시물 100개 입력하기-13','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (127,'공지사항 게시물 100개 입력하기-14','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (128,'공지사항 게시물 100개 입력하기-15','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (129,'공지사항 게시물 100개 입력하기-16','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (130,'공지사항 게시물 100개 입력하기-17','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (131,'공지사항 게시물 100개 입력하기-18','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (132,'공지사항 게시물 100개 입력하기-19','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (133,'공지사항 게시물 100개 입력하기-20','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (134,'공지사항 게시물 100개 입력하기-21','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (135,'공지사항 게시물 100개 입력하기-22','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (136,'공지사항 게시물 100개 입력하기-23','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (114,'공지사항 게시물 100개 입력하기-1','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (115,'공지사항 게시물 100개 입력하기-2','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (137,'공지사항 게시물 100개 입력하기-24','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (138,'공지사항 게시물 100개 입력하기-25','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (139,'공지사항 게시물 100개 입력하기-26','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (140,'공지사항 게시물 100개 입력하기-27','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (141,'공지사항 게시물 100개 입력하기-28','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (142,'공지사항 게시물 100개 입력하기-29','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (143,'공지사항 게시물 100개 입력하기-30','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (144,'공지사항 게시물 100개 입력하기-31','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (145,'공지사항 게시물 100개 입력하기-32','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (146,'공지사항 게시물 100개 입력하기-33','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (147,'공지사항 게시물 100개 입력하기-34','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (148,'공지사항 게시물 100개 입력하기-35','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (149,'공지사항 게시물 100개 입력하기-36','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (150,'공지사항 게시물 100개 입력하기-37','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (151,'공지사항 게시물 100개 입력하기-38','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',1,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (152,'공지사항 게시물 100개 입력하기-39','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (153,'공지사항 게시물 100개 입력하기-40','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (154,'공지사항 게시물 100개 입력하기-41','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (155,'공지사항 게시물 100개 입력하기-42','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (156,'공지사항 게시물 100개 입력하기-43','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (157,'공지사항 게시물 100개 입력하기-44','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (158,'공지사항 게시물 100개 입력하기-45','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (159,'공지사항 게시물 100개 입력하기-46','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (160,'공지사항 게시물 100개 입력하기-47','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (161,'공지사항 게시물 100개 입력하기-48','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (162,'공지사항 게시물 100개 입력하기-49','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (163,'공지사항 게시물 100개 입력하기-50','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (164,'공지사항 게시물 100개 입력하기-51','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (165,'공지사항 게시물 100개 입력하기-52','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (166,'공지사항 게시물 100개 입력하기-53','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (167,'공지사항 게시물 100개 입력하기-54','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (168,'공지사항 게시물 100개 입력하기-55','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (169,'공지사항 게시물 100개 입력하기-56','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (170,'공지사항 게시물 100개 입력하기-57','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (171,'공지사항 게시물 100개 입력하기-58','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');
Insert into SUAMIL.SUA_BOARD (NUM,TITLE,CONTENT,POSTDATE,ID,VISITCOUNT,CHUMFILE,B_FLAG) values (172,'공지사항 게시물 100개 입력하기-59','공지사항 게시물 100개 입력하기',to_date('21/12/21','RR/MM/DD'),'nakja',0,null,'notice');


Insert into SUAMIL.SUA_MEMBERS (ID,PASS,NAME,TEL,MOBILE,EMAIL,ZIPCODE,ADDR1,ADDR2,REGIDATE) values ('nakja','sangmir','낙자쌤','010-1234-5678','010-7906-3600','nakjasabal@naver.com','08253','서울 구로구 고척로 49','202동',to_date('21/12/19','RR/MM/DD'));









   
   
   