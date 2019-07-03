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

# 2019/07/03

/* 
-- LIKE : 문자 패턴검색 연산자 키워드
-- 컬럼명 LIKE 패턴
-- 패턴 : %
-- %연산자를 사용시 _ (언더라인)연산자는 자리 고정을 의미 : 해당 자리에는 어떠한 값이 와도 상관없으나 한자리 글자여야 한다.
-- ex) _A : 앞자리에는 어떠한 문자여도 무관, 두번째 문자는 반드시 'A'가 와야함.
-- ex) _A_ : 문자를 찾을때 3자리를 찾는다. 첫째,셋째자리는 어떠한 문자여도 무관, 두번째 문자는 반드시 'A'가 와야함

-- % 패턴을 이용
 */

 
#예제.1  --> 사원테이블에서 's'로 시작하는 사원의 이름을 검색하자.

select ENAME
from project.EMP
where ENAME like 'S%';

#예제.2  --> 사원테이블에서 's'로 끝나는 사원의 이름을 검색하자.

select ENAME
from project.EMP
where ENAME like'%S';

#예제.3  --> 사원테이블에서 사원의 이름에 s를 포함하는 이름을 가진 사원을 검색하자.

select ENAME
from project.EMP
where ENAME like '%S%';

#예제.4  -->  사원테이블에서 사원의 이름에 두번째 글자가 'A'인 사원을 검색하자.

select ENAME
from project.EMP
where ENAME like '_A%';


#예제.5  -->  사원테이블에서 이름에 'A'를 포함하지 않는 사람만을 검색하자.

select *
from project.EMP
where ENAME NOT like '%A%';


/*
-- 대상컬럼 = NULL 넣게 되면,
-- 의미상 말이되지 않기 떄문에 값이 정의되지 않게 됩니다.
-- = 대신에 IS NULL 을 사용해야 합니다. *** 중요 ****
-- >,<,>=,<= 도 동일하다!

*/

#예제.6  --> 사원테이블에서 COMM(커미션)이 NULL인 사원을 검색하자.

select *
from project.EMP
where COMM IS NULL;


#예제.7  --> 사원테이블에서 COMM(커미션)이 NULL이거나 0인 사원을 검색하자.

select *
from project.EMP
where COMM IS NULL or COMM = 0;


#예제.8  --> 사원테이블에서 COMM(커미션)이 NULL이 아닌 사원을 검색하자.

select *
from project.EMP
where COMM IS NOT NULL;


#예제.9  --> 사원테이블에서 COMM(커미션)이 NULL이 아닌 사원을 검색하자. (0도 제외)

#첫번째
select *
from project.EMP
where NOT (COMM IS NULL or COMM = 0);

#두번째
select *
from project.EMP
where COMM IS NOT NULL AND COMM > 0;


/*
-- ORDER BY : 오름차순 , 내림차순
-- ASC : 작은 값부터 정렬 , 사전 순서, 빠른 날짜 순서, NULL -> 가장 마지막에 나옴
-- DESC : 큰 값부터 정렬 , 사전 반대 순서, 늦은 날짜 순서, NULL -> 가장 먼저 나옴
-- ORDER BY 뒤에 정의한다. 생략가능하다. 생략 시 오름차순으로 정의된다.
*/

#예제.10  -->  사원테이블에서 급여 컬럼을 기준으로 오름차순 정렬해서 사원을 검색해보자.

#첫번째
select *
from project.EMP
order by SAL;

#두번째
select *
from project.EMP
order by SAL ASC;


#예제.11  --> 사원테이블에서 급여 컬럼을 기준으로 내림차순 정렬해서 사원을 검색해보자.

select *
from project.EMP
order by SAL DESC;


#예제.12  --> 사원테이블에서 최근 입사한 사원 순으로 사원을 검색해보자.

select *
from project.EMP
order by HIREDATE DESC;


#예제.13  --> 사원테이블에서 급여를 내림차순으로 정렬하고 이름이 같은 사람이 존재할 경우 이름의 철자가 빠른 사람부터 검색해보자.

select *
from project.EMP
order by SAL DESC, ENAME ASC;


#예제.14  --> 사원테이블에서 급여를 내림차순으로 정렬하고 이름이 같은 사람이 존재할 경우 이름의 철자가 빠른 사람부터 검색해보자. (이름,급여만 검색)

select ENAME,SAL
from project.EMP
order by SAL DESC, ENAME ASC;


#예제.15  --> 사원테이블에서 급여를 내림차순으로 정렬하고 입사일이 같을경우 입사일이 늦게 입사한 사람순으로 검색해보자. (이름,급여,입사일만 검색)

select ENAME,SAL,HIREDATE
from project.EMP
order by SAL DESC, HIREDATE ASC;

