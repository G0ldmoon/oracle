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
from emp
where comm is null and 
job in('CLERK','MANAGER') and 
mgr is not null and 
not ename like '_L%';

-- job = 'CLERK' or job = 'MANAGER'�ص� ��
