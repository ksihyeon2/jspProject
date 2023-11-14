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