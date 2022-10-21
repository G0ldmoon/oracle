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
    
    select *
    from emp_temp;
    
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
     modify empno number(10);
     
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
    -- unique
    -- primary key (�⺻Ű)
    -- foreign key
    -- check 
    
 
   
    
    create table emp04(
    empno number(4) constraint emp04_empno_pk primary key,  -- �⺻Ű : not null + uniqei
    ename varchar(10) constraint emp04_ename_nn not null,
    job varchar(9),
    deptno number(2)
    );
    
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
    
    