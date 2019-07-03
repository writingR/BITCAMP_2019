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


#문제1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.

select ENAME,SAL,SAL+300 as AddSal
from project.EMP;

#--> TC
select ENAME as NAME, SAL as SAL ,SAL+300 as '인상된 급여'
from project.EMP;

# as 사용시 한글로 사용해도 상관없다.


#문제2. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오. 연간 총 수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.

select ENAME,SAL,SAL*12+100 as AnnSal
from project.EMP
order by AnnSal DESC;

#--> TC
select ENAME as NAME,sal as SAl, sal*12+100 as INCOME
from project.emp
order by INCOME desc; 

#문제3. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.

select ENAME,SAL
from project.EMP
where SAL >= 2000 order by SAL DESC;

#--> TC
select ENAME,SAL
from project.EMP
where SAL > 2000 order by SAL DESC;

#문제4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.

select ENAME,EMPNO
from project.EMP
where EMPNO LIKE '7788';

#--> TC
select ENAME,DEPTNO
from project.EMP
where EMPNO = 7788;

#문제5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.

select ENAME,EMPNO
from project.EMP
where SAL >= 2000 AND SAL <= 3000;

#--> TC
select ENAME,EMPNO
from project.EMP
where SAL not between 2000 AND 3000;

# 범위 사용시 between A AND B ! 

#문제6. 1981년 2월 20일부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.

select ENAME,JOB,HIREDATE
from project.EMP
where HIREDATE >= '81/02/20' AND HIREDATE <= '81/05/01';

#--> TC
select ENAME,JOB,HIREDATE
from project.EMP
where HIREDATE BETWEEN '1981/02/20' AND '1981/05/01';

# 범위 사용시 between A AND B !

#문제7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.alter

select ENAME,DEPTNO
from project.EMP
where DEPTNO = 20 or 30 order by ENAME DESC;

#--> TC
select ENAME,DEPTNO
from project.EMP
where DEPTNO = 20 or DEPTNO = 30 order by ENAME DESC;

#문제8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력 이름순(오름차순)으로 출력하시오.

select ENAME,SAL,DEPTNO
from project.EMP
where (SAL >= 2000 AND SAL <=3000) AND (DEPTNO = 20 or 30)
order by ENAME;

#--> TC
select ENAME,SAL,DEPTNO
from project.EMP
where  SAL BETWEEN 2000 AND 3000 and (DEPTNO=20 or DEPTNO=30);

#문제9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오.(like 연산자와 와일드카드 사용)

select ENAME,HIREDATE
from project.EMP
where HIREDATE LIKE '1981-__-__';

#--> TC
select ENAME,HIREDATE
from project.EMP
where HIREDATE LIKE '1981%';

#문제10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.alter

select ENAME,JOB
from project.EMP
where NOT (job='MANAGER');

#--> TC
select ENAME,JOB
from project.EMP
where MGR is NULL;

#문제11. 커미션을 받을 수 있는 자격이 되는 사원의 이름,급여,커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.alter

select ENAME, SAL, COMM 
from project.EMP
where COMM IS NOT NULL
order by SAL, COMM DESC;

#--> TC
select *
from project.EMP
where COMM IS NOT NULL order by SAL DESC, COMM DESC; 


#문제12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.

select ENAME
from project.EMP
where ENAME LIKE '__R%';

#--> TC
select ENAME
from project.EMP
where ENAME LIKE '__R%';

#문제13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.

select ENAME
from project.EMP
where ENAME LIKE '%AE%';   

#--> TC
select *
from project.EMP
where ENAME LIKE '%A%' and ENAME LIKE '%E%';

# LIKE(와일드카드) 사용시 각각 선언해주어야 문자를 모두 포함하는 글자를 검색할 수 있다.

#문제14. 담당업무가 CLERK, 또는 SALESMAN이면서 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.

select ENAME,JOB,SAL
from project.EMP
where (JOB='CLERK' or JOB='SALESMAN') AND (NOT SAL in (1600,950,1300));

#--> TC
select ENAME,JOB,SAL
from project.EMP
where (JOB = 'CLERK' or JOB = 'SALESMAN') AND (SAL not in (1600, 950, 1300));

#문제15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오

select ENAME,SAL,COMM
from project.EMP
where COMM >= 500 ;

#--> TC
select *
from project.EMP
where COMM >= 500;
 



 


