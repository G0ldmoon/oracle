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
    
    drop table dept_temp;
    
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
    
    drop table emp_temp;
    
    select *
    from emp_temp;
    
     select * from emp_temp
    where 1 != 1;
    
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
     modify empno number(10);            --타입이나 크기를 변경
     
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
    -- unique     (유일 ,중복x)
    -- primary key (기본키) = not null + unique
    -- foreign key (외래키/참조키)
    --    1. 부모와 자식의 관계를 가지는 자식 쪽 테이블의 컬럼에 설정한다.
    --    2. 부모 쪽 테이블의 컬럼은 반드시 primary key 또는 unique 해야 한다.
    --    3. null 데이터를 허용
    -- check 
    -- default
    
 -- index 객체 생성후 (0.001 ~0.002)
 
    select empno,enmae
    from emp03
    where ename = 'bts';
    
    insert into emp
    values (1111,'aaa','MANGE',9999,sysdate,1000,
    
    
    create table emp04(
    empno number(4) constraint emp04_empno_pk primary key,  -- 기본키 : not null + uniqei
    ename varchar(10) constraint emp04_ename_nn not null,
    job varchar(9),
    deptno number(2)
    );
    
    create table book (
     b_id varchar2(10) primary key,
     b_name varchar2(2) not null
     );
     
     insert into book
     values ('kin','k');
     
     select b_id,b_name
     from book;
     
     select * 
     from book
     where 1 != 1;
     
    select b_name,r_date
    from book b inner join rental r
    on b.b_id = r.b_id;
    
     create table rental(
     b_id varchar2(10),
     r_date date
     );
     
    insert into rental
     values ('kin',sysdate);
     
     select * from rental;
     
    
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
    
    
    -------------------------외래키 참조키--------------------------------------
    
    create table dept07 (
    deptno number(2) constraint dept07_deptno_pk primary key,  --부모 쪽 기본키가 있어야 참조가능
    dname varchar2(20) constraint dept07_dname_nn not null,
    loc varchar2(20) constraint dept07_loc_nn not null
    );
    
    drop table dept07;
    
    create table emp07 (
    empno number(4) constraint emp07_empno_pk primary key,
    ename varchar2(9)constraint emp07_empno_nn not null,
    job varchar2(9),
    deptno number(2) constraint emp07_deptno_fk references dept07(deptno)
    );

    
    
    -- 서브 쿼리문을 사용한 데이터 삽입 
    
    insert into dept07
    select * from dept;    --부모 테이블 먼저 
    
    insert into emp07 
    select empno,ename,job,deptno from emp;   --emp07 테이블에 emp 테이블 자료를 넣어라
    
    insert into emp07
    values(null,'aaa','MANAGE',20);
    
    select *
    from emp07;
    
    
    delete from emp07
    where ename = 'aaa';
    
            
    create table emp08 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    sal number(7) constraint emp08_sal_ck check(sal between 500 and 5000),   --cheak 이후 (제약조건 범위)
    gender varchar2(2)constraint emp08_gaender_ck check(gender in ('M','F'))   --in 구문 활용 성별 제한
    );

   drop table emp08;
   
   select * from emp08;
   
   insert into emp08 
   values (1111,'kang',1000,'M');
   
   insert into emp08 
   values (2222,'jung',800,'F');
   
   delete from emp08
   where empno = '2222';
   
   
   
   -------------------------------default---------------------------------------
 
   create table dept08 (
      deptno number(2) primary key,
      dname varchar2(10) not null,
      loc varchar2(15) default 'SEOUL'     --기본값이 SEOUL이 들어오도록
   );
   
   insert into dept08(deptno,dname)
   values (10,'SALES');                     --loc 지정안해도 기본 SEOUL로 입력되어짐
   
   insert into dept08(deptno,dname,loc)     --지정 할 경우 입력 데이터가 출력
   values (20,'SALES','BUSAN');
   
   select *                            
   from dept08;
   
   delete from dept08
   where loc = 'BUSAN';
   
   
   -- 제약 조건 설정 방식
   -- 컬럼 레벨의 설정  (not null은 컬럼 레벨에서만 가능)
   -- 테이블 레벨의 설정 (not null을 적용할 수 없다)
   
   create table emp09 (
   empno number(4),
   ename varchar2(20) constraint emp09_ename_nn not null,
   job varchar2(20),
   deptno number(20), 
   
   constraint emp09_empno_pk primary key(empno),
   constraint emp09_job_uk unique(job),
   constraint emo09_deptno_fk foreign key(deptno) references dept(deptno)
   );
   
   select *
   from emp09;
   
   insert into emp09 
   values (1111,'Kang','CEO',30);
   
   insert into emp09 
   values (2222,'Kang','MANAGER',50);
   
   
   
   
   -----------------복합키(기본키를 두개의 컬럼을 사용하는 경우)---------------------
   
   -- 테이블 레벨 방식으로만 적용 가능
   -- 1. 테이블 안에서 정의하는 방식
   -- 2. Alter 명령어 사용방식
   
   create table member(
     name varchar2(10),
     address varchar2(30),
     hphone varchar2(10),
     
     constraint member_name_address_pk primary key(name,address)
     );
     
   create table emp10( 
   empno number(4),
   ename varchar2(20),
   job varchar2(20),
   deptno number(20)
   );
   
   alter table emp10                 --제약조건 설정
   add constraint emp10_empno_pk primary key(empno);
   
   alter table emp10                 
   add constraint emp_10_empno_fk foreign key(deptno) references dept(deptno);
   
   alter table emp10
   drop constraint emp_10_empno_pk;
   
   
   create table dept11(
      deptno number(2), 
      dname varchar2(10),
      loc varchar2(15)     
   );
   
     alter table dept11
     add constraint dept11_deptno_pk primary key(deptno);
   
   
   create table emp11( 
     empno number(4),
     ename varchar2(20),
     job varchar2(20),
     deptno number(20)
   );
   
     alter table emp11
     add constraint emp11_empno_pk primary key(empno);
   
     alter table emp11                 
     add constraint emp_11_deptno_fk foreign key(deptno) references dept11(deptno);
   
   select *
   from emp11;
   select *
   from dept11;
   
   insert into dept11
   select * from dept;
   
   insert into emp11
   select empno,ename,job,deptno
   from emp;
   
   delete from dept11
   where deptno = 10;  --부모 데이터를 지우려고 할 경우 참조되어있는 데이터는 지울 수 없다. = 비활성화
   
   -----------------------------cascade
   
   alter table dept11
   disable primary key cascade;     --기본키의 자식테이블도 비활성화
   
delete from dept11
   where deptno = 10;               --비활성화 후 삭제 가능
   
   alter table dept11               --비활성화이고 제약조건은 그대로
   drop primary key;
   
   alter table dept11               --제약조건 완전 삭제
   drop primary key cascade;
     
     
   -- 테이블 레벨 방식에 의한 제약조건 설정
   
   create table dept_const (
   deptno number(2),
   dname varchar2(14),
   loc varchar2(13)
   );
   
    alter table dept_const
    add constraint deptconst_deptno_pk primary key(deptno);
    
    alter table dept_const
    add constraint deptconst_dname_unq unique(dname);
    
    alter table dept_const
    modify loc constraint deptconst_loc_nn not null;
    
    drop table dept_const;
    
    alter table dept_const
   disable primary key cascade;
    
    delete from dept_const
   where deptno = 10;
    
   alter table dept_const               --비활성화이고 제약조건은 그대로
   drop primary key;
   
    select * 
    from dept_const;
    
    insert into dept_const
    values (10,'Kang','CEO');
    
    delete from dept_const
    where dname = 'Kang';
    
    
    
    
    
    create table emp_const (
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
    );
    
    drop table emp_const;
    
    alter table emp_const 
    add constraint empconst_empno_pk primary key(empno);
    
    alter table emp_const
    modify ename constraint empconst_ename_nn not null;
    
    alter table emp_const
    add constraint empconst_tel_unq unique(tel);
    
    alter table emp_const
    add constraint empconst_sal_chk check(sal between 1000 and 9999);
    
    alter table emp_const
    add constraint empconst_deptno_fk foreign key(deptno) references dept_const(deptno);
    
    select * 
        from emp_const;
        
        alter table empconst
   disable primary key cascade;
   
   drop table emp_const;
        
   delete from emp_const
   where deptno;
    
   alter table emp_const               --비활성화이고 제약조건은 그대로
   drop primary key;
   
    insert into emp_const
    values(1111,'Kang','CEO','kkk',sysdate,5000,5000,10);
    
    insert into emp_const
    values(1112,'Kang','CEO','kk2k',sysdate,9999,5000,10);
    
    
    
    ------------------------------뷰--------------------------------------------
    
    --객체 : table, index, view
    -- create or replace view 뷰테이블명[(alias)]
    -- as
    -- 서브쿼리 ( select )
    -- [with check option]    []선택요소
    -- [with read only]
    
    create table dept_copy
    as
    select * from dept;
    
    create table emp_copy       --복사 테이블은 제약조건이 안넘어온다
    as
    select * from emp;
    
    create table book_copy
    as
    select * from book;
    
    select * from book_copy;
    
    alter table emp_copy
    add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);
    
    select *
    from emp_copy;  --14개 데이터
    
    create or replace view emp_view30                   
    as
    select empno,ename,sal,deptno 
    from emp_copy
    where deptno = 30;                          --30부서의 한정된 데이터만 조회하는 뷰 테이블
    
    select *
    from emp_view30;
    
    insert into emp_view30
    values (1111,'KANG',5000,30);
    
    insert into emp_view30 (empno,ename,sal)
    values (2222,'hong',2000);
    
    insert into emp_view30 (empno,ename,sal,deptno)  -- 원본 테이블에 deptno가 50이 없으므로 오류
    values (2222,'hong',2000,50);
    
    delete from emp_copy
    where ename = 'hong';
    
    delete from emp_view30
    where ename = 'KANG';
        
    select *
    from emp_copy;
    
    delete from emp_copy
    where ename = 'KANG';
    
    create or replace view emp_view(사원번호,사원명,급여,부서번호)
    as
    select empno,ename,sal,deptno
    from emp_copy;
    
    select *
    from emp_view;
    
    select *
    from emp_view
    --where 부서번호 = 20;
    where deptno = 20;     --별칭을 주면 원래 컬럼명은 조회 불가능
    
    create or replace view emp_dept_view
    as
    select empno,ename,sal,e.deptno,dname,loc  --겹치는 이름은 앞에 소속
    from emp e inner join dept d                --안시조인 2개 테이블 
    on e.deptno = d.deptno
    order by empno desc; 
    
    select *
    from emp_dept_view;
    
    -- 부서별 최소 급여와 최대급여
    -- dname min_sal max_sal 
    
    
    ------------------------------복합뷰-----------------------------------------
    
    create or replace view sal_view(dname,min_sal,max_sal)
    as
    select dname,min(sal),max(sal)                         --부서별 최소금여 최대급여
    from emp e inner join dept d
    on e.deptno = d.deptno
    group by d.dname;                                     --그룹바이절 확인
    
 
    select *
    from sal_view;
    
    select *
    from emp;
    
    select *
    from dept;
    
    
    select  *
    from salgrade;
    
    drop view sal_view;
    
    --모든 객체의 이름은 중복될 수 없다.
    
    creadte or replace view sal_view           --or replace 뷰는 덮어쓰기
    as
    select dname, min(sal) as min_sal, max(sal) as max_sal, avg(sal) as avg_sal
    from emp e inner join dept d
    on e.deptno = d.deptno
    group by d.dname;
    
    
    ------------------------------with check------------------------------------
    
    create or replace view view_chk30
    as
    select empno,ename,sal,comm,deptno
    from emp_copy
    where deptno = 30 with check option;   -- 조건절의 컬럼을 수정하지 못하게 한다.
    
    select *
    from view_chk30;
    
    update view_chk30
    set deptno = 10;                   --뷰 명과 데이터 정보와 불일치   할 경우 위 경우처럼 위드 체크 옵션으로 락을 걸어둔다. 
    
    
    create or replace view view_read30
    as
    select empno,ename,sal,comm,deptno
    from emp_copy
    where deptno = 30 with read only;   -- 모든 컬럼에 대한 C U D 가 불가능 (조회만 가능)
    
    update view_read30
    set deptno = 10;
    -- 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.  (insert,update,delete)
    
    
    -- 뷰의 활용
    -- TOP - N 조회하기 
    
    select * from emp;
    
    -------------------------입사일이 빠른 사원 5명을 조회--------------------------
    
    select *
    from emp
    order by hiredate asc;       -- 1. 오름차순 정렬
    
    select * from emp
    where hiredate <= '81/05/01';  -- 2. 정렬 확인 후 날짜 기준으로 조회
    
    DESC emp;
    
    select rownum,empno,ename,hiredate    -- rownum 테이블에 데이터가 조회되는 순서대로 num부여
    from emp
    where rownum <= 5;
    
     select rownum,empno,ename,hiredate 
     from emp
     where rownum <= 5
     order by hiredate asc;                    --정령이 마지막에 시행되기 떄문에 섞여버림
     
     
     select rownum,empno,ename,hiredate 
     from emp
     order by hiredate asc;
     
     create or replace view view_hiredate  -- emp테이블의 hiredate 오름차순으로 정렬된 뷰를 생성
     as
     select empno,ename,hiredate
     from emp
     order by hiredate asc;                 -- 사용 목적에 맞게 가상의 테이블 (뷰)
     
     select * from view_hiredate;
     
     select rownum,empno,ename,hiredate
     from view_hiredate
     where rownum <= 5;
     
     
     ----------------------rownum 을 2 ~ 5 까지만 출력을 원할 경우-----------------
     
     select rownum,empno,ename,hiredate
     from view_hiredate
     where rownum betweend 2 and 5;   --between이 적용되지 않음
     
     
        
     create or replace view view_hiredate_rm           -- hiredate를 오름차순으로 정렬해놓은 view_hiredate뷰를 참조하고 rownum에 별칭을 붙인 뷰를 생성
     as
     select rownum rm,empno,ename,hiredate
     from view_hiredate;
     
     
     select rm,empno,ename,hiredate
     from view_hiredate_rm;
     
       
     select rm,empno,ename,hiredate
     from view_hiredate_rm
     where rm >= 2 and rm <= 5;        --테이블 2개 사용하는거와 같음 인라인 뷰를 활용하면 1뷰로 가능하다.
     
     
     ---------------------------인라인 뷰----------------------------------------
     
     select rm,b.*
     from (
           select rownum rm,a.*
        from ( 
              select empno,ename,hiredate
              from emp
              order by hiredate asc 
             ) a
         ) b
  where rm >= 2 and rm <5;
  
  
  
  ---------------------입사일이 가장 빠른 5명을 조회하세요----------------------
  --인라인뷰
  
  select rownum,empno,ename,hiredate
  from (
        select empno,ename,hiredate
        from emp
        order by hiredate asc
        )
   where rownum <=5;
   
   
   -- 시퀀스 객체
   -- 자동으로 번호를 증가시키는 기능 수행
   -- create , drop
   -- nextval, currval
   
   -- create sequence 시퀀스명
   -- start with   시작값 => 1
   -- increment by 증가치 => 1
   -- maxvalue     최대값 => 10의 1027
   -- minvalue     최소값 => 10의 -1027
   
   create sequence book_seq
   start with 10
   increment by 10
   maxvalue 1000;
   
   select book_seq.nextval
   from book;
   
   create sequence dept_deptno_seq
   increment by 10
   start with 10;
   
   select dept_deptno_seq.nextval         --실행할때마다 인클리먼트(10)씩 증가     * back 안됨
   from dual;
   
   select dept_deptno_seq.currval         --증가된 값이 현재 얼마인지
   from dual;
   
   drop sequence dept_deptno_seq;
   
   create sequence emp_seq
   start with 1
   increment by 1
   maxvalue 1000;
   
   drop table emp01;
   
   create table emp01
   as 
   select empno,ename,hiredate from emp
   where 1 != 1;
   
   select *
   from emp01;
   
   insert into emp01
   values (emp_seq.nextval,'hong',sysdate);
   
   create table product1(
      pid varchar2(10),
      pname varchar2(10),
      price number(5),
      
      constraint product_pid_pk primary key(pid) 
      );
      
      create sequence idx_product_id
      start with 1000;
   
     insert into product1(pid,pname,price)
     values ('pid'||idx_product_id.nextval,'치즈',2000);  --특정 문자를 붙일 경우 해당 내용 참고
     
     select * from product1;
     
     drop sequence idx_product_id;
     
     
     ----------------------------사용자 관리-------------------------------------
     
     -- 사용자 관리 create, drop
     -- create user 계정명 identified by 패스워드
     -- alter user 계정명 inentified by 패스워드
     -- drop user 계정명 cascade
     
     create user user01 identified by 1234;
     
    -- DCL(제어어)
    -- grant(권한부여), revoke(권한회수)
    -- grant 시스템 권한 to 계정명
    -- revoke 시스템 권한 from 계정명
    
    create user user01 identified by 1234;       -- 생성 (관리자)
    
    alter user user01 identified by tiger;       -- 변경 (관리자)
    
    drop user user01 CASCADE;                    -- 삭제 (관리자)

     grant create table                          -- 권한부여 (관리자)
     to user01;
    
    revoke create table                          -- 권한회수 (관리자)
    from user01;
   
    alter user user01                            -- 데이터 용량 설정 (관리자)
    quota 2m on users;
    
    -- 시스템 권한 (create .....)
    -- 객체 권한 (select ....)
    
    --grant 객체권한 종류
    --on 객체명
    --to 계정명
    
    --롤
 create user user02 identified by 1234;
 
 grant CREATE SESSION to user02;
 
 grant connect,resource                       --connect 각각 8개정도의 권한 
 to user02;
 
 drop user user02;
 
 create user nbac identified by 1234;              --nbac는 관리자 유저생성
 grant DBA,connect,resource
 to nbac;
 
 drop user nbac;
 
 --system == nabc
 --nbac 
 
 -----------------------------nbac 객체-----------------------------------------
 
 create user user03 identified by 1234;             --nbac 계정에서는 권한부여도 가능
 
 
  -----------------------------nbac 객체-----------------------------------------
  
  
 -- 사용자 정의 롤
 -- 관리자 계정에서만 가능
 -- create role 롤명
 -- grant 권한 to 롤명
 
 --------------------------------system 계정-----------------------------------
 
  create role mrole;                              --롤 객체 생성
  grant create session,create table,create view   --롤에 권한 부여 (계정생성권한,테이블생성권한, 뷰 생성권한)
  to mrole;
  
   create user user04 identified by 1234;          --계정 생성
   
   grant mrole                                    --내가 만든 롤을 계정에 부여
   to user04;
   
   alter user user04                            --쿼터 권한부여 (용량부여)
   quota 2m on users;
   
   -- 관리자 권한에서 롤 생성
   create role mrole2;
   
   -- 객체권한은 해당 사용자 계정에서 가능
   -- scott 접속 mrole 롤에 권한부여
   -- grant select
   -- on emp
   -- user mrole2;
   
   -- 롤 권한은 관리자 계정에서만 가능
   grant mrole2
   to user04;
   
   
 
 --------------------------------system 계정-----------------------------------
 
 -----------------------------user 04 계정--------------------------------------
 
 create table test2 (
    name varchar2(10)
    );
    
  insert into test2
  values ('aaa');
  
  select * from test2;
  
   
 -----------------------------user 04 계정--------------------------------------
 
   --scott계정
   grant select
   on emp
   to mrole2;
   
   --user04
   select * from .emp;
  
  --system
   create role mrole3;
  
  --scott
  grant select
  on emp
  to mrole3;
  
  --system
  grant mrole3
  to user01;
  
  --user01
  select * from user_role_privs;          --권한 부여 확인
  
  set ROLE all;                           --비활성화 해제 문구
  select * from scott.emp;
  
  create user user05 identified by 1234;
  grant connect,resource
  
  --system   롤 권한 회수
  revoke role mrole3
  from user01;
  
  
  --system
  create user user05 identified by 1234;
  
  grant connect,resource
  to user05;
  
  --user05
  
  select * from user_role_privis;
  set ROLE all;
  select * from scott.emp;
  
  --system
  create role mrole3;
  
  --scott
  grant select
  on emp
  to mrole3;
  
  --system
  grant mrole3
  to user05;
  
  revoke mrole3
  from user05;
  
  
  --PL/SQL (확장되어진 SQL언어)
  -- 변수, 조건문, 반복문
  
  -- declare  (변수정의)  
  --  스칼라 방식
  --  vempno number(4);
  --  레퍼런스 방식
  --  vempno emp.empno%type;          -- 기존 테이블의 컬럼에 타입을 참조한다. 
  
  -- begin    (SQL구문 작성
  --           출력구문 작성)
  -- exception  (예외처리구문)
  -- end; /
  
  -- set serveroutpu on;     <- 먼저 실행해야함
  
  set serveroutpu on;
  
  begin
      dbms_output.put_line(' Hello World');  
  end;
  /
  
  
  
  declare                        -- 변수 정의하는 부분
      --vempno number(4);          -- 변수의 선언    (데이터 타입과 크기 설정)
      --vename varchar2(10);
      
      vempno number(4) := 7777;                --상수의 정의
      vename varchar2(10) not null := 'SCOTT'; -- null 갑을 변수의 값으로 사용할 수 없다.
  begin
      --vempno := 7777;                        -- 변수의 초기화 := 는 대입연산자 붙여서써야함
      --vename := 'SCOTT';                     -- 문자는 호따음표
      
      dbms_output.put_line(' 사원 / 이름' );           -- 자바에서 sysout과 동일
      dbms_output.put_line(vempno || ' ' || vename);  --연결하여 출력할 경우 || 활용
  end;
  /
  
  declare
  vempno emp.empno%type := 7777;   -- := 직접초기화 가능   레퍼런스 방식
  
   begin
       --vempno := 7777;
       dbms_output.put_line(vempno);
