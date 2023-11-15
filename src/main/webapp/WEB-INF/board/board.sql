show tables;

create table board(
	idx      int not null auto_increment primary key,     /* 게시글의 고유 번호 */
	mid      varchar(30) not null,												/* 게시글 작성이 아이디 */
	nickName varchar(30) not null,												/* 게시글 작성이 닉네임 */
	title    varchar(100) not null,												/* 게시글 제목 */
	email    varchar(60),																	/* 이메일 주소 */
	homePage varchar(60),																	/* 홈페이지 주소 */
	content  text not null,																/* 게시글 내용 */
	readNum  int not null default 0,											/* 게시글 조회수 */
	hostIp   varchar(40) not null,												/* 게시글 작성이 IP */
	openSw   char(2) default 'OK',												/* 게시글의 공개 여부 (OK:공개, NO:비공개) */
	wDate    datetime default now(),											/* 게시글 작성 날짜 */
	good		 int default 0    														/* '좋아요' 클릭 횟수 누적 */
);

desc board;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','tlugs1426@naver.com','tlgus1426.tistory.com','게시할 내용들을 입력해 주세요.',default,'192.168.50.62',default,default,default);

select * from board;

select * from board order by idx desc limit 0,10;

select *, datediff(wDate, now()) from board order by idx desc limit 0,10;
/*뒤에서 앞에를 뺌 = 오늘 날짜에서 wDate를 뺌 (일수 구하기)*/
/* new.gif를 24시간동안만 보여주기 위한 처리*/
select *, timestampdiff(hour,wDate, now()) from board order by idx desc limit 0,10; /* (시간 구하기)*/

/* 이전글/다음글 꺼내오기 */
select * from board where idx=6;   /*현재 글*/
select * from board where idx < 6 order by idx desc limit 1;  /*이전 글*/
select * from board where idx > 6 order by idx limit 1;  /*다음 글*/

/* 날짜 함수 연습 <datetime 형식 비교> */
select now();    /* 오늘 날짜 */
/* date_add() */
select now() as 오늘날짜, date_add(now(), interval 1 day) as 다음날;
select now() as 오늘날짜, date_add(now(), interval -1 day) as 전날;
select now() as 오늘날짜, date_add(now(), interval 10 hour) as 10시간뒤;
select now() as 오늘날짜, date_add(now(), interval -10 hour) as 10시간전;

/* date_sub() */
select now() as 오늘날짜, date_sub(now(), interval 1 day) as 전날;
select now() as 오늘날짜, date_sub(now(), interval -1 day) as 다음날;

/* board 테이블에 적용 */
-- 게시글중에서 하루전에 올라온 글만 보여주시오
select wDate, date_add(now(), interval 1 day) from board;
select substring(wDate,1,10), substring(date_add(now(), interval -1 day),1,10) from board;
select idx, nickName,wDate from board where substring(wDate,1,10) = substring(date_add(now(), interval -1 day),1,10);

/* 날짜차이 계산 : DATEDIFF(시작날짜, 마지막날짜) <int 형식 비교> */
select datediff('2023-11-14',now());
select datediff(now(),wDate) from board;

select timestampdiff(hour,now(),wDate) from board;
select timestampdiff(day,wDate,now()) from board;

/* 날짜형식(date_format(날짜형식자료,포멧)) : 년도4자리 (%Y), 월(%m), 일(%d), 시간(%H), 분(%i) */
select wDate, date_format(wDate,'%Y-%m-%d') from board;
select wDate, date_format(wDate,'%Y-%m-%d %H:%i') from board;

