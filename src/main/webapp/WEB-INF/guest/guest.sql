show tables;

create table guest (
	idx int not null auto_increment primary key, /* 방명록의 고유번호 */
	name varchar(20) not null, 		/* 방명록 작성자 성명 */
	content text not null, 				/* 방명록 글 내용 */
	email varchar(50), 						/* 메일주소 */
	homePage varchar(50), 				/* 홈페이지 주소(블로그 주소) */
	vDate datetime default now(), /* 방문일자 */
	hostIp varchar(30) 						/* 방문자의 접속 IP */
);

desc guest;

insert into guest values(default, '관리자', '방명록 서비스를 시작합니다.', 'engo1@naver.com', 'www.naver.com', default, '192.168.59.59');

select * from guest;