end;
/

declare
  vempno emp.empno%type;
  vename emp.ename%type;
  
begin
  select empno,ename 
  into vempno,vename                                  -- (필수) into 절을 사용해서 변수를 지정해야한다.
  from emp;
  where empno = 7788;                             -- 반드시 where절을 사용해야한다.
  
  dbms_output.put_line(' 사번 / 이름 ') ;
  dbms_output.put_line(vempno || ' ' || vename);
--exception                                               --예외처리
  --when TOO_MANY_ROWS then dbms_output.put_line('행의수가 여러개 입니다.');
  --when OTHERS then dbms_output.put_line('모든 예외에 대한 처리');
  --       
end;
/

select*
from emp;

declare
  -- 테이블 type(사용자 정의 변수 타입)
  -- 배열의 형식
  -- vename varchar(10) 
  TYPE empno_table_type IS TABLE OF emp.empno%type 
  INDEX BY BINARY_INTEGER;
  
   TYPE ename_table_type IS TABLE OF emp.ename%type 
  INDEX BY BINARY_INTEGER;
  
  TYPE job_table_type IS TABLE OF emp.job%type
  INDEX BY BINARY_INTEGER;
  
  TYPE mgr_table_type IS TABLE OF emp.mgr%type
  INDEX BY BINARY_INTEGER;
  
  TYPE hiredate_table_type IS TABLE OF emp.hiredate%type
  INDEX BY BINARY_INTEGER;
  
  TYPE sal_table_type IS TABLE OF emp.sal%type
  INDEX BY BINARY_INTEGER;
  
  TYPE comm_table_type IS TABLE OF emp.comm%type
  INDEX BY BINARY_INTEGER;
  
  TYPE deptno_table_type IS TABLE OF emp.deptno%type
  INDEX BY BINARY_INTEGER;
  
    empnoArr empno_table_type;
    enameArr ename_table_type; -- 배열 형식의 변수 선언
    jobArr job_table_type;     -- 배열 형식의 변수 선언
    mgrArr mgr_table_type;
    hiredateArr hiredate_table_type;
    salArr sal_table_type;
    commArr comm_table_type;
    deptnoArr deptno_table_type;
  
  i BINARY_INTEGER := 0;
  
