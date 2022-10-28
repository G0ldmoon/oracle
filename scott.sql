--�� DQL(���Ǿ�) ������ ��ȸ

--select �÷���
--from ���̺��

desc emp;

--��ü������
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

--�κ��÷� ������
select empno,ename,sal
from emp;

select deptno
from emp;

--DISTINCT �ߺ� ����
select DISTINCT(deptno)
from emp;

select job
from emp;

select DISTINCT(job)
from emp;

-- + , - , * , /    �������� �����ڴ� ����
-- �÷��� ������� �����Ѵ�.
-- null ���� ���� �Ұ�  nvl()Ű����� null���� 0���� ���� �� ���� �ڿ� as ���̰� ��Ī ��밡��
-- �÷��� ��Ī�� ����� �� �ִ�.
select ename as �����,sal,sal * 12 + nvl(comm,0) as ����,comm
from emp;


-- < ���� >
--select �÷���
--from ���̺��
--order by �÷���(���ı����� �Ǵ� ��) asc(��������/desc(��������) 

select *
from emp
order by sal; --desc;  --���������� ���� ���� 

-- ����(1 ~ 10), ��¥(���ų�¥ ~ �ֱٳ�¥), ����(���� ����)


--< ���� �˻� >
--select �÷���
--from ���̺��
--where ���ǽ�; <, >, =, != Ȥ�� <>, <=, >=, and(�ΰ��� �̻��� ������ ��� ���� ���), or

select *
from emp
where sal >= 3000;  --�޿��� 3000�̻��� ����� ��ȸ

select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;  --30�� �μ��� �ٹ��ϴ� ��� + SALESMAN + �����ȣ 7199�� ���   **ȣ����ǥ ��ҹ��ڵ� �����ؼ� ��ȸ��

select *
from emp
where ename = 'FORD';

--��¥�� �������� ����� �� 
-- ' '
--��¥�� ũ�Ⱑ �ִ�.
-- �Է� 80/12/20 -> ��� 1980 12 20 �ð� �� �� ������������

select * 
from emp
where hiredate < '1982/01/01';

-- or �ΰ� �̻��� �����߿� �ϳ��̻� ���� ���

select *
from emp
where deptno = 10 or sal >= 2000;

-- not �� ���� ������

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
where sal between 1000 and 3000;  -- ���� ���ǹ��� ����

select *
from emp
where sal = 800 or sal =3000 or sal =5000;

select *
from emp
where sal in(800,3000,5000);       --�� ���ǹ��� ����


--like ������
-- ���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
-- ���̵� ī�带 ����Ѵ� ( % , _) 
-- % ��� ���ڸ� ��ü�Ѵ�. _ �� ���ڸ� ��ü�Ѵ�.

select *
from emp
where ename like 'F%';

select *
from emp
where ename like '%D';  --�̸��� D�� �����»��

select *
from emp
where ename like '%O%';  -- �̸��߿� O�� ���Ե� ���

select *
from emp
where ename like '___D';  -- _����� 3�����Ŀ� 4���� ���ڿ� D�� �� ���

select *
from emp
where ename like 'S___%';  -- S�ν����ϰ� 3���� �̻��� �̸��� ���� ���

-- null ������
-- is null / is not null

select *
from emp
where comm is not null;  --null�� = ���� ������ �Ұ��ϴ�.



-- ���� ������ (������, ������, ������)
--�ΰ��� select ������ ����Ѵ�.
-- �÷��� ������ �����ؾ��Ѵ�.
-- �÷��� Ÿ���� �����ؾ� �Ѵ�.
-- �÷��� �̸��� �������.

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION              --������   * ���� �����ݷ� ���־���  �ߺ��Ǿ��� ��� 1���� ��ȸ�Ѵ�.
select empno,ename,sal,deptno
from emp
where deptno = 20;



select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL          --������   * ���� �����ݷ� ���־��� ALL ���� �ߺ��Ǿ ���� �������Ѵ�.
select empno,ename,sal,deptno
from emp
where deptno = 10;

-------------------------------------������--------------------------------------

select empno,ename,sal,deptno
from emp
MINUS           --������  �Է°� ������ ��������
select empno,ename,sal,deptno
from emp
where deptno = 10;


------------------------------------������---------------------------------------

select empno,ename,sal,deptno
from emp
INTERSECT          --������  
select empno,ename,sal,deptno
from emp
where deptno = 10;

-- where 
-- �񱳿�����, ��������, like, is null / is not null , ���տ�����
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
where deptno between 20 and 30 and sal >2000;      -- deptno in (20,30) and sal > 2000; ���� �ᵵ ��

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

-- job = 'CLERK' or job = 'MANAGER'�ص� ��

-- �Լ� 

-- ���� �Լ� : upper, lower, substr, instr, rpad, lpad, replace, concat
-- ���� �Լ� :
-- ��¥ �Լ� :


--select "Welcome',upper(Welcome)
--from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp
where lower(ename) = 'soctt';

select ename,length(ename)     --�����ϴ� ���ڿ��� ����
from emp;

--      1                       17
--     -17                      -1
select 'Welcome to Oracle',substr('Welcome to Oracle',2,3)      --2��° ��ġ���� 3��° ��ġ���� ���
from dual;                                                     --�ϳ��� ������ ��� �� ��ġ���� ������ ���

select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3)      
from dual;  
select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)    --���� �׻� ���ʿ��� ����������   
from dual; 

select instr('Welcome to Oracle',' ')    -- instr ���ڿ��� ��ġ�� ���
from dual;

select instr('Welcome to Oracle','o',6)    -- , �ι��� �Է°��� ������ġ
from dual;

select instr('Welcome to Oracle','e',3,2)    -- , ����° ���� �Է°�° ��ġ�� ��ġ���� ���
from dual;

select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')    -- replace (��¹�,������ ��ġ��,������ ��)
from dual;

select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'#')   -- lpad ����(���ڿ�,ĭ ����,ä�﹮�ڿ�) rpad ������ *�����Ȯ��
from dual;

select rpad('990113-',14,'*')   --�ֹι�ȣ �ڿ� �Ⱥ��̰� �� ��� Ȱ�� ����
from dual;

select concat(empno,ename), empno || '' || ename  -- concat �ι��ڿ��� ��ġ�� �Լ�   '' ȣ����ǥ
from emp;

-- ================================����==========================================

select round(1234.5678),               --round �Ҽ������� �ݿø�
       round(1234.5678,0),             --�Ҽ��� 0��° �ڸ����� ǥ��  �Ҽ��� 1��°���� �ݿø�
       round(1234.5678,1),             -- �Ҽ��� 1��° �ڸ����� ǥ�� �Ҽ��� 2��°���� �ݿø�
       round(1234.5678,2),
       round(1234.5678,-1)             -- �Ҽ��� ���� �������� ������ �ݿø� ->1230
from dual;

