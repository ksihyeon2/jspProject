/* guest.sql */
show tables;

create table guest(
	idx int not null auto_increment primary key,   
	name varchar(20) not null,     
	content text not null,         
	email varchar(60),            
	homePage varchar(60),         
	visitDate datetime default now(),   
	hostIp varchar(30) not null    
);

desc guest;

insert into guest values (default,'관리자','방명록 서비스를 시작합니다.','tlugs1426@naver.com','tlugs1426.tistory.com',default,'192.168.50.62');

select * from guest;