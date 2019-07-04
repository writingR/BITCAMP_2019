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

/*
COUNT : NULL을 포함하지 않는다, row의 개수를 반환한다.
*/

#예제8. 사원테이블에서 회사에 소속된 사원의 수를 구해보자.

select COUNT(*) as '전체 사원의 수'
from project.EMP
;

#예제9. 사원테이블에서 10번부서의 소속된 직원의 수를 구해보자.

select COUNT(*)
from project.EMP
where DEPTNO = 10;

#예제10. 사원테이블에서 회사에 소속된 직원중에 커미션을 받는 직원의 수를 구해보자.

select COUNT(COMM)
from project.EMP;

#예제11. 사원테이블에서 부서의 수를 구해보자.

select COUNT(*)
from project.DEPT;

#예제12. 사원테이블에서 부서번호를 구해보자.

select DEPTNO
from project.EMP;

#중복된 것은 출력하지 말것 --> distinct
select distinct DEPTNO
from project.EMP;

#예제13. 사원테이블에서 부서번호의 개수를 구해보자.

select COUNT(DEPTNO)
from project.EMP;

#중복된 개수는 제외
select COUNT(distinct DEPTNO)
from project.EMP
;

#예제14. 사원테이블에서 사원의 직급을 검색해보자.

select job
from project.EMP;

#중복된것은 제외
select distinct job
from project.EMP;

#예제15. 사원테이블에서 사원의 직급의 개수를 구해보자.

select COUNT(job)
from project.EMP;

#중복된 개수는 제외
select COUNT(distinct job)
from project.EMP;

/*
GROUP BY: 특정 컬럼 값을 기준으로 그룹핑을 해야할 경우 사용한다, 집합함수(SUM,AVG,MAX,MIN) 함께 적용가능
컬럼이름 --> 그룹핑의 기준
*/

#예제15. 사원테이블에서 부서별,직급별로 급여를 검색해보자.

select job,DEPTNO,SAL
from project.EMP
group by job,DEPTNO;

#예제16. 사원테이블에서 부서별 평균급여를 검색해보자.

select DEPTNO as '부서번호' ,truncate(AVG(SAL),0) as '부서별 평균급여'
from project.EMP
group by DEPTNO order by DEPTNO desc;


#예제17. 사원테이블에서 부서별 급여합계, 평균급여, 총사원 , 커미션을 받는 사원의 수, 가장 높은 급여, 가장 낮은 급여를 구해보자. 

select DEPTNO, SUM(SAL), ROUND(AVG(SAL)), COUNT(*), COUNT(COMM), MAX(SAL), MIN(SAL)
from project.EMP
group by DEPTNO 
order by DEPTNO desc
;

#예제18. 사원테이블에서 직무별 지표를 출력해보자.

select JOB, COUNT(*) as "직원의 수" , format((SAL),0) as "직원의 총합", round(AVG(SAL)) as "급여의 평균", MAX(SAL), MIN(SAL)
from project.EMP
group by JOB
;

/*
HAVING : 조건을 제한할때 Where / 그룹의 결과를 제한할때 HAVING
*/

#예제18. 사원테이블에서 부서별 평균급여를 출력해라. (단 평균급여가 2000이상인 부서만 출력)

select DEPTNO as "부서번호",format(AVG(SAL),0) as "평균급여"
from project.EMP
group by DEPTNO
having AVG(SAL) >= 2000;

#예제19. 사원테이블에서 부서별 평균급여를 출력해라. (단 평균급여가 2900이상인 부서만 출력)

select DEPTNO as "부서번호",format(AVG(SAL),0) as "평균급여"
from project.EMP
group by DEPTNO
having AVG(SAL) >= 2900;

/*
JOIN : 2개 이상의 테이블을 옆으로 붙인다. --> 표현하는 컬럼이 늘어난다.
*/

#Cross Join
select *
from project.EMP,project.DEPT;

#Equi Join
select *
from project.EMP as e, project.DEPT as d
where e.DEPTNO = d.DEPTNO;

#예제20. 테이블에서 이름이 SCOTT인 사람의 부서명을 출력해보자

select e.ENAME,d.DNAME
from project.EMP as e, project.DEPT as d
where e.DEPTNO = d.DEPTNO
AND e.ENAME = 'SCOTT';

#추가로 부서번호를 출력해야 할 경우,  --> EMP,DEPT 두 테이블에 DEPTNO컬럼이 존재하기때문에 e.이나 d.을 명시해줘야한다.

select e.ENAME,d.DNAME,e.DEPTNO
from project.EMP as e, project.DEPT as d
where e.DEPTNO = d.DEPTNO
AND e.ENAME = 'SCOTT';

# 별칭 사용하기

select e.ENAME,d.DNAME,e.DEPTNO
from project.EMP e, project.DEPT d
where e.DEPTNO = d.DEPTNO
AND e.ENAME = 'SCOTT';


/*
Non-Equi Join
*/

select ENAME,SAL,GRADE,LOSAL,HISAL
from project.EMP e, project.SALGRADE s
where SAL BETWEEN s.LOSAL AND s.HISAL
order by GRADE ;

# 위 조건에서 SCOTT 사원이 어느 등급에 속해있는지 찾아보자.

select ENAME,SAL,GRADE,LOSAL,HISAL
from project.EMP e, project.SALGRADE s
where SAL BETWEEN s.LOSAL AND s.HISAL
	  and ENAME = 'SCOTT'
order by GRADE ;








