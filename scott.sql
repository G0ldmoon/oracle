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
from emp where comm is null and job in('CLERK','MANAGER') and mgr is not null and not ename like '_L%';

-- job = 'CLERK' or job = 'MANAGER'해도 됨

-- 함수 

-- 문자 함수 : upper, lower, substr, instr, rpad, lpad, replace, concat
-- 숫자 함수 :
-- 날짜 함수 :


--select "Welcome',upper(Welcome)
--from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp
where lower(ename) = 'soctt';

select ename,length(ename)     --실행하는 문자열의 길의
from emp;

--      1                       17
--     -17                      -1
select 'Welcome to Oracle',substr('Welcome to Oracle',2,3)      --2번째 위치부터 3번째 위치까지 출력
from dual;                                                     --하나만 지정할 경우 그 위치부터 끝까지 출력

select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3)      
from dual;  
select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)    --값은 항상 왼쪽에서 오른쪽으로   
from dual; 

select instr('Welcome to Oracle',' ')    -- instr 문자열의 위치값 출력
from dual;

select instr('Welcome to Oracle','o',6)    -- , 두번쨰 입력값은 시작위치
from dual;

select instr('Welcome to Oracle','e',3,2)    -- , 세번째 값은 입력값째 위치의 위치값을 출력
from dual;

select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')    -- replace (출력문,변경할 위치값,변경할 값)
from dual;

select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'#')   -- lpad 왼쪽(문자열,칸 기준,채울문자열) rpad 오른쪽 *빈공간확보
from dual;

select rpad('990113-',14,'*')   --주민번호 뒤에 안보이게 할 경우 활용 예시
from dual;

select concat(empno,ename), empno || '' || ename  -- concat 두문자열을 합치는 함수   '' 호따옴표
from emp;

-- ================================숫자==========================================

select round(1234.5678),               --round 소수점에서 반올림
       round(1234.5678,0),             --소수점 0번째 자리까지 표현  소수점 1번째에서 반올림
       round(1234.5678,1),             -- 소수점 1번째 자리까지 표현 소수점 2번째에서 반올림
       round(1234.5678,2),
       round(1234.5678,-1)             -- 소수점 기준 왼쪽으로 정수를 반올림 ->1230
from dual;

select trunc(1234.5678),               -- 특정 위치를 버리는 함수
       trunc(1234.5678,0),            
       trunc(1234.5678,1),             -- 소수점 1번쨰 이후로 버림
       trunc(1234.5678,2),             -- 소수점 2번째 이후로 버림
       trunc(1234.5678,-1)             
from dual;

select
      ceil(3.14),             -- 자신보다 큰 가장 가까운 정수
      floor(3.14),            -- 자신보다 작은 가장 가까운 정수
      ceil(-3.14),            -- -3 
      floor(-3.14)            -- -4
from dual;

select mod(5,2),mod(10,4)    -- 나머지 구하는 함수 첫번째 입력값에 두번쨰 입력값을 나눈 나머지
from dual;

select *
from emp
where mod(empno,2) = 1;      --홀수만 출력하는 함수

select empno
from emp;

-- 함수 

-- 문자 함수 : upper, lower, substr, instr, rpad, lpad, replace, concat
-- 숫자 함수 :
-- 날짜 함수 :


--select "Welcome',upper(Welcome)
--from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp
where lower(ename) = 'soctt';

select ename,length(ename)     --실행하는 문자열의 길의
from emp;

--      1                       17
--     -17                      -1
select 'Welcome to Oracle',substr('Welcome to Oracle',2,3)      --2번째 위치부터 3번째 위치까지 출력
from dual;                                                     --하나만 지정할 경우 그 위치부터 끝까지 출력

select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3)      
from dual;  
select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)    --값은 항상 왼쪽에서 오른쪽으로   
from dual; 

select instr('Welcome to Oracle',' ')    -- instr 문자열의 위치값 출력
from dual;

select instr('Welcome to Oracle','o',6)    -- , 두번쨰 입력값은 시작위치
from dual;

select instr('Welcome to Oracle','e',3,2)    -- , 세번째 값은 입력값째 위치의 위치값을 출력
from dual;

select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')    -- replace (출력문,변경할 위치값,변경할 값)
from dual;

