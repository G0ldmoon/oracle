--■ DQL(질의어) 데이터 조회

--select 컬럼명
--from 테이블명

desc emp;

--전체데이터
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

--부분컬럼 데이터
select empno,ename,sal
from emp;

select deptno
from emp;

--DISTINCT 중복 제어
select DISTINCT(deptno)
from emp;

select job
from emp;

select DISTINCT(job)
from emp;

-- + , - , * , /    나머지는 연산자는 없음
-- 컬럼을 대상으로 연산한다.
-- null 값은 연산 불가  nvl()키워드로 null값을 0으로 변경 후 연산 뒤에 as 붙이고 별칭 사용가능
-- 컬럼에 별칭을 사용할 수 있다.
select ename as 사원명,sal,sal * 12 + nvl(comm,0) as 연봉,comm
from emp;


-- < 정렬 >
--select 컬럼명
--from 테이블명
--order by 컬럼명(정렬기준이 되는 값) asc(오름차순/desc(내림차순) 

select *
from emp
order by sal; --desc;  --오름차순은 생략 가능 
-- 숫자(1 ~ 10), 날짜(과거날짜 ~ 최근날짜), 문자(사전 순서)


--< 조건 검색 >
--select 컬럼명
--from 테이블명
--where 조건식; <, >, =, != 혹은 <>, <=, >=, and(두가지 이상의 조건이 모두 참인 경우), or

select *
from emp
where sal >= 3000;  --급여가 3000이상인 사람만 조회

select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;  --30번 부서에 근무하는 사원 + SALESMAN + 사원번호 7199인 사람   **호따음표 대소문자도 구분해서 조회함

select *
from emp
where ename = 'FORD';

--날짜를 조건절에 사용할 때 
-- ' '
--날짜도 크기가 있다.
-- 입력 80/12/20 -> 출력 1980 12 20 시간 분 초 요일정보까찌

select * 
from emp
where hiredate < '1982/01/01';

-- or 두개 이상의 조건중에 하나이상 참인 경우
select *
from emp
where deptno = 10 or sal >= 2000;

-- not 논리 부정 연산자

select *
from emp
where sal != 3000;

select *
from emp
where not sal = 3000;

select*
from emp
where sal >= 1000 and sal <= 3000;

select*
from emp
where sal <= 1000 or sal >= 3000;

--between and
select *
from emp
where sal between 1000 and 3000;  -- 위위 조건문과 동일

select *
from emp
where sal = 800 or sal =3000 or sal =5000;

select *
from emp
where sal in(800,3000,5000);       --위 조건문과 동일


--like 연산자
-- 값의 일부만 가지고 데이터를 조회한다.
-- 와이드 카드를 사용한다 ( % , _) 
-- % 모든 문자를 대체한다. _ 한 문자를 대체한다.

select *
from emp
where ename like 'F%';

select *
from emp
where ename like '%D';  --이름이 D로 끝나는사람

select *
from emp
where ename like '%O%';  -- 이름중에 O가 포함된 사람

select *
from emp
where ename like '___D';  -- _언더바 3개이후에 4번쨰 글자에 D가 들어간 사람

select *
from emp
where ename like 'S___%';  -- S로시작하고 3글자 이상인 이름을 가진 사람

-- null 연산자
-- is null / is not null

select *
from emp
where comm is not null;  --null은 = 등의 연산이 불가하다.



-- 집합 연산자 (합집합, 교집합, 차집합)
--두개의 select 구문을 사용한다.
-- 컬럼의 갯수가 동일해야한다.
-- 컬럼의 타입이 동일해야 한다.
-- 컬럼의 이름은 상관없다.

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION              --합집합   * 위에 세미콜런 없애야함  중복되어질 경우 1번만 조회한다.
select empno,ename,sal,deptno
from emp
where deptno = 20;



select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL          --합집합   * 위에 세미콜런 없애야함 ALL 쓰면 중복되어도 전부 나오게한다.
select empno,ename,sal,deptno
from emp
where deptno = 10;

-------------------------------------차집합--------------------------------------

select empno,ename,sal,deptno
from emp
MINUS           --차집합  입력값 제외한 나머지값
select empno,ename,sal,deptno
from emp
where deptno = 10;


------------------------------------교집합---------------------------------------

select empno,ename,sal,deptno
from emp
INTERSECT          --교집합  
select empno,ename,sal,deptno
from emp
where deptno = 10;

-- where 
-- 비교연산자, 논리연산자, like, is null / is not null , 집합연산자
-- <, >, =, >=, <=, != 
-- and, or, not, between and, in
-- like ( % , _ )
-- is null, is not null
-- UNION, UNOON ALL, MINUS, INTERSECT


select *
from emp
where ename like '%S';

select empno,ename,job,sal,deptno
from emp
where deptno = 30 and job = 'SALESMAN';


select empno,ename,job,sal,deptno
from emp
where deptno between 20 and 30 and sal >2000;      -- deptno in (20,30) and sal > 2000; 으로 써도 됨

select empno,ename,job,sal,deptno
from emp
where deptno = 20 and sal > 2000
UNION 
select empno,ename,job,sal,deptno
from emp
where deptno = 30 and sal > 2000;

select *
from emp
where not sal > 2000 or sal >3000;
--UNION 
--select *
--from emp
--where not sal <= 3000;

select ename,empno,sal,deptno
from emp
where ename like '%E%' and deptno = 30 and sal not between 1000 and 2000;
--UNION
--select ename,empno,sal,deptno
--from emp
--where ename like '%E%' and deptno = 30 and not sal < 2000;

select *
from emp
where comm is null and 
job in('CLERK','MANAGER') and 
mgr is not null and 
not ename like '_L%';

-- job = 'CLERK' or job = 'MANAGER'해도 됨
