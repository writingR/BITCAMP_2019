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