select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'#')   -- lpad 왼쪽(문자열,칸 기준,채울문자열) rpad 오른쪽 *빈공간확보
from dual;

select rpad('990113-',14,'*')   --주민번호 뒤에 안보이게 할 경우 활용 예시
from dual;

select concat(empno,ename), empno || '' || ename  -- concat 두문자열을 합치는 함수   '' 호따옴표
from emp;

-- ================================숫자==========================================

select round(1234.5678),               --round 소수점에서 반올림
       round(1234.5678,0),             --소수점 0번째 자리까지 표현  소수점 1번째에서 반올림
       round(1234.5678,1),             -- 소수점 1번째 자리까지 표현 소수점 2번째에서 반올림
       round(1234.5678,2),
       round(1234.5678,-1)             -- 소수점 기준 왼쪽으로 정수를 반올림 ->1230
from dual;

select trunc(1234.5678),               -- 특정 위치를 버리는 함수
       trunc(1234.5678,0),            
       trunc(1234.5678,1),             -- 소수점 1번쨰 이후로 버림
       trunc(1234.5678,2),             -- 소수점 2번째 이후로 버림
       trunc(1234.5678,-1)             
from dual;

select
      ceil(3.14),             -- 자신보다 큰 가장 가까운 정수
      floor(3.14),            -- 자신보다 작은 가장 가까운 정수
      ceil(-3.14),            -- -3 
      floor(-3.14)            -- -4
from dual;

select mod(5,2),mod(10,4)    -- 나머지 구하는 함수 첫번째 입력값에 두번쨰 입력값을 나눈 나머지
from dual;

select *
from emp
where mod(empno,2) = 1;      --홀수만 출력하는 함수

select empno
from emp;

---------------------------------날짜함수----------------------------------------

select sysdate -1 어제, sysdate, sysdate +1
from dual;

select sysdate - hiredate as 근무일수  --오늘날짜 - 입사날짜 = 근무일수
from emp;



select trunc((sysdate - hiredate) / 365)           --근속년수
from emp;

select sysdate,
round(sysdate, 'cc') as format_CC,
round(sysdate, 'yyyy') as format_YYYY,
round(sysdate, 'Q') as format_q,
round(sysdate, 'DDD') as foramt_ddd,
round(sysdate, 'HH') as format_hh
from dual;

--------------------------------자료형 변환--------------------------------------

-- to_char() , to_number() , to_date()


--날짜를 문자로 자료형 변환 to_char()
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS:day') as 입사일자
from emp;



--숫자를 문자로 자료형 변환 to_char()
select to_char(123456,'L999,999')    --L 붙이면 국가별에 맞추어 화폐 표기
from dual;

select to_char(sal,'L999,999')
from emp;

select to_char(sal,'L000,000')
from emp;


--문자를 숫자로 자료형변환 to_number()   모든 문자는 숫자로 표기되어있어야 가능
select '20000' - 10000      --자동형변환 (암시적형변환)
from dual;

select '20,000' - '5,000'  --to_number() 형변환을 해야함
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--문자를 날짜로 자료형변환   --문자가 날짜형식의 데이터여야 변환가능
select to_date('20221019','YYYY,MM,DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');


-----------------------------null 데이터 처리-----------------------------------
--nvl(null,바꾸고싶은데이터)
--nvl은 null데이터의 타입과 같은 타입으로 변경해주어야 한다.
--nvl(숫자,숫자) , nvl(문자,문자)

select enmae 사원명,sal,sal *12 +_nvl(comm,0) as 연봉,comm
from emp;

select *
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr    --mgr은 number타입이라 오류 to_Char를 통해 문자형으로 변경 
from emp
where mgr is null;

select comm, nvl2(comm,'O','X')   --null일때 null이 아닐때 모두 구분해서 표현
from emp;

---------------------------조건문 표현하는 함수-----------------------------------
-- decode() -> switch
-- case  -> if

select ename,job,deptno,
    decode(deptno,10,'AAA',20,'BBB','기타') as 부서명
from emp;

--범위를 조건의로 설정 할 수 있다.
--case
--    when [조건1]   then [조건1의 결과값이 true 일때 반환할 결과]
--    when [조건2]   then [조건2의 결과값이 true 일 때 반환할 결과]
--    else [위 조건 과 일치하는 경우가 없을 때 반환할 결과]
--   and as 별칭

