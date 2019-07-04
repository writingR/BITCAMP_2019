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

/*
 2019/07/04
 그룹함수
*/

# SUM : 그룹의 합을 반환

#예제1. 사원테이블에서 사원의 월급여(SAL)의 총합을 구해보자.

select SUM(SAL) as '월 총급여'
from project.EMP
;

#예제2. 사원테이블에서 10번 부서 소속 직원들의 월 급여 총액을 구해보자. 

select SUM(SAL) as '월 총급여'
from project.EMP
where DEPTNO = 10
;
 
 # 화폐 천단위 세자리마다 콤마찍기
select format(sum(sal),0) as '월 총급여'
from project.EMP
where DEPTNO = 10
;

/*
SUM 함수에서 NULL값 처리방식 : NULL값은 무시한다.
*/

#예제3. 사원테이블에서 COMM의 총합을 구해보자.

select SUM(COMM)
from project.EMP
;

# NULL이 포함된 COMM 테이블
select COMM
from project.EMP
;

/*
AVG(컬럼) : 그룹에 포함된 값들의 평균값을 반환해주는 함수
*/

#예제4. 사원테이블에서 SAL의 평균을 구해보자.
select AVG(SAL)
from project.EMP;

select truncate(AVG(SAL),0) as "전체사원의 평균 월 급여"
from project.EMP;


#예제5. 사원테이블에서 SAL의 평균을 구해보자. --> 조건:직급에 따른 매니저들의 평균 월급여

select truncate(AVG(SAL),0) as "전체사원의 평균 월 급여"
from project.EMP
where job = 'MANAGER';

#예제6. avg 함수도 컬럼의 값이 null일때 제외하고 처리

select AVG(COMM)
from project.EMP
;

/*
MAX(컬럼):최대값 반환
MIN(컬럼):최소값 반환
*/

#예제7. 사원테이블에서 최대급여(SAL)와 최소급여(SAL)를 알아보자.

select MAX(SAL) as "최대 급여", MIN(SAL) as "최소 급여"
from project.EMP
;