begin
  for k in (select empno,ename,job,mgr,hiredate,sal,comm,deptno from emp) loop      -- 반복문
      i := i + 1;
      empnoArr(i) := k.empno;
      enameArr(i) := k.ename;                    --ename 14개를 배열
      jobArr(i) := k.job;
      mgrArr(i) := k.mgr;
      hiredateArr(i) := k.hiredate;
      salArr(i) := k.sal;
      commArr(i) := k.comm;
      deptno(i) := k.deptno;
      
  end loop;
  
  for j in 1..i loop
         dbms_output.put_line(empnoArr(j) ||'  /  '|| enameArr(j) ||'  /  '|| jobArr(j) ||'  /  '|| );
    
  end loop;
end;
/

-------------------------------레코드 타입---------------------------------------

declare 
    -- 테이블 type(사용자 정의 변수 타입)
    -- 배열의 형식
    -- vename varchar(10)
      -- 레코드 type(여러개의 변수를 묶어서 사용한다) => 사용자 정의 변수 타입
  -- 클래스랑 유사하다.
  
  TYPE emp_record_type IS RECORD (
      v_empno emp.empno%type,
      v_ename emp.ename%type,
      v_job emp.job%type,
      v_deptno emp.deptno%type
      );
    
    emp_record emp_record_type; -- 레코드 타입의 변수 선언;
    
