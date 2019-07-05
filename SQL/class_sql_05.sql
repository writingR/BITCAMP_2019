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
CREATE TABLE project.SALGRADE 
(  GRADE int, 
 LOSAL int, 
 HISAL int 
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
INSERT INTO project.SALGRADE VALUES (1,700,1200); 
INSERT INTO project.SALGRADE VALUES (2,1201,1400); 
INSERT INTO project.SALGRADE VALUES (3,1401,2000); 
INSERT INTO project.SALGRADE VALUES (4,2001,3000); 
INSERT INTO project.SALGRADE VALUES (5,3001,9999); 


/*
 2019/07/05
 서브쿼리 : 하나의 SELECT문장의 절안에 또 하나의 SELECT문장이 포함된 문장.
*/

#단일 행 서브 쿼리 : 서브 쿼리의 수행 결과가 오직 하나의 ROW(행)만을 반환하는 쿼리.

#예제1. 사원테이블에서  사원'SCOTT'의 부서명을 출력하는 서브쿼리를 작성해보자.

select DNAME
from project.DEPT
where DEPTNO = (select DEPTNO
				from project.EMP
                where ENAME = 'SCOTT');


#예제2. 사원테이블에서  평균급여보다 급여를 더 많이 받는 사원의 사원이름,급여를 출력하는 서브쿼리를 작성해보자.

select ENAME,SAL
from project.EMP
where SAL > ( select AVG(SAL)
			  from project.EMP);

#예제3. 사원테이블에서 입사일이 '1980.12.17'인 부서번호,사원이름,급여를 출력하는 서브쿼리를 작성해보자.

select DEPTNO,ENAME, SAL
from project.EMP
where DEPTNO = ( select DEPTNO
			     from project.EMP
                 where HIREDATE = '80/12/17');


#다중 행 서브 쿼리 : 서브 쿼리의 수행 결과가 2개이상의 ROW(행)만을 반환하는 쿼리.

#예제4. 사원테이블에서 급여를 3000이상 받는 사원이 소속된 부서(10,20)와 동일한 부서에서 근무하는 사원의 이름,급여,부서번호를 출력하는 서브쿼리를 작성해보자.               
#IN             
select ENAME,SAL,DEPTNO
from project.EMP
where DEPTNO IN (select DEPTNO
				from project.EMP
                where SAL >= 3000);

#예제5. 사원테이블에서 부서번호가 30인 사원들 중 급여를 가장 많이 받는 사원보다 급여를 많이 받는 사원의 이름,급여,부서번호를 출력하는 서브쿼리를 작성해보자.                 
#ALL --> 모든 조건을 만족
select ENAME,SAL,DEPTNO
from project.EMP
where SAL > ALL (select SAL
				 from project.EMP
                 where DEPTNO = 30);

#예제6. 사원테이블에서 부서번호가 30인 사원들 중 급여를 가장 적게 받는 사원보다 급여를 많이 받는 사원의 이름,급여,부서번호를 출력하는 서브쿼리를 작성해보자.   
#ANY --> 조건 중 하나만 만족해도 실행
select ENAME, SAL
from project.EMP
where SAL > ANY (select SAL
				from project.EMP
                where DEPTNO = 30);
                
                
/*
인라인 뷰 : from절 뒤에 서브쿼리가 위치
*/


select *
from (
	select EMPNO, ENAME, JOB, HIREDATE
	from project.EMP
);


select ename, (
	
    select dname
	from project.dept d
	where d.deptno = e.deptno
    
)
from project.EMP e;





