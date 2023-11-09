show tables;

create table member (
	idx        int not null auto_increment,    				/* 1.회원 고유번호 */
	mid        varchar(30) not null,									/* 2.회원 아이디(중복 불허) */
	pwd        varchar(100) not null,									/* 3.회원 비밀번호(SHA256 암호화 처리) */
	nickName   varchar(20) not null,									/* 4.회원 닉네임(중복 불허/ 수정 가능)*/
	name       varchar(20) not null,									/* 5.회원 성명 */
	gender     char(2) not null default '남자', 		  	/* 6.회원 성별 */
	birthday   datetime default now(),								/* 7.회원 생일 */
	tel 			 varchar(15),														/* 8.전화번호 : 010-1234-5678 */
	address		 varchar(100),												  /* 9.주소(다음 API 활용) */
	email 		 varchar(60) not null,									/* 10.이메일(아이디/비밀번호 분실시에 사용) */
	homepage 	 varchar(60),														/* 11.홈페이지(블로그) 주소 */
	job				 varchar(20),														/* 12.직업 */
	hobby      varchar(100),													/* 13.취미(2개 이상 선택 가능, 구분자는 '/'로 처리) */
	photo			 varchar(100) default 'noimage.jpg',		/* 14.회원 사진	*/
	content		 text,																	/* 15.회원 소개 */
	userInfor  char(3) default '공개',									/* 16.회원 정보 공개여부(공개/비공개) */
	userDel		 char(2)	default 'NO',									/* 17.회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
	point 		 int default 100,												/* 18.회원 누적 포인트(가입 포인트 100포인트, 1회 방문시 10포인트 증가, 1일 최대 50포인트까지 허용, 물건 구매시 100원당 1포인트 증가) */
	level			 int default 1,													/* 19.회원 등급(0:관리자, 1:준회원, 2:정회원, 3:우수회원, (4:운영자)) */
	visitCnt	 int default 0,													/* 20.총 방문 횟수 */
	startDate  datetime default now(),								/* 21.최초 가입일 */
	lastDate 	 datetime default now(),								/* 22.마지막 접속일 */
	todayCnt	 int default 0,													/* 23.오늘 방문한 횟수 */
	/* salt 			 char(8) not null,	*/							/* 24.비밀번호 보안을 위한 salt */
	/* primary key (idx,mid) */
	primary key(idx), /*기본키*/
	unique(mid)		/*중복방지키*/
);

drop table member;

desc member;

select * from member;