begin
   select empno,ename,job,deptno
   into emp_record
   from emp
   where empno = 7788;
   
   dbms_output.put_line( emp_record.v_empno || ' ' || emp_record.v_ename || ' ' || emp_record.v_job || ' ' || emp_record.v_deptno);
   
end;
/


-------------------------------레코드 삽입---------------------------------------

create table dept_record
as
select * from dept;

declare
        TYPE rec_dept IS RECORD(
            v_deptno dept_record.deptno%type,
            v_dname dept_record.dname%type,
            v_loc dept_record.loc%type
        );
        
        dept_rec rec_dept;
begin 
      dept_rec.v_deptno := 50;
      dept_rec.v_dname := 'DEV';
      dept_rec.v_loc := 'BUSAN';

      insert into dept_record
      values dept_rec;          
    
end;
/

select * from dept_record;


------------------------------업데이트---------------------------------------

declare
        TYPE rec_dept IS RECORD(
           v_deptno dept_record.deptno%type not null := 99,   
           v_dname dept_record.dname%type,
           v_loc dept_record.loc%type
        );
         dept_rec rec_dept;      
begin 
      dept_rec.v_deptno := 50;
      dept_rec.v_dname := 'INSA';
      dept_rec.v_loc := 'SEOUL';
      
      update dept_record
      set dname = dept_rec.v_dname, loc = dept_rec.v_loc
      where deptno = dept_rec.v_deptno;
      