select ename,job,deptno,
       case 
       when deptno = 10 then 'AAA'
       when deptno = 20 then 'BBB'
       when deptno = 30 then 'CCC'
       else '기타'
       end as 부서명
from emp;

select ename,job,sal,
       case 
       when sal between 3000 and 5000 then '임원'
       when sal >= 2000 and sal < 3000 then '관리자'
       when sal >= 500 and sal < 2000 then '사원'
       else '기타'
       end as 직무
from emp;

select empno,rpad (substr(empno,1,2),length(empno),'*'),ename, rpad (substr(ename,1,1),length(ename),'*') 
from emp
where length(ename) >= '5'and length(ename) < 6;

select empno,ename,sal,trunc ((sal / 21.5),2) as DAY_PAY , round((sal / 21.5 / 8),1) as TIME_PAY
from emp;

select empno,ename,mgr,
       case
       when mgr is null then '0000'
       when substr(mgr,1,2) = '75' then '5555'
       when substr(mgr,1,2) = '76' then '6666'
       when substr(mgr,1,2) = '77' then '7777'
       when substr(mgr,1,2) = '78' then '8888'
       else to_char(mgr)                      --문자타입으로 캐스팅
       end as CHG_MGR
       from emp;
       

       
       ----------------------------단일 함수-------------------------------------
       -- sum(),avg(),count(),max(),min()
       -- 일반컬럼과 같이 사용 불가
       -- 크기비교가 가능 모든 타입에 사용 가능
       
                     select sum(sal)                      --숫자 데이터를 합한다.
       from emp;
       
       select avg(sal)                      --숫자 데이터의 평균을 구한다.
       from emp;
       
       select count(*)                      --테이블 전체 레코드 개수
       from emp;
       
       select max(sal),min(sal)             --최고값,최저값 
       from emp;
       
        select count(*),count(comm)           
       from emp;
       
       select ename,max(sal)               --컬럼의 개수가 동일하지않으면 오류  
       from emp;
       
       select min(hiredate), max(hiredate)           --입사한순서
       from emp
       where deptno = 20;
       
       
              
       
       -- select 컬럼명
       -- from 테이블명
       -- where 조건식
       -- group by 기준컬럼명
       -- order by 컬럼명 정렬방식  ==> 맨 마지막에 작성
       
       select avg(sal) from emp where deptno = 10
       UNION
       select avg(sal) from emp where deptno = 20
       UNION
       select avg(sal) from emp where deptno = 30;
       
       
       
       
       
       -----------------------------group by -----------------------------------
       
       select deptno,avg(sal)          --위에 합집합 UNION 과 동일한 값
       from emp
       group by deptno;         -- 조회되는 개수가 동일할 경우 일반 컬럼명과 동일해도 사용가능
       
       select deptno
       from emp
       group by deptno;
       
       select deptno, avg(sal)
       from emp
       group by deptno;
       
       select deptno, avg(sal)
       from emp
       group by deptno
       order by deptno;
       
       select deptno,job,avg(sal)
       from emp
       group by deptno,job;
       
       select deptno,job,avg(sal)
       from emp
       group by deptno,job
       order by deptno,job desc;     -- deptno 오름차순 정렬 된 상태에서 job 기본 오름차순 abc....
       
       
       
       
       ------------------------group by having---------------------------------
       
       -- select 컬럼명
       -- from 테이블명
       -- where 조건식     (그룹함수 사용불가/group by, having 보다 먼저 실행)
       -- group by 기준컬럼명
       -- having 조건식 (그룹함수를 사용한다)
       -- order by 컬럼명 정렬방식  ==> 맨 마지막에 작성
       
       select deptno,avg(sal)
       from emp
       group by deptno
       having avg(sal) >= 2000;       --deptno 그룹에서 sal 이 2000 이상인 사람들의 avg 값 
                                      -- 조건식을 작성 할 때 그룹함수 사용
       
       select deptno, avg(sal)
       from emp
       where deptno != 10
       group by deptno
       having avg(sal) >= 2000; 
       
       
       --------------------------조인(join)--------------------------------------
       
       -- 2개 이상의 테이블에서 데이터를 조회
       -- from 절에 두개 이상의 테이블을 작성한다
       -- where에 조인 조건을 작성한다
       
       -- cross join (where절 없이 사용 가능)
       -- equi join (where 등가연산자 : =)
       -- non equi join (where 범위연산자 : and , or)
       -- self join (where 하나의 테이블을 사용한다)
       -- out join  (where에 누락되는 데이터를 같이 조회하기 위해 : (+))
       
       select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc              -- emp테이블 -ename,job dept 테이블 안에 정보 dname,loc
       from emp,dept
       where emp.deptno = dept.deptno;
       
       
     select ename,job,e.deptno,dname,loc
     from emp e,dept d                     --테이블에 별칭 주는방법 한칸 띄고 
     where e.deptno = d.deptno;
     
     select *
     from emp;
     
     select *
     from salgrade;
     
     select ename, sal, grade
     from emp e,salgrade s
     where e.sal between s.losal and s.hisal;
     --where e.sal >= s.losal and e.sal <= s.hisal   
     
     --사번, 이름, 급여, 부서번호, 부서명, 급여등급
     -- emp                  dept             salgrade
     
     select empno, ename, sal, d.deptno, dname, grade
     from emp e, dept d, salgrade s
     where e.deptno = d.deptno
     and e.sal between s.losal and s.hisal;
     
     
     
     -------------------------------self join-----------------------------------
       
       
    select e.empno,e.ename,e.mgr,m.ename               --mgr 선임의 사원번호가 아닌 이름도 같이나오게 하고싶다.
    from emp e, emp m              --반드시 별칭 부여
    where e.mgr = m.empno;
      
   
    select ename,deptno                         --scott 이랑 같은부서에 근무하고싶은 사람들의 이름을 조회  ename  ename  
    from emp                                                                                      --scott  smith
    where deptno = 20;                                                                            --scott  jones ..... ford 까지
    
    
    select work.ename, friend.ename
    from emp work, emp friend    
    where work.deptno = friend.deptno    --같은 부서 
    and work.ename = 'SCOTT' 
    and friend.ename != 'SCOTT';          
    
    
    
        
    -- 외부조인(out join)
    -- 등가시 누락되는 데이터를 같이 조회 하기 위해서 사용
    
    select e.empno,e.ename,e.mgr,m.ename               -- 선임이 없는 null 사원이 나오지 않는 문제점
    from emp e, emp m                        --반드시 별칭 부여
    where e.mgr = m.empno(+);                          --데이터가 없는 테이블 쪽에 (+)를 붙인다.
    
    
    select ename,sal,d.deptno,dname
    from emp e, dept d
    where e.deptno(+) = d.deptno;
    
    
    
    
    
    ------------------------ ANSI JOIN (표준 조인 방식)-------------------------
    
    -- cross join
    -- natural join
    -- inner join(equi, non equi)
    -- outer join ( (+) )   [left, right, full] outer join
    
    select ename,sal,dname,loc
    from emp e inner join dept d
    on e.deptno = d.deptno;              --an si join 에서는 on
    
    select ename,sal,dname,loc
    from emp e inner join dept d
    using(deptno);                       --양쪽 테이블의 컬럼명이 동일한 경우만
    
    select ename,sal,dname,loc
    from emp e inner join dept d
    using(deptno)
    where ename = 'SCOTT';
    
    select e.empno,e.ename,e.mgr,m.ename  --상사의 사번과 이름도 같이나오게 
    from emp e inner join emp m
    on e.mgr = m.empno;
    
    select empno,ename,sal,grade
    from emp e inner join salgrade s
    on e.sal between s.losal and s.hisal;
    
    select e.empno,e.ename,e.mgr,m.ename  --상사의 사번과 이름도 같이나오게 
    from emp e left outer join emp m    -- 데이터가 있는 쪽을 저장한다
    on e.mgr = m.empno;
    
    
    select empno, ename, sal, d.deptno, dname, grade
    from emp e inner join dept d 
    on e.deptno = d.deptno
    inner join salgrade s
    on e.sal between s.losal and s.hisal;
    
     select ename,sal,d.deptno,dname
    from emp e, dept d
    where e.deptno(+) = d.deptno;
    
    select ename,sal,d.deptno,dname
    from emp e right OUTER join dept d
    on e.deptno = d.deptno;
    
    
    select d.deptno,d.dname,e.empno,e.ename,e.sal
    from emp e inner join dept d
    on e.deptno = d.deptno   
    where e.sal > 2000;
    
    select *
    from emp;  
    
    select *
    from dept;
    
    select *
    from salgrade;
    
    select e.deptno,d.dname,trunc(avg(sal)),max(sal),min(sal),count(*)
    from emp e inner join dept d
    on e.deptno = d.deptno
    group by e.deptno,d.dname;            --2개의 컬럼을 그룹으로 묶어야만
    
    
    ------------------------8-3----------------------------------------
    select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal
    from emp e right outer join dept d
    on e.deptno = d.deptno
    order by d.deptno , e.ename;
    
    -----------------------------8-4--------------------------------------------
    
    select d.deptno,d.dname,e.empno,e.ename,e.mgr,e.sal,d.deptno,s.losal,s.hisal,s.grade,m.mgr,m.ename
    from  emp e right outer join dept d
    on e.deptno = d.deptno
    inner join salgrade s
    on e.sal between s.losal and s.hisal
    left outer join emp m
    on e.mgr = m.empno
    order by d.deptno , e.empno;
    
    
    
    ---------------------------서브 쿼리-----------------------------------------
    
    
    
    -- 서브쿼리 : select 문의 중첩  select(select) - 일반서브쿼리 from(select) 인라인뷰 where(select)서브쿼리
    --단일행 서브쿼리 : = , != , > ....
    --다중행 서브쿼리 : ANY.....
    
   
        
    select dname
    from dept
    where deptno = 20;
    
    
    select dname                                 --메인쿼리 
    from dept
    where deptno = (                            --서브 쿼리
                    select deptno
                    from emp
                    where ename = 'SCOTT');
                    
                    
    select ename, max(sal)
    from emp;
    
    select ename,sal
    from emp
    where sal = (                              --where 절은 group함수 불가
                 select max(sal)
                 from emp
                 );
                 
   --DALLAS                         
   --이름, 부서번호        
   
   select ename, deptno         --부서 번호를 몰라도 지역이름으로 근무자명 확인하는법
   from emp
   where deptno = (
                   select deptno
                   from dept
                   where loc = 'DALLAS'
                   );
                   
    -- 자신의 직속 상관(매니져)이 KING 인 사원의 이름과 급여를 조회
    
    select ename,sal
    from emp
    where mgr = ( select empno from emp where ename = 'KING'); 
    
    
    
    --------------------------다중행 서브쿼리------------------------------------
    
    -- in :결과 중에 하나만 만족하면 된다.
    -- > any : 결과중에 가장 작은 값 보다 크면 된다.
    -- > all : 결과중에 가장 큰 값보다 크면 된다.
   
    
    select *                                   --부서별 최대급여 받는 사원 정보 출력
    from emp
    where sal in( 
                 select max(sal) 
                 from emp
                 group by deptno
                 );
                 
                 
    select *                                   --부서별 최대급여 받는 사원 정보 출력
    from emp
    where sal >  any(                    --급여가 2800보다 큰사람
                 select max(sal)         --가장 작은값보다 크면
                 from emp
                 group by deptno
                 );
                 
    select ename,sal
    from emp
    where sal > all (              --all에서 조회한 값(30부서 2850)보다 크면 된다.
                     select sal
                     from emp
                     where deptno = 30 
                     );
                 
    select *
    from emp
    where (deptno,sal) in (   
                           select deptno,max(sal) 
                           from emp 
                           group by deptno
                           ); 

    
    ---------------------------------DML----------------------------------------
    
    -- DML(데이터조작어) : insert, update, delete
    -- insert : 테이블에 데이터 삽입
    -- insert into 테이블명 (컬럼명1,컬럼명2.....)
    -- values (값1,값2.....)
    -- 컬럼과 값의 타입과 갯수가 일치해야 한다.
    -- 작성 순서대로 1 : 1 매칭된다.


 create table dept_temp
    as 
    select * from dept;
    
    select *
    from dept_temp;
    
    insert into dept_temp (deptno,dname,loc)
    values (50,'DATABASE','SEOUL');
    
    insert into dept_temp           --컬럼 생략 가능 (모든컬럼 삽입 할 경우)
    values (70,'HTML','SEOUL');
    
    insert into dept_temp           --컬럼 생략 가능 (모든컬럼 삽입 할 경우)
    values (80,NULL,'SEOUL');       
    
    insert into dept_temp (deptno,dname)
    values (60,'JSP');                   --비어있는 컬럼음 암묵적으로 null값이 들어간다.
    
    
    create table emp_temp
    as
    select * from emp
    where 1 != 1;                        -- 데이터는 없애고 컬럼구조만 가져올 때
    
    select *
    from emp_temp;
    
    insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    values (9999,'강문원','PRESIDENT',NULL,'2022/10/21',5000,1000,10);
    
    insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    values (3111,'심청이','MANAGER',9999,sysdate,4000,null,30);
    
    
    
    ----------------------------UPDATE(데이터수정)--------------------------------
    
    -- update : 컬럼의 데이터를 변경
    -- update 테이블명
    -- set    컬럼명 = 값, 컬럼명 = 값, ......
    -- where  조건식
    -- 조건절을 사용하지 않으면 해당 컬럼이 모두 변경된다.
    
    
    create table dept_temp2
    as
    select * from dept;
    
    select *
    from dept_temp2;
    
    update dept_temp2 
    set loc = 'SEOUL';            -- **where 절을 사용 안할 경우 컬럼의 모든 데이터가 해당 데이터로 변경 
    
    update dept_temp2
    set dname = 'DATABASE', loc = 'SEOUL'
    where deptno = 40;
    
    ----------------------------delete(데이터삭제)-------------------------------
    
    -- delete(데이터 삭제)
    -- delete from 테이블명
    -- where 조건식            ** where절을 사용하지 않으면 모든 데이터 삭제됨
    

     create table emp_temp2
     as
     select * from emp;
     
     select *
     from emp_temp2;
    
    delete from emp_temp2;            --테이블 전체 데이터 삭제
    
    delete from emp_temp2
    where ename = 'SCOTT';
    
    -------------------------TCL(데이터의 영구저장 또는 취소)----------------------
    
    -- 트랜젝션
    -- commit, rollback, savepoint
    -- commit : 데이터 영구 저장(테이블이 데이터 반영)
    --          create 구문을 사용해서 객체 생성할 때(자동)
    -- rollback : 데이터 변경 취소(테이블이 데이터 미반영)
    --            천재지변,전기,전쟁(자동)
    
    drop table dept01;
    
    create table dept01
    as
    select * from dept;
    
    select *
    from dept01;
    
    -- 트랙젝션 적용 유무 
    delete from dept01;              -- 외부 접속 시에는 삭제 안된 상태 
    
    truncate table dept01;           -- delete와 동일한 기능이나 롤백이 안됨 테이블 데이터 영구삭제
    
    commit;                          -- 테이블 완전한 반영 (복구 안됨)
    rollback;                        -- commit 하기 전까지 원상복구
    
    
    
    --------------------------데이터 정의어(DDL)----------------------------------
    
    -- DDL(데이터 정의어) : table(모든객체)을 생성,삭제,변경하는 명령어
    -- create(생성) , drop(삭제) , alter(변경)
    
   -- create table  테이블명 (  -- table(객체)
   --          컬럼명1 타입,    -- column(속성)
   --          컬럼명2 타입,
   --          컬럼명3 타입
   --          );
   
   create table emp_ddl(
     empno number(4),                          --사번,이름,직책,관리자,입사일자,급여,성과급,부서번호 
     ename varchar2(10),      --byte
     job varchar2(9),
     mgr number(4),
     hiredate date,
     sal number(7,2),                         --, 뒤에는 소수점 몇개줄거냐는 의미
     comm number(7,2),
     deptno number(2)
     ); 
     
     select *
     from emp_ddl;
     
     insert into emp_ddl
     values(7777,'강문원','CEO',null,sysdate,1200,1200,10);
     
     
     create table dept_ddl     --테이블의 복사
     as
     select * from dept;
     
     create table dept_30
     as
     select * from dept
     where deptno = 30;
     
     select *
     from dept_30;
     
     create table dept_m
     as
     select dname,loc
     from dept;
     
     create table dept_d
     as
     select * from dept
     where 1 != 1;                     --테이블 구조만(데이터x) 가져오는 경우
 
     -- 테이블 변경(컬럼의 정보 수정)
     -- 새로운 컬럼을 추가(add), 컬럼의 이름을 변경(rename), 자료형의 변경(modify), 컬럼을 삭제(drop)
     -- alter
     
     create table emp_alter
     as
     select * from emp;
     
     select *
     from emp_alter;
     
     alter table emp_alter
     add address varchar2(100);
     
     alter table emp_alter                --adress 컬럼명을 addr로 변경
     rename column address to addr;
     
     alter table emp_alter                   
     modify empno number(10);
     
     alter table emp_alter                --addr 삭제
     drop column addr;
     
     -- 테이블 삭제 DROP 
     
     drop table emp_alter;
     
      create table EMP_HW(
      EMPNO number(4),
      ENAME varchar2(10),
      JOB varchar2(10),
      MGR number(2),
      HIREDATE date,
      SAL number(7,2),
      COMM number(7,2),
      DEPTNO number(2)
      );
      
      select * 
      from emp_hw;
      
      drop table emp_hw;
     
     alter table EMP_HW
     add BINGO varchar2(20);
     
     alter table emp_hw
     modify bingo varchar2(30);
     
     alter table emp_hw
     rename column bingo to REMARK;  
     
      alter table emp_hw
     modify job varchar2(30);
     
     alter table emp_hw
     modify mgr number(4);
     
    insert into emp_hw
    select empno,ename,job,mgr,hiredate,sal,comm,deptno,null
    from emp;
    
     
    
    
    -------------------------데이터 사전------------------------------
    
    desc user_tables;
    
    select table_name
    from user_tables;
    
    select owner, table_name               --주인이 누구인지 
    from all_tables; 
     
     
    -- index(검색속도를 향상하기위해 사용 객체)
    
    -- select 구문이의 검색속도를 향상 시킨다
    -- 전체 레코드의 3~5% 정도일때
    -- index 객체를 컬럼에 생성해서 사용한다
    
    -- create index 인덱스명    삭제는 drop
    -- on 테이블명(컬럼명);
    
         
   create table emp01
   as
   select * from emp;
   
   
    drop table emp01;
    
    select *
    from emp01;
    
      insert into emp01
    select * from emp01;
    
    insert into emp01(empno,ename)
    values (1111,'bts');
    
    
    -- index 생성 전 0.035 정도
    select empno,ename
    from emp01
    where ename = 'bts';
    
    create index idx_emp01_ename
    on emp01(ename);
    
     -- index 생성 후 0.001 정도
    select empno,ename
    from emp01
    where ename = 'bts';
    
    drop index idx_emp01_ename;                 --index 삭제
    
    -- 테이블 삭제 후 원복
    -- show recyclebin;  삭제 된 테이블 확인
    
    --  flashback table 테이블명    삭제 된 테이블 원복하는 구문
    --  to before drop;
    
    -- purge recyclebin; 휴지통 비우기
    
    
    show recyclebin;
    
    flashback table emp_hw
    to before drop;
    
    purge recyclebin;
    
    -- 제약조건(무결성) : 잘못된 값이 데이터로 사용되는것을 못하게 하는것
    -- not null 
    -- unique
    -- primary key (기본키)
    -- foreign key
    -- check 
    
 
   
    
    create table emp04(
    empno number(4) constraint emp04_empno_pk primary key,  -- 기본키 : not null + uniqei
    ename varchar(10) constraint emp04_ename_nn not null,
    job varchar(9),
    deptno number(2)
    );
    
    drop table emp04;
    
     select * from emp04;
    
    
    insert into emp04
    values (1111,'홍길동','MANAGER`',30);
    
    insert into emp04
    values (2222,'홍길동','MANAGER',30);
    
    insert into emp04
    values (null,'김유신','SALEMAN',20);
    
    insert into emp04
    values (null,'김유신','SALEMAN',20);
    --NULL을 ("SCOTT"."EMP04"."EMPNO") 안에 삽입할 수 없습니다
    
    insert into emp04
    values (2222,'옥동자','SALEMAN',10);
    --제약 조건(SCOTT.EMP04_EMPNO_PK)에 위배됩니다
    
    