select trunc(1234.5678),               -- Ư�� ��ġ�� ������ �Լ�
       trunc(1234.5678,0),            
       trunc(1234.5678,1),             -- �Ҽ��� 1���� ���ķ� ����
       trunc(1234.5678,2),             -- �Ҽ��� 2��° ���ķ� ����
       trunc(1234.5678,-1)             
from dual;

select
      ceil(3.14),             -- �ڽź��� ū ���� ����� ����
      floor(3.14),            -- �ڽź��� ���� ���� ����� ����
      ceil(-3.14),            -- -3 
      floor(-3.14)            -- -4
from dual;

select mod(5,2),mod(10,4)    -- ������ ���ϴ� �Լ� ù��° �Է°��� �ι��� �Է°��� ���� ������
from dual;

select *
from emp
where mod(empno,2) = 1;      --Ȧ���� ����ϴ� �Լ�

select empno
from emp;

-- �Լ� 

-- ���� �Լ� : upper, lower, substr, instr, rpad, lpad, replace, concat
-- ���� �Լ� :
-- ��¥ �Լ� :


--select "Welcome',upper(Welcome)
--from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp
where lower(ename) = 'soctt';

select ename,length(ename)     --�����ϴ� ���ڿ��� ����
from emp;

--      1                       17
--     -17                      -1
select 'Welcome to Oracle',substr('Welcome to Oracle',2,3)      --2��° ��ġ���� 3��° ��ġ���� ���
from dual;                                                     --�ϳ��� ������ ��� �� ��ġ���� ������ ���

select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3)      
from dual;  
select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)    --���� �׻� ���ʿ��� ����������   
from dual; 

select instr('Welcome to Oracle',' ')    -- instr ���ڿ��� ��ġ�� ���
from dual;

select instr('Welcome to Oracle','o',6)    -- , �ι��� �Է°��� ������ġ
from dual;

select instr('Welcome to Oracle','e',3,2)    -- , ����° ���� �Է°�° ��ġ�� ��ġ���� ���
from dual;

select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')    -- replace (��¹�,������ ��ġ��,������ ��)
from dual;

select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'#')   -- lpad ����(���ڿ�,ĭ ����,ä�﹮�ڿ�) rpad ������ *�����Ȯ��
from dual;

select rpad('990113-',14,'*')   --�ֹι�ȣ �ڿ� �Ⱥ��̰� �� ��� Ȱ�� ����
from dual;

select concat(empno,ename), empno || '' || ename  -- concat �ι��ڿ��� ��ġ�� �Լ�   '' ȣ����ǥ
from emp;

-- ================================����==========================================

select round(1234.5678),               --round �Ҽ������� �ݿø�
       round(1234.5678,0),             --�Ҽ��� 0��° �ڸ����� ǥ��  �Ҽ��� 1��°���� �ݿø�
       round(1234.5678,1),             -- �Ҽ��� 1��° �ڸ����� ǥ�� �Ҽ��� 2��°���� �ݿø�
       round(1234.5678,2),
       round(1234.5678,-1)             -- �Ҽ��� ���� �������� ������ �ݿø� ->1230
from dual;

select trunc(1234.5678),               -- Ư�� ��ġ�� ������ �Լ�
       trunc(1234.5678,0),            
       trunc(1234.5678,1),             -- �Ҽ��� 1���� ���ķ� ����
       trunc(1234.5678,2),             -- �Ҽ��� 2��° ���ķ� ����
       trunc(1234.5678,-1)             
from dual;

select
      ceil(3.14),             -- �ڽź��� ū ���� ����� ����
      floor(3.14),            -- �ڽź��� ���� ���� ����� ����
      ceil(-3.14),            -- -3 
      floor(-3.14)            -- -4
from dual;

select mod(5,2),mod(10,4)    -- ������ ���ϴ� �Լ� ù��° �Է°��� �ι��� �Է°��� ���� ������
from dual;

select *
from emp
where mod(empno,2) = 1;      --Ȧ���� ����ϴ� �Լ�

select empno
from emp;

---------------------------------��¥�Լ�----------------------------------------

select sysdate -1 ����, sysdate, sysdate +1
from dual;

select sysdate - hiredate as �ٹ��ϼ�  --���ó�¥ - �Ի糯¥ = �ٹ��ϼ�
from emp;



select trunc((sysdate - hiredate) / 365)           --�ټӳ��
from emp;

select sysdate,
round(sysdate, 'cc') as format_CC,
round(sysdate, 'yyyy') as format_YYYY,
round(sysdate, 'Q') as format_q,
round(sysdate, 'DDD') as foramt_ddd,
round(sysdate, 'HH') as format_hh
from dual;

--------------------------------�ڷ��� ��ȯ--------------------------------------

-- to_char() , to_number() , to_date()


--��¥�� ���ڷ� �ڷ��� ��ȯ to_char()
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS:day') as �Ի�����
from emp;



--���ڸ� ���ڷ� �ڷ��� ��ȯ to_char()
select to_char(123456,'L999,999')    --L ���̸� �������� ���߾� ȭ�� ǥ��
from dual;

select to_char(sal,'L999,999')
from emp;

select to_char(sal,'L000,000')
from emp;


--���ڸ� ���ڷ� �ڷ�����ȯ to_number()   ��� ���ڴ� ���ڷ� ǥ��Ǿ��־�� ����
select '20000' - 10000      --�ڵ�����ȯ (�Ͻ�������ȯ)
from dual;

select '20,000' - '5,000'  --to_number() ����ȯ�� �ؾ���
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--���ڸ� ��¥�� �ڷ�����ȯ   --���ڰ� ��¥������ �����Ϳ��� ��ȯ����
select to_date('20221019','YYYY,MM,DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');


-----------------------------null ������ ó��-----------------------------------
--nvl(null,�ٲٰ����������)
--nvl�� null�������� Ÿ�԰� ���� Ÿ������ �������־�� �Ѵ�.
--nvl(����,����) , nvl(����,����)

select enmae �����,sal,sal *12 +_nvl(comm,0) as ����,comm
from emp;

select *
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr    --mgr�� numberŸ���̶� ���� to_Char�� ���� ���������� ���� 
from emp
where mgr is null;

select comm, nvl2(comm,'O','X')   --null�϶� null�� �ƴҶ� ��� �����ؼ� ǥ��
from emp;

---------------------------���ǹ� ǥ���ϴ� �Լ�-----------------------------------
-- decode() -> switch
-- case  -> if

select ename,job,deptno,
    decode(deptno,10,'AAA',20,'BBB','��Ÿ') as �μ���
from emp;

--������ �����Ƿ� ���� �� �� �ִ�.
--case
--    when [����1]   then [����1�� ������� true �϶� ��ȯ�� ���]
--    when [����2]   then [����2�� ������� true �� �� ��ȯ�� ���]
--    else [�� ���� �� ��ġ�ϴ� ��찡 ���� �� ��ȯ�� ���]
--   and as ��Ī