end;
/



declare
     v_deptno dept_record.deptno%type := 50;
begin
     delete from dept_record
     where deptno = v_deptno;
end;
/

--------------------------------조건문------------------------------------------

declare
     vempno number(4);
     vename varchar2(10);
     vdeptno varchar2(10);
     vdname varchar2(10):= null;
begin
   select empno,ename,deptno
   into vempno,vename,vdeptno
   from emp
   where empno = 7788;
   
   if (vdeptno = 10) then                         -- if (조건식) then  
           vdname := 'AAA';                 --실행문
   end if;
   
   if (vdeptno = 20) then                         
           vdname := 'BBB';                
   end if;
   
   if (vdeptno = 30) then                         
          vdname := 'CCC';                
   end if;
      if (vdeptno = 40) then                         
          vdname := 'DDD';                
   end if;
   
   dbms_output.put_line('부서명 : ' || vdname);
end;
/



declare
   -- %ROWTPYE : 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
   -- 컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.
   vemp emp%rowtype;
begin
   select *
   into vemp
   from emp
   where empno = 7788;
   
   dbms_output.put_line(vemp.empno);
   dbms_output.put_line(vemp.ename);
   dbms_output.put_line(vemp.job);
   dbms_output.put_line(vemp.mgr);
   dbms_output.put_line(vemp.hiredate);
   dbms_output.put_line(vemp.sal);
   dbms_output.put_line(vemp.comm);
   dbms_output.put_line(vemp.deptno);
         
