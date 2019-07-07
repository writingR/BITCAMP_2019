CREATE TABLE project.dept (
  `DEPTNO` int(11) NOT NULL,
  `DNAME` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `LOC` varchar(13) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
);
 
CREATE TABLE project.emp (
  `EMPNO` int(11) NOT NULL,
  `ENAME` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `JOB` varchar(9) COLLATE utf8_bin DEFAULT NULL,
  `MGR` int(11) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` int(11) DEFAULT NULL,
  `COMM` int(11) DEFAULT NULL,
  `DEPTNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `FK_DEPTNO` (`DEPTNO`),
  CONSTRAINT `FK_DEPTNO` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`)
);
 
INSERT INTO project.DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
 
INSERT INTO project.DEPT VALUES (20, 'RESEARCH',   'DALLAS');
 
INSERT INTO project.DEPT VALUES (30, 'SALES',      'CHICAGO');
 
INSERT INTO project.DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
 
 
 
 
INSERT INTO project.EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO project.EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO project.EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO project.EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO project.EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO project.EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO project.EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO project.EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO project.EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO project.EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO project.EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO project.EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO project.EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO project.EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);

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

desc  project.DEPT;
desc  project.EMP;

#1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ENAME as '사원이름',SAL as '급여',SUM(SAL+300) as '인상된 급여'
from project.EMP
group by SAL; 
#2. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오, 연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.
select ENAME as `사원이름`,SAL as `급여`,SAL*12+100 as `연간 총 수입`
from project.EMP
order by `연간 총 수입`;
#3. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.
select ENAME,SAL
from project.EMP
where SAL >= 2000
order by SAL desc;
#4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
select ENAME,DEPTNO
from project.EMP
where EMPNO = '7788';
#5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
select ENAME, SAL
from project.EMP
where SAL NOT BETWEEN 2000 AND 3000;
#6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.
select ENAME, JOB, HIREDATE
from project.EMP
where HIREDATE BETWEEN '81/02/20' AND '81/05/01';
#7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
select ENAME,DEPTNO
from project.EMP
where DEPTNO = 20 or 30
order by ENAME desc;
#8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오.
select ENAME,SAL,DEPTNO
from project.EMP
where SAL BETWEEN 2000 and 3000
      AND DEPTNO = 20 and 30
order by ENAME;
#9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)
select ENAME,HIREDATE
from project.EMP
where HIREDATE like '1981%';
#10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
select ENAME, JOB
from project.EMP
where MGR IS NULL;
#11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
select ENAME, SAL, COMM
from project.EMP
where COMM is not null
order by COMM desc;
#12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
select ENAME
from project.EMP
where ENAME LIKE '__R%';
#13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select ENAME
from project.EMP
where ENAME LIKE '%A%' 
	  and ENAME LIKE '%E%';
#14. 담당업무가 CLERK, 또는 SALESMAN이면서 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
select ENAME, JOB, SAL
from project.EMP
where JOB = 'CLERK' or JOB = 'SALESMAN' and not(SAL in(1600,950,1300));
#15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
select ENAME,SAL,COMM
from project.EMP
where COMM >= 500;
#16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
select ENAME,substring(HIREDATE,1,7) as '입사년도'
from project.EMP;
#17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
select ENAME,substring(HIREDATE,1,7)
from project.EMP
where HIREDATE like '____-04%';
#18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select EMPNO,ENAME
from project.EMP
where mod(EMPNO,2)=0;
#19. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.
select date_format(HIREDATE,'%y-%b-%a') as 'JOIN'
from project.EMP;
#20. 올해 몇 칠이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
 select
   now()-date_format(now(), '%Y.%m.%d'),
   datediff(now(),STR_TO_DATE('1-1-2019','%d-%m-%Y'));
#21. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.
select ifnull(mgr,0) as '상관사번',ENAME
from project.EMP;
#22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 ‘ANALIST”인 사원은 200, ‘SALESMAN’인 사원은 180, ‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오.
select ENAME,JOB,SAL,
		(case job
        when 'ANALYST' then sal+200
        when 'SALESMAN' then sal+180
        when 'MANAGER' then sal+150
        when 'CLERK' then sal+100
        END
        )as '인상된 급여'
from project.EMP
order by JOB;
#23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 평균에 대해서는 정수로 반올림하시오.
select ENAME,MAX(SAL),MIN(SAL),SUM(SAL),ROUND(AVG(SAL))
from project.EMP
group by ENAME;
#24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오. 평균에 대해서는 정수로 반올림 하시오.
select JOB,MAX(SAL),MIN(SAL),SUM(SAL),ROUND(AVG(SAL))
from project.EMP
group by JOB;
#25. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.
select JOB,COUNT(*)
from project.EMP
group by JOB;
#26. 관리자 수를 나열하시오.
select MGR,COUNT(*)
from project.EMP;
#27. 급여 최고액, 급여 최저액의 차액을 출력하시오.
select MAX(SAL),MIN(SAL),MAX(SAL)-MIN(SAL)
from project.EMP;
#28. 직급별 사원의 최저 급여를 출력하시오. 관리자를 알 수 없는 사원의 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select JOB, MIN(SAL)
from project.EMP
where not (sal < 2000) 
	and MGR is not null
group by JOB
order by SAL desc;
#29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select JOB,DEPTNO,COUNT(*),format(AVG(SAL),2)
from project.EMP
group by JOB;
#30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 부서내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 정수로 반올림 하시오. DECODE 사용.
select e.JOB,d.DNAME,d.LOC,COUNT(*),format(AVG(e.SAL),0) as '평균급여'
from project.EMP e, project.DEPT d
where e.DEPTNO = d.DEPTNO
group by e.JOB;
#31. 업무를 표시한 다음 해당 업무에 대해 부서 번호별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오. 별칭은 각 job, dno, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오. ( hint. Decode, group by )
select job as job, e.DEPTNO as dno ,
	   (case e.DEPTNO when 10 then sum(sal) end) as '부서 10',
       (case e.DEPTNO when 20 then sum(sal) end) as '부서 20',
       (case e.DEPTNO when 30 then sum(sal) end) as '부서 30',
       sum(sal) as '총액'
from project.EMP e, project.DEPT d
where e.deptno = d.deptno
group by JOB
order by e.DEPTNO ;
#32. EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하시오.
select d.DEPTNO,d.DNAME
from project.EMP e, project.DEPT d
where e.DEPTNO = d.DEPTNO
	  and e.ENAME = 'SCOTT';
#33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오.
select e.ENAME,d.DNAME,d.LOC
from project.DEPT d
	 INNER JOIN project.EMP e
     ON d.DEPTNO = e.DEPTNO;
#34. 조인과 WildCARD를 사용하여 이름에 ‘A’가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select e.ENAME,d.DNAME
from project.EMP e
	 INNER JOIN project.DEPT d
     ON e.DEPTNO = d.DEPTNO
where e.ENAME LIKE '%A%';
#35. JOIN을 이용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select e.ENAME,e.JOB,e.DEPTNO,d.DNAME
from project.DEPT d, project.EMP e
where d.DEPTNO = e.DEPTNO
	  and d.LOC = 'NEW YORK';
#36. SELF JOIN을 사용하여 사원의 이름 및 사원번호, 관리자 이름을 출력하시오.
select e.ENAME,e.EMPNO,m.ENAME as '관리자이름'
from project.EMP AS e JOIN project.EMP AS m
where e.MGR = m.EMPNO;
#37. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select e.ENAME,e.EMPNO,m.ENAME
from project.EMP e LEFT OUTER JOIN project.EMP m
on e.MGR = m.EMPNO ;
#38. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. ( SCOTT )
select e.ENAME,e.DEPTNO,s.ENAME
from project.EMP e, project.EMP s
where s.DEPTNO = e.DEPTNO
	  and s.ENAME = 'SCOTT'
      and e.ENAME <> 'SCOTT';
#39. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select e.ENAME,e.HIREDATE
from project.EMP e, project.EMP w
where w.ENAME = 'WARD' and
	  w.HIREDATE < e.HIREDATE;
#40. SELF JOIN 을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select e.ENAME,e.HIREDATE,m.ENAME,m.HIREDATE
from project.EMP e, project.EMP m
where e.MGR = m.EMPNO
	  and e.HIREDATE<m.HIREDATE;

#1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
#(1) 도서번호가1인도서의이름
select bookname
from project.BOOK
where bookid = 1;
#(2) 가격이20,000원이상인도서의이름
select bookname
from project.BOOK
where price >= 20000;
#(3) 박지성의총구매액(박지성의고객번호는1번으로놓고작성)
select c.custid,SUM(saleprice)
from project.CUSTOMER c,project.ORDERS o
where c.custid = o.custid and
      c.custid = 1;
#(4) 박지성이구매한도서의수(박지성의고객번호는1번으로놓고작성)
select COUNT(o.custid)
from project.CUSTOMER c,project.ORDERS o
where c.custid = o.custid and
      c.custid = 1;
#2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
#(1) 마당서점도서의총개수
select COUNT(bookid)
from project.BOOK;
#(2) 마당서점에도서를출고하는출판사의총개수
select COUNT(publisher)
from project.BOOK;
#(3) 모든고객의이름, 주소
select name,address
from project.CUSTOMER;
#(4) 2014년7월4일~7월7일사이에주문받은도서의주문번호
select orderid,orderdate
from project.ORDERS
where orderdate BETWEEN '14/07/04' AND '14/07/07';
#(5) 2014년7월4일~7월7일사이에주문받은도서를제외한도서의주문번호
select orderid,orderdate
from project.ORDERS
where orderdate not BETWEEN '14/07/04' AND '14/07/07';
#(6) 성이‘김’씨인고객의이름과주소
select name,address
from project.CUSTOMER
where name LIKE '김%';
#(7) 성이‘김’씨이고이름이‘아’로끝나는고객의이름과주소
select name,address
from project.CUSTOMER
where name LIKE '김%아'; 
      