select ename,job,deptno,
       case 
       when deptno = 10 then 'AAA'
       when deptno = 20 then 'BBB'
       when deptno = 30 then 'CCC'
       else '��Ÿ'
       end as �μ���
from emp;

select ename,job,sal,
       case 
       when sal between 3000 and 5000 then '�ӿ�'
       when sal >= 2000 and sal < 3000 then '������'
       when sal >= 500 and sal < 2000 then '���'
       else '��Ÿ'
       end as ����
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
       else to_char(mgr)                      --����Ÿ������ ĳ����
       end as CHG_MGR
       from emp;
       

       
       ----------------------------���� �Լ�-------------------------------------
       -- sum(),avg(),count(),max(),min()
       -- �Ϲ��÷��� ���� ��� �Ұ�
       -- ũ��񱳰� ���� ��� Ÿ�Կ� ��� ����
       
                     select sum(sal)                      --���� �����͸� ���Ѵ�.
       from emp;
       
       select avg(sal)                      --���� �������� ����� ���Ѵ�.
       from emp;
       
       select count(*)                      --���̺� ��ü ���ڵ� ����
       from emp;
       
       select max(sal),min(sal)             --�ְ�,������ 
       from emp;
       
        select count(*),count(comm)           
       from emp;
       
       select ename,max(sal)               --�÷��� ������ �������������� ����  
       from emp;
       
       select min(hiredate), max(hiredate)           --�Ի��Ѽ���
       from emp
       where deptno = 20;
       
       
              
       
       -- select �÷���
       -- from ���̺��
       -- where ���ǽ�
       -- group by �����÷���
       -- order by �÷��� ���Ĺ��  ==> �� �������� �ۼ�
       
       select avg(sal) from emp where deptno = 10
       UNION
       select avg(sal) from emp where deptno = 20
       UNION
       select avg(sal) from emp where deptno = 30;
       
       
       
       
       
       -----------------------------group by -----------------------------------
       
       select deptno,avg(sal)          --���� ������ UNION �� ������ ��
       from emp
       group by deptno;         -- ��ȸ�Ǵ� ������ ������ ��� �Ϲ� �÷���� �����ص� ��밡��
       
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
       order by deptno,job desc;     -- deptno �������� ���� �� ���¿��� job �⺻ �������� abc....
       
       
       
       
       ------------------------group by having---------------------------------
       
       -- select �÷���
       -- from ���̺��
       -- where ���ǽ�     (�׷��Լ� ���Ұ�/group by, having ���� ���� ����)
       -- group by �����÷���
       -- having ���ǽ� (�׷��Լ��� ����Ѵ�)
       -- order by �÷��� ���Ĺ��  ==> �� �������� �ۼ�
       
       select deptno,avg(sal)
       from emp
       group by deptno
       having avg(sal) >= 2000;       --deptno �׷쿡�� sal �� 2000 �̻��� ������� avg �� 
                                      -- ���ǽ��� �ۼ� �� �� �׷��Լ� ���
       
       select deptno, avg(sal)
       from emp
       where deptno != 10
       group by deptno
       having avg(sal) >= 2000; 
       
       
       --------------------------����(join)--------------------------------------
       
       -- 2�� �̻��� ���̺��� �����͸� ��ȸ
       -- from ���� �ΰ� �̻��� ���̺��� �ۼ��Ѵ�
       -- where�� ���� ������ �ۼ��Ѵ�
       
       -- cross join (where�� ���� ��� ����)
       -- equi join (where ������� : =)
       -- non equi join (where ���������� : and , or)
       -- self join (where �ϳ��� ���̺��� ����Ѵ�)
       -- out join  (where�� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���� : (+))
       
       select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc              -- emp���̺� -ename,job dept ���̺� �ȿ� ���� dname,loc
       from emp,dept
       where emp.deptno = dept.deptno;
       
       
     select ename,job,e.deptno,dname,loc
     from emp e,dept d                     --���̺� ��Ī �ִ¹�� ��ĭ ��� 
     where e.deptno = d.deptno;
     
     select *
     from emp;
     
     select *
     from salgrade;
     
     select ename, sal, grade
     from emp e,salgrade s
     where e.sal between s.losal and s.hisal;
     --where e.sal >= s.losal and e.sal <= s.hisal   
     
     --���, �̸�, �޿�, �μ���ȣ, �μ���, �޿����
     -- emp                  dept             salgrade
     
     select empno, ename, sal, d.deptno, dname, grade
     from emp e, dept d, salgrade s
     where e.deptno = d.deptno
     and e.sal between s.losal and s.hisal;
     
     
     
     -------------------------------self join-----------------------------------
       
       
    select e.empno,e.ename,e.mgr,m.ename               --mgr ������ �����ȣ�� �ƴ� �̸��� ���̳����� �ϰ�ʹ�.
    from emp e, emp m              --�ݵ�� ��Ī �ο�
    where e.mgr = m.empno;
      
   
    select ename,deptno                         --scott �̶� �����μ��� �ٹ��ϰ���� ������� �̸��� ��ȸ  ename  ename  
    from emp                                                                                      --scott  smith
    where deptno = 20;                                                                            --scott  jones ..... ford ����
    
    
    select work.ename, friend.ename
    from emp work, emp friend    
    where work.deptno = friend.deptno    --���� �μ� 
    and work.ename = 'SCOTT' 
    and friend.ename != 'SCOTT';          
    
    
    
        
    -- �ܺ�����(out join)
    -- ��� �����Ǵ� �����͸� ���� ��ȸ �ϱ� ���ؼ� ���
    
    select e.empno,e.ename,e.mgr,m.ename               -- ������ ���� null ����� ������ �ʴ� ������
    from emp e, emp m                        --�ݵ�� ��Ī �ο�
    where e.mgr = m.empno(+);                          --�����Ͱ� ���� ���̺� �ʿ� (+)�� ���δ�.
    
    
    select ename,sal,d.deptno,dname
    from emp e, dept d
    where e.deptno(+) = d.deptno;
    
    
    
    
    
    ------------------------ ANSI JOIN (ǥ�� ���� ���)-------------------------
    
    -- cross join
    -- natural join
    -- inner join(equi, non equi)
    -- outer join ( (+) )   [left, right, full] outer join
    
    select ename,sal,dname,loc
    from emp e inner join dept d
    on e.deptno = d.deptno;              --an si join ������ on
    
    select ename,sal,dname,loc
    from emp e inner join dept d
    using(deptno);                       --���� ���̺��� �÷����� ������ ��츸
    
    select ename,sal,dname,loc
    from emp e inner join dept d
    using(deptno)
    where ename = 'SCOTT';
    
    select e.empno,e.ename,e.mgr,m.ename  --����� ����� �̸��� ���̳����� 
    from emp e inner join emp m
    on e.mgr = m.empno;
    
    select empno,ename,sal,grade
    from emp e inner join salgrade s
    on e.sal between s.losal and s.hisal;
    
    select e.empno,e.ename,e.mgr,m.ename  --����� ����� �̸��� ���̳����� 
    from emp e left outer join emp m    -- �����Ͱ� �ִ� ���� �����Ѵ�
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
    group by e.deptno,d.dname;            --2���� �÷��� �׷����� ����߸�
    
    
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
    
    
    
    ---------------------------���� ����-----------------------------------------
    
    
    
    -- �������� : select ���� ��ø  select(select) - �Ϲݼ������� from(select) �ζ��κ� where(select)��������
    --������ �������� : = , != , > ....
    --������ �������� : ANY.....
    
   
        
    select dname
    from dept
    where deptno = 20;
    
    
    select dname                                 --�������� 
    from dept
    where deptno = (                            --���� ����
                    select deptno
                    from emp
                    where ename = 'SCOTT');
                    
                    
    select ename, max(sal)
    from emp;
    
    select ename,sal
    from emp
    where sal = (                              --where ���� group�Լ� �Ұ�
                 select max(sal)
                 from emp
                 );
                 
   --DALLAS                         
   --�̸�, �μ���ȣ        
   
   select ename, deptno         --�μ� ��ȣ�� ���� �����̸����� �ٹ��ڸ� Ȯ���ϴ¹�
   from emp
   where deptno = (
                   select deptno
                   from dept
                   where loc = 'DALLAS'
                   );
                   
    -- �ڽ��� ���� ���(�Ŵ���)�� KING �� ����� �̸��� �޿��� ��ȸ
    
    select ename,sal
    from emp
    where mgr = ( select empno from emp where ename = 'KING'); 
    
    
    
    --------------------------������ ��������------------------------------------
    
    -- in :��� �߿� �ϳ��� �����ϸ� �ȴ�.
    -- > any : ����߿� ���� ���� �� ���� ũ�� �ȴ�.
    -- > all : ����߿� ���� ū ������ ũ�� �ȴ�.
   
    
    select *                                   --�μ��� �ִ�޿� �޴� ��� ���� ���
    from emp
    where sal in( 
                 select max(sal) 
                 from emp
                 group by deptno
                 );
                 
                 
    select *                                   --�μ��� �ִ�޿� �޴� ��� ���� ���
    from emp
    where sal >  any(                    --�޿��� 2800���� ū���
                 select max(sal)         --���� ���������� ũ��
                 from emp
                 group by deptno
                 );
                 
    select ename,sal
    from emp
    where sal > all (              --all���� ��ȸ�� ��(30�μ� 2850)���� ũ�� �ȴ�.
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
    
    -- DML(���������۾�) : insert, update, delete
    -- insert : ���̺� ������ ����
    -- insert into ���̺�� (�÷���1,�÷���2.....)
    -- values (��1,��2.....)
    -- �÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�.
    -- �ۼ� ������� 1 : 1 ��Ī�ȴ�.


    create table dept_temp
    as 
    select * from dept;
    
    select *
    from dept_temp;
    
    drop table dept_temp;
    
    insert into dept_temp (deptno,dname,loc)
    values (50,'DATABASE','SEOUL');
    
    insert into dept_temp           --�÷� ���� ���� (����÷� ���� �� ���)
    values (70,'HTML','SEOUL');
    
    insert into dept_temp           --�÷� ���� ���� (����÷� ���� �� ���)
    values (80,NULL,'SEOUL');       
    
    insert into dept_temp (deptno,dname)
    values (60,'JSP');                   --����ִ� �÷��� �Ϲ������� null���� ����.
    
    
    create table emp_temp
    as
    select * from emp
    where 1 != 1;                        -- �����ʹ� ���ְ� �÷������� ������ ��
    
    drop table emp_temp;
    
    select *
    from emp_temp;
    
     select * from emp_temp
    where 1 != 1;
    
    insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    values (9999,'������','PRESIDENT',NULL,'2022/10/21',5000,1000,10);
    
    insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    values (3111,'��û��','MANAGER',9999,sysdate,4000,null,30);
    
    
    
    ----------------------------UPDATE(�����ͼ���)--------------------------------
    
    -- update : �÷��� �����͸� ����
    -- update ���̺��
    -- set    �÷��� = ��, �÷��� = ��, ......
    -- where  ���ǽ�
    -- �������� ������� ������ �ش� �÷��� ��� ����ȴ�.
    
    
    create table dept_temp2
    as
    select * from dept;
    
    select *
    from dept_temp2;
    
    update dept_temp2 
    set loc = 'SEOUL';            -- **where ���� ��� ���� ��� �÷��� ��� �����Ͱ� �ش� �����ͷ� ���� 
    
    update dept_temp2
    set dname = 'DATABASE', loc = 'SEOUL'
    where deptno = 40;
    
    ----------------------------delete(�����ͻ���)-------------------------------
    
    -- delete(������ ����)
    -- delete from ���̺��
    -- where ���ǽ�            ** where���� ������� ������ ��� ������ ������
    

     create table emp_temp2
     as
     select * from emp;
     
     select *
     from emp_temp2;
    
    delete from emp_temp2;            --���̺� ��ü ������ ����
    
    delete from emp_temp2
    where ename = 'SCOTT';
    
    -------------------------TCL(�������� �������� �Ǵ� ���)----------------------
    
    -- Ʈ������
    -- commit, rollback, savepoint
    -- commit : ������ ���� ����(���̺��� ������ �ݿ�)
    --          create ������ ����ؼ� ��ü ������ ��(�ڵ�)
    -- rollback : ������ ���� ���(���̺��� ������ �̹ݿ�)
    --            õ������,����,����(�ڵ�)
    
    drop table dept01;
    
    create table dept01
    as
    select * from dept;
    
    select *
    from dept01;
    
    -- Ʈ������ ���� ���� 
    delete from dept01;              -- �ܺ� ���� �ÿ��� ���� �ȵ� ���� 
    
    truncate table dept01;           -- delete�� ������ ����̳� �ѹ��� �ȵ� ���̺� ������ ��������
    
    commit;                          -- ���̺� ������ �ݿ� (���� �ȵ�)
    rollback;                        -- commit �ϱ� ������ ���󺹱�
    
    
    
    --------------------------������ ���Ǿ�(DDL)----------------------------------
    
    -- DDL(������ ���Ǿ�) : table(��簴ü)�� ����,����,�����ϴ� ��ɾ�
    -- create(����) , drop(����) , alter(����)
    
   -- create table  ���̺�� (  -- table(��ü)
   --          �÷���1 Ÿ��,    -- column(�Ӽ�)
   --          �÷���2 Ÿ��,
   --          �÷���3 Ÿ��
   --          );
   
   create table emp_ddl(
     empno number(4),                          --���,�̸�,��å,������,�Ի�����,�޿�,������,�μ���ȣ 
     ename varchar2(10),      --byte
     job varchar2(9),
     mgr number(4),
     hiredate date,
     sal number(7,2),                         --, �ڿ��� �Ҽ��� ��ٰųĴ� �ǹ�
     comm number(7,2),
     deptno number(2)
     ); 
     
     select *
     from emp_ddl;
     
     insert into emp_ddl
     values(7777,'������','CEO',null,sysdate,1200,1200,10);
     
     
     create table dept_ddl     --���̺��� ����
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
     where 1 != 1;                     --���̺� ������(������x) �������� ���
 
     -- ���̺� ����(�÷��� ���� ����)
     -- ���ο� �÷��� �߰�(add), �÷��� �̸��� ����(rename), �ڷ����� ����(modify), �÷��� ����(drop)
     -- alter
     
     create table emp_alter
     as
     select * from emp;
     
     select *
     from emp_alter;
     
     alter table emp_alter
     add address varchar2(100);
     
     alter table emp_alter                --adress �÷����� addr�� ����
     rename column address to addr;
     
     alter table emp_alter                   
     modify empno number(10);            --Ÿ���̳� ũ�⸦ ����
     
     alter table emp_alter                --addr ����
     drop column addr;
     
     -- ���̺� ���� DROP 
     
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
    
     
    
    
    -------------------------������ ����------------------------------
    
    desc user_tables;
    
    select table_name
    from user_tables;
    
    select owner, table_name               --������ �������� 
    from all_tables; 
     
     
    -- index(�˻��ӵ��� ����ϱ����� ��� ��ü)
    
    -- select �������� �˻��ӵ��� ��� ��Ų��
    -- ��ü ���ڵ��� 3~5% �����϶�
    -- index ��ü�� �÷��� �����ؼ� ����Ѵ�
    
    -- create index �ε�����    ������ drop
    -- on ���̺��(�÷���);
    
         
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
    
    
    -- index ���� �� 0.035 ����
    select empno,ename
    from emp01
    where ename = 'bts';
    
    create index idx_emp01_ename
    on emp01(ename);
    
     -- index ���� �� 0.001 ����
    select empno,ename
    from emp01
    where ename = 'bts';
    
    drop index idx_emp01_ename;                 --index ����
    
    -- ���̺� ���� �� ����
    -- show recyclebin;  ���� �� ���̺� Ȯ��
    
    --  flashback table ���̺��    ���� �� ���̺� �����ϴ� ����
    --  to before drop;
    
    -- purge recyclebin; ������ ����
    
    
    show recyclebin;
    
    flashback table emp_hw
    to before drop;
    
    purge recyclebin;
    
    
    
    -- ��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°��� ���ϰ� �ϴ°�
    -- not null 
    -- unique     (���� ,�ߺ�x)
    -- primary key (�⺻Ű) = not null + unique
    -- foreign key (�ܷ�Ű/����Ű)
    --    1. �θ�� �ڽ��� ���踦 ������ �ڽ� �� ���̺��� �÷��� �����Ѵ�.
    --    2. �θ� �� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique �ؾ� �Ѵ�.
    --    3. null �����͸� ���
    -- check 
    -- default
    
 -- index ��ü ������ (0.001 ~0.002)
 
    select empno,enmae
    from emp03
    where ename = 'bts';
    
    insert into emp
    values (1111,'aaa','MANGE',9999,sysdate,1000,
    
    
    create table emp04(
    empno number(4) constraint emp04_empno_pk primary key,  -- �⺻Ű : not null + uniqei
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
    values (1111,'ȫ�浿','MANAGER`',30);
    
    insert into emp04
    values (2222,'ȫ�浿','MANAGER',30);
    
    insert into emp04
    values (null,'������','SALEMAN',20);
    
    insert into emp04
    values (null,'������','SALEMAN',20);
    --NULL�� ("SCOTT"."EMP04"."EMPNO") �ȿ� ������ �� �����ϴ�
    
    insert into emp04
    values (2222,'������','SALEMAN',10);
    --���� ����(SCOTT.EMP04_EMPNO_PK)�� ����˴ϴ�
    
    
    -------------------------�ܷ�Ű ����Ű--------------------------------------
    
    create table dept07 (
    deptno number(2) constraint dept07_deptno_pk primary key,  --�θ� �� �⺻Ű�� �־�� ��������
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

    
    
    -- ���� �������� ����� ������ ���� 
    
    insert into dept07
    select * from dept;    --�θ� ���̺� ���� 
    
    insert into emp07 
    select empno,ename,job,deptno from emp;   --emp07 ���̺� emp ���̺� �ڷḦ �־��
    
    insert into emp07
    values(null,'aaa','MANAGE',20);
    
    select *
    from emp07;
    
    
    delete from emp07
    where ename = 'aaa';
    
            
    create table emp08 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    sal number(7) constraint emp08_sal_ck check(sal between 500 and 5000),   --cheak ���� (�������� ����)
    gender varchar2(2)constraint emp08_gaender_ck check(gender in ('M','F'))   --in ���� Ȱ�� ���� ����
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
      loc varchar2(15) default 'SEOUL'     --�⺻���� SEOUL�� ��������
   );
   
   insert into dept08(deptno,dname)
   values (10,'SALES');                     --loc �������ص� �⺻ SEOUL�� �ԷµǾ���
   
   insert into dept08(deptno,dname,loc)     --���� �� ��� �Է� �����Ͱ� ���
   values (20,'SALES','BUSAN');
   
   select *                            
   from dept08;
   
   delete from dept08
   where loc = 'BUSAN';
   
   
   -- ���� ���� ���� ���
   -- �÷� ������ ����  (not null�� �÷� ���������� ����)
   -- ���̺� ������ ���� (not null�� ������ �� ����)
   
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
   
   
   
   
   -----------------����Ű(�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)---------------------
   
   -- ���̺� ���� ������θ� ���� ����
   -- 1. ���̺� �ȿ��� �����ϴ� ���
   -- 2. Alter ��ɾ� �����
   
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
   
   alter table emp10                 --�������� ����
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
   where deptno = 10;  --�θ� �����͸� ������� �� ��� �����Ǿ��ִ� �����ʹ� ���� �� ����. = ��Ȱ��ȭ
   
   -----------------------------cascade
   
   alter table dept11
   disable primary key cascade;     --�⺻Ű�� �ڽ����̺� ��Ȱ��ȭ
   
delete from dept11
   where deptno = 10;               --��Ȱ��ȭ �� ���� ����
   
   alter table dept11               --��Ȱ��ȭ�̰� ���������� �״��
   drop primary key;
   
   alter table dept11               --�������� ���� ����
   drop primary key cascade;
     
     
   -- ���̺� ���� ��Ŀ� ���� �������� ����
   
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
    
   alter table dept_const               --��Ȱ��ȭ�̰� ���������� �״��
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
    
   alter table emp_const               --��Ȱ��ȭ�̰� ���������� �״��
   drop primary key;
   
    insert into emp_const
    values(1111,'Kang','CEO','kkk',sysdate,5000,5000,10);
    
    insert into emp_const
    values(1112,'Kang','CEO','kk2k',sysdate,9999,5000,10);
    
    
    
    ------------------------------��--------------------------------------------
    
    --��ü : table, index, view
    -- create or replace view �����̺��[(alias)]
    -- as
    -- �������� ( select )
    -- [with check option]    []���ÿ��
    -- [with read only]
    
    create table dept_copy
    as
    select * from dept;
    
    create table emp_copy       --���� ���̺��� ���������� �ȳѾ�´�
    as
    select * from emp;
    
    create table book_copy
    as
    select * from book;
    
    select * from book_copy;
    
    alter table emp_copy
    add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);
    
    select *
    from emp_copy;  --14�� ������
    
    create or replace view emp_view30                   
    as
    select empno,ename,sal,deptno 
    from emp_copy
    where deptno = 30;                          --30�μ��� ������ �����͸� ��ȸ�ϴ� �� ���̺�
    
    select *
    from emp_view30;
    
    insert into emp_view30
    values (1111,'KANG',5000,30);
    
    insert into emp_view30 (empno,ename,sal)
    values (2222,'hong',2000);
    
    insert into emp_view30 (empno,ename,sal,deptno)  -- ���� ���̺� deptno�� 50�� �����Ƿ� ����
    values (2222,'hong',2000,50);
    
    delete from emp_copy
    where ename = 'hong';
    
    delete from emp_view30
    where ename = 'KANG';
        
    select *
    from emp_copy;
    
    delete from emp_copy
    where ename = 'KANG';
    
    create or replace view emp_view(�����ȣ,�����,�޿�,�μ���ȣ)
    as
    select empno,ename,sal,deptno
    from emp_copy;
    
    select *
    from emp_view;
    
    select *
    from emp_view
    --where �μ���ȣ = 20;
    where deptno = 20;     --��Ī�� �ָ� ���� �÷����� ��ȸ �Ұ���
    
    create or replace view emp_dept_view
    as
    select empno,ename,sal,e.deptno,dname,loc  --��ġ�� �̸��� �տ� �Ҽ�
    from emp e inner join dept d                --�Ƚ����� 2�� ���̺� 
    on e.deptno = d.deptno
    order by empno desc; 
    
    select *
    from emp_dept_view;
    
    -- �μ��� �ּ� �޿��� �ִ�޿�
    -- dname min_sal max_sal 
    
    
    ------------------------------���պ�-----------------------------------------
    
    create or replace view sal_view(dname,min_sal,max_sal)
    as
    select dname,min(sal),max(sal)                         --�μ��� �ּұݿ� �ִ�޿�
    from emp e inner join dept d
    on e.deptno = d.deptno
    group by d.dname;                                     --�׷������ Ȯ��
    
 
    select *
    from sal_view;
    
    select *
    from emp;
    
    select *
    from dept;
    
    
    select  *
    from salgrade;
    
    drop view sal_view;
    
    --��� ��ü�� �̸��� �ߺ��� �� ����.
    
    creadte or replace view sal_view           --or replace ��� �����
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
    where deptno = 30 with check option;   -- �������� �÷��� �������� ���ϰ� �Ѵ�.
    
    select *
    from view_chk30;
    
    update view_chk30
    set deptno = 10;                   --�� ��� ������ ������ ����ġ   �� ��� �� ���ó�� ���� üũ �ɼ����� ���� �ɾ�д�. 
    
    
    create or replace view view_read30
    as
    select empno,ename,sal,comm,deptno
    from emp_copy
    where deptno = 30 with read only;   -- ��� �÷��� ���� C U D �� �Ұ��� (��ȸ�� ����)
    
    update view_read30
    set deptno = 10;
    -- �б� ���� �信���� DML �۾��� ������ �� �����ϴ�.  (insert,update,delete)
    
    
    -- ���� Ȱ��
    -- TOP - N ��ȸ�ϱ� 
    
    select * from emp;
    
    -------------------------�Ի����� ���� ��� 5���� ��ȸ--------------------------
    
    select *
    from emp
    order by hiredate asc;       -- 1. �������� ����
    
    select * from emp
    where hiredate <= '81/05/01';  -- 2. ���� Ȯ�� �� ��¥ �������� ��ȸ
    
    DESC emp;
    
    select rownum,empno,ename,hiredate    -- rownum ���̺� �����Ͱ� ��ȸ�Ǵ� ������� num�ο�
    from emp
    where rownum <= 5;
    
     select rownum,empno,ename,hiredate 
     from emp
     where rownum <= 5
     order by hiredate asc;                    --������ �������� ����Ǳ� ������ ��������
     
     
     select rownum,empno,ename,hiredate 
     from emp
     order by hiredate asc;
     
     create or replace view view_hiredate  -- emp���̺��� hiredate ������������ ���ĵ� �並 ����
     as
     select empno,ename,hiredate
     from emp
     order by hiredate asc;                 -- ��� ������ �°� ������ ���̺� (��)
     
     select * from view_hiredate;
     
     select rownum,empno,ename,hiredate
     from view_hiredate
     where rownum <= 5;
     
     
     ----------------------rownum �� 2 ~ 5 ������ ����� ���� ���-----------------
     
     select rownum,empno,ename,hiredate
     from view_hiredate
     where rownum betweend 2 and 5;   --between�� ������� ����
     
     
        
     create or replace view view_hiredate_rm           -- hiredate�� ������������ �����س��� view_hiredate�並 �����ϰ� rownum�� ��Ī�� ���� �並 ����
     as
     select rownum rm,empno,ename,hiredate
     from view_hiredate;
     
     
     select rm,empno,ename,hiredate
     from view_hiredate_rm;
     
       
     select rm,empno,ename,hiredate
     from view_hiredate_rm
     where rm >= 2 and rm <= 5;        --���̺� 2�� ����ϴ°ſ� ���� �ζ��� �並 Ȱ���ϸ� 1��� �����ϴ�.
     
     
     ---------------------------�ζ��� ��----------------------------------------
     
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
  
  
  
  ---------------------�Ի����� ���� ���� 5���� ��ȸ�ϼ���----------------------
  --�ζ��κ�
  
  select rownum,empno,ename,hiredate
  from (
        select empno,ename,hiredate
        from emp
        order by hiredate asc
        )
   where rownum <=5;
   
   
   -- ������ ��ü
   -- �ڵ����� ��ȣ�� ������Ű�� ��� ����
   -- create , drop
   -- nextval, currval
   
   -- create sequence ��������
   -- start with   ���۰� => 1
   -- increment by ����ġ => 1
   -- maxvalue     �ִ밪 => 10�� 1027
   -- minvalue     �ּҰ� => 10�� -1027
   
   create sequence book_seq
   start with 10
   increment by 10
   maxvalue 1000;
   
   select book_seq.nextval
   from book;
   
   create sequence dept_deptno_seq
   increment by 10
   start with 10;
   
   select dept_deptno_seq.nextval         --�����Ҷ����� ��Ŭ����Ʈ(10)�� ����     * back �ȵ�
   from dual;
   
   select dept_deptno_seq.currval         --������ ���� ���� ������
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
     values ('pid'||idx_product_id.nextval,'ġ��',2000);  --Ư�� ���ڸ� ���� ��� �ش� ���� ����
     
     select * from product1;
     
     drop sequence idx_product_id;
     
     
     ----------------------------����� ����-------------------------------------
     
     -- ����� ���� create, drop
     -- create user ������ identified by �н�����
     -- alter user ������ inentified by �н�����
     -- drop user ������ cascade
     
     create user user01 identified by 1234;
     
    -- DCL(�����)
    -- grant(���Ѻο�), revoke(����ȸ��)
    -- grant �ý��� ���� to ������
    -- revoke �ý��� ���� from ������
    
    create user user01 identified by 1234;       -- ���� (������)
    
    alter user user01 identified by tiger;       -- ���� (������)
    
    drop user user01 CASCADE;                    -- ���� (������)

     grant create table                          -- ���Ѻο� (������)
     to user01;
    
    revoke create table                          -- ����ȸ�� (������)
    from user01;
   
    alter user user01                            -- ������ �뷮 ���� (������)
    quota 2m on users;
    
    -- �ý��� ���� (create .....)
    -- ��ü ���� (select ....)
    
    --grant ��ü���� ����
    --on ��ü��
    --to ������
    
    --��
 create user user02 identified by 1234;
 
 grant CREATE SESSION to user02;
 
 grant connect,resource                       --connect ���� 8�������� ���� 
 to user02;
 
 drop user user02;
 
 create user nbac identified by 1234;              --nbac�� ������ ��������
 grant DBA,connect,resource
 to nbac;
 
 drop user nbac;
 
 --system == nabc
 --nbac 
 
 -----------------------------nbac ��ü-----------------------------------------
 
 create user user03 identified by 1234;             --nbac ���������� ���Ѻο��� ����
 
 
  -----------------------------nbac ��ü-----------------------------------------
  
  
 -- ����� ���� ��
 -- ������ ���������� ����
 -- create role �Ѹ�
 -- grant ���� to �Ѹ�
 
 --------------------------------system ����-----------------------------------
 
  create role mrole;                              --�� ��ü ����
  grant create session,create table,create view   --�ѿ� ���� �ο� (������������,���̺��������, �� ��������)
  to mrole;
  
   create user user04 identified by 1234;          --���� ����
   
   grant mrole                                    --���� ���� ���� ������ �ο�
   to user04;
   
   alter user user04                            --���� ���Ѻο� (�뷮�ο�)
   quota 2m on users;
   
   -- ������ ���ѿ��� �� ����
   create role mrole2;
   
   -- ��ü������ �ش� ����� �������� ����
   -- scott ���� mrole �ѿ� ���Ѻο�
   -- grant select
   -- on emp
   -- user mrole2;
   
   -- �� ������ ������ ���������� ����
   grant mrole2
   to user04;
   
   
 
 --------------------------------system ����-----------------------------------
 
 -----------------------------user 04 ����--------------------------------------
 
 create table test2 (
    name varchar2(10)
    );
    
  insert into test2
  values ('aaa');
  
  select * from test2;
  
   
 -----------------------------user 04 ����--------------------------------------
 
   --scott����
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
  select * from user_role_privs;          --���� �ο� Ȯ��
  
  set ROLE all;                           --��Ȱ��ȭ ���� ����
  select * from scott.emp;
  
  create user user05 identified by 1234;
  grant connect,resource
  
  --system   �� ���� ȸ��
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
  
  
  --PL/SQL (Ȯ��Ǿ��� SQL���)
  -- ����, ���ǹ�, �ݺ���
  
  -- declare  (��������)  
  --  ��Į�� ���
  --  vempno number(4);
  --  ���۷��� ���
  --  vempno emp.empno%type;          -- ���� ���̺��� �÷��� Ÿ���� �����Ѵ�. 
  
  -- begin    (SQL���� �ۼ�
  --           ��±��� �ۼ�)
  -- exception  (����ó������)
  -- end; /
  
  -- set serveroutpu on;     <- ���� �����ؾ���
  
  set serveroutpu on;
  
  begin
      dbms_output.put_line(' Hello World');  
  end;
  /
  
  
  
  declare                        -- ���� �����ϴ� �κ�
      --vempno number(4);          -- ������ ����    (������ Ÿ�԰� ũ�� ����)
      --vename varchar2(10);
      
      vempno number(4) := 7777;                --����� ����
      vename varchar2(10) not null := 'SCOTT'; -- null ���� ������ ������ ����� �� ����.
  begin
      --vempno := 7777;                        -- ������ �ʱ�ȭ := �� ���Կ����� �ٿ��������
      --vename := 'SCOTT';                     -- ���ڴ� ȣ����ǥ
      
      dbms_output.put_line(' ��� / �̸�' );           -- �ڹٿ��� sysout�� ����
      dbms_output.put_line(vempno || ' ' || vename);  --�����Ͽ� ����� ��� || Ȱ��
  end;
  /
  
  declare
  vempno emp.empno%type := 7777;   -- := �����ʱ�ȭ ����   ���۷��� ���
  
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
  into vempno,vename                                  -- (�ʼ�) into ���� ����ؼ� ������ �����ؾ��Ѵ�.
  from emp;
  where empno = 7788;                             -- �ݵ�� where���� ����ؾ��Ѵ�.
  
  dbms_output.put_line(' ��� / �̸� ') ;
  dbms_output.put_line(vempno || ' ' || vename);
--exception                                               --����ó��
  --when TOO_MANY_ROWS then dbms_output.put_line('���Ǽ��� ������ �Դϴ�.');
  --when OTHERS then dbms_output.put_line('��� ���ܿ� ���� ó��');
  --       
end;
/

select*
from emp;

declare
  -- ���̺� type(����� ���� ���� Ÿ��)
  -- �迭�� ����
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
    enameArr ename_table_type; -- �迭 ������ ���� ����
    jobArr job_table_type;     -- �迭 ������ ���� ����
    mgrArr mgr_table_type;
    hiredateArr hiredate_table_type;
    salArr sal_table_type;
    commArr comm_table_type;
    deptnoArr deptno_table_type;
  
  i BINARY_INTEGER := 0;
  
begin
  for k in (select empno,ename,job,mgr,hiredate,sal,comm,deptno from emp) loop      -- �ݺ���
      i := i + 1;
      empnoArr(i) := k.empno;
      enameArr(i) := k.ename;                    --ename 14���� �迭
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

-------------------------------���ڵ� Ÿ��---------------------------------------

declare 
    -- ���̺� type(����� ���� ���� Ÿ��)
    -- �迭�� ����
    -- vename varchar(10)
      -- ���ڵ� type(�������� ������ ��� ����Ѵ�) => ����� ���� ���� Ÿ��
  -- Ŭ������ �����ϴ�.
  
  TYPE emp_record_type IS RECORD (
      v_empno emp.empno%type,
      v_ename emp.ename%type,
      v_job emp.job%type,
      v_deptno emp.deptno%type
      );
    
    emp_record emp_record_type; -- ���ڵ� Ÿ���� ���� ����;
    
begin
   select empno,ename,job,deptno
   into emp_record
   from emp
   where empno = 7788;
   
   dbms_output.put_line( emp_record.v_empno || ' ' || emp_record.v_ename || ' ' || emp_record.v_job || ' ' || emp_record.v_deptno);
   
end;
/


-------------------------------���ڵ� ����---------------------------------------

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


------------------------------������Ʈ---------------------------------------

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

--------------------------------���ǹ�------------------------------------------

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
   
   if (vdeptno = 10) then                         -- if (���ǽ�) then  
           vdname := 'AAA';                 --���๮
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
   
   dbms_output.put_line('�μ��� : ' || vdname);
end;
/



declare
   -- %ROWTPYE : ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
   -- �÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
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


-- ��Į�� ���
-- ���۷��� ���
-- 1. emp.empno%type
-- 2. emp%rowtype

-- ����� ���� ���� Ÿ��
-- 1. ���̺� type
--        TYPE xxxx
-- 2. ���ڵ� type


declare
   -- %ROWTPYE : ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
   -- �÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
   vemp emp%rowtype;
   annsal number(7,2);
begin
  dbms_output.put_line(' ��� / �̸� / ����');
  dbms_output.put_line('-----------------');
  
  select *
  into vemp
  from emp
  where empno = 7788;
  
  -- �ش� ����� ������ ����ϼ���. �� Ŀ�̼��� null�� ��� 0���� ���ǰ� �ϼ���.
  -- ���� ������ ���� annsal�� �־ ����ϼ���
  
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
    
    if( vemp.deptno = 10 ) then                        -- else if => elsif (e�� ������)
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

-- �ݺ���

loop 
   ���๮ ( ���� �ݺ��� )
   ���� �ݺ����� ����
   1. EXIT WHEN ���ǽ�;
   2. IF THEN END IF;
end loop;

declare 
    n number := 1;
begin
   loop
     dbms_output.put_line(n);
     n := n + 1;
     exit when n > 10;          --�ݺ��� ���߱� ���� ����
   end loop;
end;
/

---------------------------------for�� ---------------------------------------

begin 
      -- in ���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� �����Ѵ�.
      for n in 1..100 loop      --for �ڿ��� ������ ���� in ���۰� .. ���� �⺻������ 1�� ����
            dbms_output.put_line(n);
      end loop;
end;
/

begin 
      -- in reverse �� �ݴ�� ���� ����
      for n in reverse 1..10 loop      --for �ڿ��� ������ ���� in ���۰� .. ���� �⺻������ 1�� ����
            dbms_output.put_line(n);
      end loop;
end;
/

-------------------------where ���� ���� ���Ƿ� �ݺ������� Ȱ��--------------------

declare 
    vdept dept%rowtype;
begin
    for n in 1..4 loop
    select *
    into vdept
    from dept
    where deptno = 10 * n;      --1���� ������ 10�� 2 ���� 20 3���� 30 4 ���� 40 
    dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
    end loop;
end;
/

-------------------------------while �ݺ���--------------------------------------

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
    where deptno = 10 * n;      --1���� ������ 10�� 2 ���� 20 3���� 30 4 ���� 40 
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


-- ���ǹ� 
-- if then end if;
-- if then else end if;
-- if then elsif then end if;

-- �ݺ���
-- loop end loop;
-- for in loop end loop;
-- while loop end loop;
      

-------------------------------���� ���ν���-------------------------------------
set serveroutput on;
-- ���� ���ν���
-- 1. ����(create)  -> 2. ���� (execute or exec)

--create or replace procedure ���ν����� (�Ű�����)

--is or as
--    ���� ����
--begin
--    SQL
--    ��±���
--   ���ǹ� , �ݺ���
--end;
--/
-- execute ���ν�����;      (����)

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


------------------------------�Ű����� Ȱ���� ���ν���-----------------------------

create or replace procedure del_ename(vename emp01.ename%type)
is
  
begin
   delete from emp01
   where ename = vename;
end;
/

exec del_ename('SCOTT');                
exec del_ename('SMITH');

-- �������ν����� �Ű����� ����
-- in, out, in out
-- in : ���� ���޹޴� �뵵
-- out : ���ν��� ������ ���� ����� ������ ��û�� ������ ����
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
    where empno = vempno;                    --Ư������� ���� ������
    
end;
/

------���ε� ���� ����¹�

variable var_ename varchar2(15);
variable var_sal number;                       
variable var_job varchar2(9);

-- exec sel_empno(7499,:���ε� ����1,:���ε� ����2,:���ε� ����3)    ������տ� : �ٿ��־����             
exec sel_empno(7499,:var_ename,:var_sal,:var_job);

print var_ename;
print var_sal;
print var_job;


-- ��� ������ �����ϴ� ���� ���ν��� ���弼��
-- ���,�̸�,��å,�Ŵ���,�μ�
-- ��� ������ �Ű����� ����ؼ� �޾ƿ´�.

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

-- �����Լ�
-- �����Լ��� ���� ���ν����� ������ : return�� ����
-- 1. ����(create)
-- 2. ����(execute)

--create or replace funcion �Լ���(�Ű�����)
--    RETRUN ���� Ÿ��              -- �����ݷ� ����
--i

--begin
--    RETRUN ���ϰ�;                 --�����ݷ� ���
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
--exec���ʿ� ���ε� ������ �����ؾ� �Ѵ�.
exec :var_res := cal_bonus(7788);       

print :var_res;

drop procedure insertt_sawon;
drop function cal_bonus;

-- Ŀ��

--declare           --���̺� Ÿ���� ���� ����
    --Ŀ�� : select ������ �����ϴ� ����� ����Ų��.
--    CURSOR Ŀ���� IS sql ����(select); --Ŀ������
--begin
--    OPEN Ŀ����;
--    LOOP
--        FECTCH Ŀ���� INTO ������;      --���̺�κ��� �����ͼ� ������ �����ϴ� ��Ȱ
--         exit when Ŀ����%NOTFOUND;
--    END LOOP;                           --END LOOP ���� ���
--    CLOSE Ŀ����;
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

--------------------------for loop�� Ȱ���� Ŀ��-------------------------------

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

--���̵�,�̸�,�̸��� ��, �μ� �̸�

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