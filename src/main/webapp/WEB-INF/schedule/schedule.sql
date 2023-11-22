show tables;

create table schedule (
	idx			 			int not null auto_increment primary key,     	/* 스케줄 관리 고유 번호 */
	mid						varchar(30) not null,													/* 회원 아이디(일정 검색시 필요) */
	sDate					datetime not null,														/* 일정 등록 날짜 */
	part					varchar(10) not null,													/* 일정 분류(1.모임, 2.업부, 3.학습, 4.여행, 5.기타) */
	content				text not null,																/* 일정 상세 내역 */
	foreign key(mid) references member(mid)
);
desc schedule;

drop table schedule;

insert into schedule values (default,'admin','2023-11-01','학습','JSP 프로젝트 기획');
insert into schedule values (default,'admin','2023-11-01','모임','학원동기 모임 19시 사창사거리');
insert into schedule values (default,'admin','2023-11-05','업무','기획 회의 12시 30분');
insert into schedule values (default,'admin','2023-11-11','모임','뺴뺴로 데이 모임');
insert into schedule values (default,'admin','2023-11-15','학습','JSP 프로젝트 시작');
insert into schedule values (default,'admin','2023-11-22','학습','프로젝트 정기 점검');
insert into schedule values (default,'rose1234','2023-11-11','모임','뺴뺴로 데이 모임-사창사거리');
insert into schedule values (default,'rose1234','2023-11-15','여행','주말 여행 계획');
insert into schedule values (default,'rose1234','2023-11-22','학습','프로젝트 점검');

select * from schedule;

select * from schedule where mid='admin' and date_format(sDate, '%Y-%m') = '2023-11' order by sDate;