end;
/


-- 스칼라 방식
-- 레퍼런스 방식
-- 1. emp.empno%type
-- 2. emp%rowtype

-- 사용자 정의 변수 타입
-- 1. 테이블 type
--        TYPE xxxx
-- 2. 레코드 type


declare
   -- %ROWTPYE : 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
   -- 컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.
   vemp emp%rowtype;
   annsal number(7,2);
begin
  dbms_output.put_line(' 사번 / 이름 / 연봉');
  dbms_output.put_line('-----------------');
  
  select *
  into vemp
  from emp
  where empno = 7788;
  
  -- 해당 사원의 연봉을 출력하세요. 단 커미션이 null인 경우 0으로 계산되게 하세요.
  -- 계산된 연봉을 변수 annsal에 넣어서 출력하세요
  
  if ( vemp.comm is null) then
       annsal := vemp.sal * 12;
  else
       annsal := vemp.sal * 12 +vemp.comm; 
  end if;
     
   dbms_output.put_line(vemp.empno || ' ' || vemp.ename || ' '|| annsal);
  
end;
/

select * from emp;


declare
     vemp emp%rowtype;
     vdname varchar2(10);
begin
    select *
    into vemp
    from emp
    where empno = 7788;
    
    if( vemp.deptno = 10 ) then                        -- else if => elsif (e가 빠진다)
          vdname := 'AAA';
    elsif (vemp.deptno = 20) then    
          vdname := 'BBB';
    elsif (vemp.deptno = 30) then    
          vdname := 'CCC';
    elsif (vemp.deptno = 40) then    
          vdname := 'DDD';
    end if;
    
    dbms_output.put_line(vdname);
end;
/

-- 반복문

loop 
   실행문 ( 무한 반복문 )
   무한 반복문의 제어
   1. EXIT WHEN 조건식;
   2. IF THEN END IF;
end loop;

declare 
    n number := 1;
begin
   loop
     dbms_output.put_line(n);
     n := n + 1;
     exit when n > 10;          --반복문 멈추기 위한 조건
   end loop;
end;
/

---------------------------------for문 ---------------------------------------

begin 
      -- in 구문 뒤에 작성되는 값이 반복의 횟수를 결정한다.
      for n in 1..100 loop      --for 뒤에는 일종의 변수 in 시작값 .. 끝값 기본적으로 1씩 증가
            dbms_output.put_line(n);
      end loop;
end;
/

begin 
      -- in reverse 는 반대로 감소 연산
      for n in reverse 1..10 loop      --for 뒤에는 일종의 변수 in 시작값 .. 끝값 기본적으로 1씩 증가
            dbms_output.put_line(n);
      end loop;
end;
/

-------------------------where 뺴면 오류 나므로 반복문으로 활용--------------------

declare 
    vdept dept%rowtype;
begin
    for n in 1..4 loop
    select *
    into vdept
    from dept
    where deptno = 10 * n;      --1번쨰 돌릴때 10번 2 돌떄 20 3돌떄 30 4 돌때 40 
    dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
    end loop;
end;
/

-------------------------------while 반복문--------------------------------------

declare
      n number := 1;
begin
    while(n <= 10) loop
          dbms_output.put_line(n);
          n := n + 1;
    end loop;
end;
/


declare 
    vdept dept%rowtype;
begin
    for n in 1..4 loop
    select *
    into vdept
    from dept
    where deptno = 10 * n;      --1번쨰 돌릴때 10번 2 돌떄 20 3돌떄 30 4 돌때 40 
    dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
    end loop;
end;
/

declare
     vdept dept%rowtype;
     n number := 1;
begin
      
      while(n <= 4) loop
      select *
      into vdept
      from dept
      where deptno = 10 * n;
       dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
          n := n + 1;
    end loop;
end;
/


-- 조건문 
-- if then end if;
-- if then else end if;
-- if then elsif then end if;

-- 반복문
-- loop end loop;
-- for in loop end loop;
-- while loop end loop;
      

-------------------------------저장 프로시져-------------------------------------
set serveroutput on;
-- 저장 프로시져
-- 1. 생성(create)  -> 2. 실행 (execute or exec)

--create or replace procedure 프로시져명 (매개변수)

--is or as
--    변수 정의
--begin
--    SQL
--    출력구문
--   조건문 , 반복문
--end;
--/
-- execute 프로시져명;      (실행)

drop table emp01;

create table emp01
as
select * from emp;

create or replace procedure emp01_print
is 
  vempno number(10);
  vename varchar2(10);
begin
  vempno := 1111;
  vename := 'KANG';
  
  dbms_output.put_line(vempno || ' ' || vename);
end;
/

execute emp01_print;
exec emp01_print;


create or replace procedure emp01_del
is
begin
    delete from emp01;
end;
/

