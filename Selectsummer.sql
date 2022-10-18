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