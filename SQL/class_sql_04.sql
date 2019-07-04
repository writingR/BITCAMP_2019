CREATE TABLE project.Book (
  bookid      int PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       int 
);

CREATE TABLE  project.Customer (
  custid      int PRIMARY KEY,  
  name        VARCHAR(40),
  address     VARCHAR(50),
  phone       VARCHAR(20)
);


CREATE TABLE project.Orders (
  orderid int PRIMARY KEY,
  custid  int REFERENCES project.Customer(custid),
  bookid  int REFERENCES Book(bookid),
  saleprice int ,
  orderdate DATE
);

-- Book, project.Customer, project.Orders 데이터 생성
INSERT INTO project.BOOK VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO project.BOOK VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO project.BOOK VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO project.BOOK VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO project.BOOK VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO project.BOOK VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO project.BOOK VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO project.BOOK VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO project.BOOK VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO project.BOOK VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO project.Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO project.Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO project.Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO project.Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO project.Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

-- 주문(project.Orders) 테이블의 책값은 할인 판매를 가정함
INSERT INTO project.Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (7, 4, 8, 13000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));


COMMIT;


desc project.book;
desc project.customer;
desc project.orders;

# ---고객입장 문제--- 

#1. 도서번호가1인도서의이름

select bookname
from project.BOOK
where bookid = 1;

#--> TC
select bookname
from project.BOOK
where bookname like '%축구%'
;

#2. 가격이20,000원이상인도서의이름

select bookname
from project.BOOK
where price >= 20000;

#--> TC
select bookname
from project.BOOK
where price >=20000
;

#3. 박지성의총구매액(박지성의고객번호는1번으로놓고작성)

select saleprice
from project.Orders
where custid = 1;

#--> TC
select SUM(saleprice) as "총 구매액"
from project.Orders
where custid = 1;

 #4. 박지성이구매한도서의수(박지성의고객번호는1번으로놓고작성)
 
select *
from project.Orders
where custid = 1;

#--> TC
select COUNT(*) as "구매횟수"
from project.Orders
where custid = 1;


# ---운영자입장 문제--- 

#5. 마당서점도서의총개수
 
 select COUNT(*)
 from project.BOOK;
 
 #--> TC
select COUNT(*) as "총 도서의 개수"
from project.BOOK;
 
#6. 마당서점에도서를출고하는출판사의총개수

select COUNT(publisher) from project.BOOK; 

 #--> TC
select  COUNT(distinct publisher)
from project.BOOK;
 
#7. 모든고객의이름, 주소

select COUNT(name)
from project.Customer;

select COUNT(address)
from project.Customer;

#--> TC
select name,address
from project.Customer;

# phone도 출력해야할 시(NULL값 없이 출력해야 할 경우)
select name,address,ifnull(phone,'미등록') as 'phone'
from project.Customer;


#8. 2014년7월4일~7월7일사이에주문받은도서의주문번호

select orderid
from project.Orders
where orderdate between '14/07/04' and '14/07/07';

#--> TC
select orderid,orderdate
from project.Orders
where orderdate BETWEEN '14/07/04' AND '14/07/07'; 

#9. 2014년7월4일~7월7일사이에주문받은도서를제외한도서의주문번호

select orderid
from project.Orders
where not (orderdate between '14/07/04' and '14/07/07');

#--> TC
select orderid,orderdate
from project.Orders
where orderdate NOT BETWEEN '14/07/04' AND '14/07/07'; 


#10. 성이‘김’씨인고객의이름과주소

select name,address
from project.Customer
where name like '김%';

#--> TC
select name,address
from project.Customer
where name like '김%';

#11. 성이‘김’씨이고이름이‘아’로끝나는고객의이름과주소

select name,address
from project.Customer
where name like '김%아'; 

#--> TC
select name,address
from project.Customer
where name like '김%아';


#예제12. 테이블에서 회원의 이름과 주문정보를 출력해보자.

select o.orderid,c.name
from project.Orders as o, project.Customer as c
where o.custid = c.custid;

# 위 조건에서 회원이름 '박지성'을 찾아보자.

select o.orderid,c.name
from project.Orders as o, project.Customer as c
where o.custid = c.custid
and c.name = '박지성';

# 위 조건에서 총 구매액과 총 구매횟수를 구해보자.

select SUM(saleprice) as '총 구매액', count(*) as '총 구매횟수'
from project.Orders as o, project.Customer as c
where o.custid = c.custid and c.name = '박지성';

/*
 테이블 3개 조인하기
 --> customer, book, orders
*/

# Cross Join

select *
from project.Orders o, project.Customer c;

select *
from project.Orders o, project.Customer c, project.Book b;

# custid 는 조인을 시켜서 문제가 되지 않지만 bookid는 조인을 시켜주지 않아서 서로 다른 정보를 갖게 된다.
select *
from project.Orders o, project.Customer c, project.Book b
where o.custid= c.custid
;

# 해결책 ---> bookid도 조인을 시켜준다.   
select *
from project.Orders o, project.Customer c, project.Book b
where o.custid= c.custid
      and o.bookid = b.bookid
;

#예제13. 테이블에서 박지성 고객이 주문한 책의 이름을 출력해보자.

select b.bookname
from project.Orders o, project.Customer c, project.Book b
where o.custid= c.custid
	  and o.bookid = b.bookid
      and c.name = '박지성';
      
      
# 위 조건에서 추가로 출판사를 추가로 출력할 경우,

select b.bookname, b.publisher
from project.Orders o, project.Customer c, project.Book b
where o.custid= c.custid
	  and o.bookid = b.bookid
      and c.name = '박지성';


       
 # outer join 이용해서 모든내용 출력하기   
 
select *
from project.Customer;

select distinct (custid)
from project.Orders;
      
# 1.먼저 조인해보기.      
select *
from project.Orders o, project.Customer c
where o.custid = c.custid;

select *
from project.Orders o right outer join project.Customer c
on o.custid = c.custid;