exec emp01_del;

select * from emp01;


------------------------------매개변수 활용한 프로시져-----------------------------

create or replace procedure del_ename(vename emp01.ename%type)
is
  
begin
   delete from emp01
   where ename = vename;
end;
/

exec del_ename('SCOTT');                
exec del_ename('SMITH');

-- 저장프로시져의 매개변수 유형
-- in, out, in out
-- in : 값을 전달받는 용도
-- out : 프로시져 내부의 실행 결과를 실행을 요청한 쪽으로 전달
-- in out : in + out 

create or replace procedure sel_empno
(
   vempno in emp.empno%type, 
   vename out emp.ename%type,
   vsal out emp.sal%type,
   vjob out emp.job%type
)
is
  
begin
    select ename,sal,job
    into vename,vsal,vjob
    from emp
    where empno = vempno;                    --특정사원에 대한 데이터
    
end;
/

------바인드 변수 만드는법

variable var_ename varchar2(15);
variable var_sal number;                       
variable var_job varchar2(9);

-- exec sel_empno(7499,:바인드 변수1,:바인드 변수2,:바인드 변수3)    변수명앞에 : 붙여주어야함             
exec sel_empno(7499,:var_ename,:var_sal,:var_job);

print var_ename;
print var_sal;
print var_job;


-- 사원 정보를 저장하는 저장 프로시져 만드세요
-- 사번,이름,직책,매니져,부서
-- 사원 정보는 매개변수 사용해서 받아온다.

create table emp02
as
select empno,ename,job,mgr,deptno
from emp;
where 1 != 1;

select*from emp02;

create or replace procedure insert_sawon (   
vempno in emp02.empno%type, 
vename in emp02.ename%type,
vjob in emp02.job%type,
vmgr in emp02.mgr%type,
vdeptno in emp02.deptno%type
)
is

begin 
     insert into emp02
     values(vempno,vename,vjob,vmgr,vdeptno);
end;
/
exec insert_sawon(1111,'kang','ceo',2222,10);

select * from emp02;

-- 저장함수
-- 저장함수와 저장 프로시져의 차이점 : return값 유무
-- 1. 생성(create)
-- 2. 실행(execute)

--create or replace funcion 함수명(매개변수)
--    RETRUN 값의 타입              -- 세미콜론 생략
--i

--begin
--    RETRUN 리턴값;                 --세미콜론 사용
--end;
--/

create or replace function cal_bonus(vempno emp.empno%type)
   return number
is
   vsal number(7,2);
begin
   select sal
   into vsal
   from emp
   where empno = vempno;
   
   return vsal * 200;
end;
/

variable var_res number;                   
--exec뒤쪽에 바인드 변수를 선언해야 한다.
exec :var_res := cal_bonus(7788);       

print :var_res;

drop procedure insertt_sawon;
drop function cal_bonus;

-- 커서

--declare           --테이블 타입의 변수 생성
    --커서 : select 구문이 실행하는 결과를 가리킨다.
--    CURSOR 커서명 IS sql 구문(select); --커서선언
--begin
--    OPEN 커서명;
--    LOOP
--        FECTCH 커서명 INTO 변수명;      --테이블로부터 가져와서 변수에 저장하는 역활
--         exit when 커서명%NOTFOUND;
--    END LOOP;                           --END LOOP 같이 사용
--    CLOSE 커서명;
--end;
--/

declare
   cursor c1 is select * from emp;
   vemp emp%rowtype;              
begin
   open c1;
   loop 
      fetch c1 into vemp;
      exit when c1%notfound;
      dbms_output.put_line(vemp.empno || ' ' || vemp.ename || ' ' || vemp.job || ' ' || vemp.mgr || ' ' || vemp.hiredate || ' ' || vemp.sal || ' ' || vemp.comm || ' ' || vemp.deptno);     
   end loop;
   close c1;
end;
/

--------------------------for loop문 활용한 커서-------------------------------

declare
   cursor c1 is select * from dept;
   vdept dept%rowtype;
begin
   for vdept in c1 loop
      exit when c1%notfound;
      dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
   end loop;
end;
/

--아이디,이름,이름의 성, 부서 이름

-- employees , departments

select employee_id,first_name,last_name,department_name
from employees e innner join departments d
on e.department_id = d.department_id;




create table student (
    id number(10) constraint student_id_pk primary key,
    name varchar2(10) constraint student_name_nn not null,
    department varchar2(30) constraint student_department_nn not null
    );
    
   drop table student;
    
    insert into student
    values (7777,'KANG','COMPUTER');
    
    insert into student
    values (7776,'KIM','ARCHITECTURE');
    
    insert into student
    values (6666,'JUNG','ELECTRONICS');
    
    insert into student
    values (5555,'PARK','MEDICINE');
    
    delete from student
    where name = 'JUNG';
    
    select * from student;