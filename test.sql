--sql 활용 테스트
--
--시험시간 11:00 ~ 11:50
--
--시험 유의 사항
--1. 휴대폰 반납
--2. 시험과 관련없는 물품은 책상위에 두지 마세요.
--3. 컴퓨터 전원을 켜지마세요.
--4. 시험지 답안 제출은 11:50분에 제일 뒤 쪽 학생이 수거후 제출
--5. 시험지마다 이름 기재 할 것
--6. 필기도구는 흑색 또는 청색만 사용할 것

-- 실습준비
-- 1. system/1234 설정
-- github의 CreateUser(scott).bat이용
-- 2. scott/tiger사용자 추가 및 grant
-- github 참고
-- 3. 실습용 테이블 작성
-- test_data_eng.sql 스크립트실행
-- 4. 기본환경설정
-- (SET pages 50)
-- (SET lin 200)
-- (SET sqlprompt "_USER>")
--CREATE TABLE
-- 07.09
-- 10장 sub query

--SELECT deptno1
--FROM student
--WHERE name = 'Anthony Hopkins';

--SELECT * FROM(SELECT * FROM student) WHERE ROWNUM <= 5;
--SELECT * FROM(SELECT * FROM department) WHERE ROWNUM <= 5;
--
--SELECT s.name, d.dname
--FROM student s, department d
--WHERE
--s.deptno1 = (SELECT deptno1
--             FROM student
--             WHERE name = 'Anthony Hopkins')
--AND
--d.deptno = (SELECT deptno1
--            FROM student
--            WHERE name = 'Anthony Hopkins');
SELECT hiredate
FROM professor
WHERE name = 'Meg Ryan';

SELECT p.name p_name, p.hiredate, d.dname d_name
FROM professor p, department d
WHERE
p.hiredate > (SELECT hiredate
              FROM professor
              WHERE name = 'Meg Ryan')
AND         
p.deptno = d.deptno
ORDER BY 2; 

--COL s_name FOR a25
--COL d_name FOR a40
--SELECT s.studno, s.name s_name, d.dname d_name
--FROM student s, department d
--WHERE s.deptno1 = d.deptno;
--SELECT s.name s_name, p.profno, p.name p_name
--FROM student s, professor p
--WHERE s.profno = p.profno;
-- 예제 4
--SELECT s.name s_name, p.name p_name
--FROM student s, professor p
--WHERE
--s.profno = p.profno
--AND
--s.deptno1 = 101;
--COL gname FOR a20
--SELECT * FROM customer;
--SELECT * FROM gift;
--
--SELECT c.gname, TO_CHAR(c.point, '999,999') "Point", g.gname "Gift Name"
--FROM customer c, gift g
--WHERE
----c.point BETWEEN g.g_start AND g.g_end;
--c.point > g.g_start AND c.point < g.g_end; 

--SELECT * FROM(SELECT * FROM student)
--WHERE ROWNUM <= 5;
--
--SELECT * FROM(SELECT * FROM score)
--WHERE ROWNUM <= 5;
--
--SELECT * FROM(SELECT * FROM hakjum)
--WHERE ROWNUM <= 5;
--
--SELECT s.name name, sc.total score, h.grade grade
--FROM student s, score sc, hakjum h
--WHERE
--s.studno = sc.studno
--AND
--sc.total >= h.min_point
--AND
--sc.total < h.max_point;





-- 예제 3
--SELECT
--s.name s_name,
--d.dname d_name,
--p.name p_name
--FROM student s, department d, professor p
--WHERE
--s.deptno1 = d.deptno
--AND
--s.profno = p.profno;



-- 07.08
--SELECT s.studno, s.name, d.dname
--FROM student s, dept d
--WHERE s.deptno1 = d.deptno;

--SELECT CASE
--          WHEN EXISTS (
--               SELECT 1
--               FROM all_users
--               WHERE username = 'SCOTT') THEN 1
--          ELSE 0
--       END
--INTO EXISTS_NUM FROM DUAL;
--
--SELECT *
--FROM (
--     SELECT
--     name,
--     jumin, 
--     CASE SUBSTR(jumin, 7, 1)
--        WHEN '1' THEN 'MAN'
--        ELSE 'WOMAN'
--           --   WHEN '2' THEN 'WOMAN'
--     END "Gender"
--     FROM student
--     )
--WHERE ROWNUM <= 10;

--SELECT
--name,
--jumin, 
--DECODE(SUBSTR(jumin, 7, 1),
--   '1', 'MAN',
--   '2', 'WOMAN') "Gender"
--FROM student;

--SELECT name, jumin,
--   DECODE(SUBSTR(jumin, 7,1),
--          '1', 'MAN',
--          '2', 'WOMAN')

-- 07.07
--COLUMN   id       FORMAT   a10
--COLUMN   position FORMAT   a20
--COLUMN   email    FORMAT   a20
--COLUMN   hpage    FORMAT   a22
--COLUMN   name     FORMAT   a20
--COLUMN   dname    FORMAT   a38

--COLUMN   profno ON FORMAT   99999
--COLUMN   deptno2 ON FORMAT   99999
--COLUMN   deptno1 ON FORMAT   99999
--COLUMN   height ON FORMAT   99999
--COLUMN   weight ON FORMAT   99999
--COLUMN   grade ON FORMAT   99999
--COLUMN   tel ON FORMAT   a13
--COLUMN   name ON FORMAT   a17
--COLUMN   jumin ON FORMAT   a13
--COLUMN   id ON FORMAT   a10



--SELECT name s_name, dname d_name
--FROM student s, department d
--WHERE s.deptno1= (
--              SELECT deptno1
--              FROM student 
--              WHERE name = 'Anthony Hopkins')
--      AND
--      d.deptno = (
--              SELECT deptno1
--              FROM student 
--              WHERE name = 'Anthony Hopkins');

--SELECT name, hiredate, dname
--FROM professor p, department d
--WHERE p.hiredate > (
--     SELECT hiredate
--     FROM professor
--     WHERE name = 'Meg Ryan')
--     AND
--     p.deptno = d.deptno ;

-- 07.06
--COL sun FOR a4
--COL mon FOR a4
--COL tue FOR a4
--COL wed FOR a4
--COL thu FOR a4
--COL fri FOR a4
--COL sat FOR a4
--
--SELECT
-- MAX(DECODE(day, 'SUN', dayno)) SUN
--,MAX(DECODE(day, 'MON', dayno)) MON
--,MAX(DECODE(day, 'TUE', dayno)) TUE
--,MAX(DECODE(day, 'WED', dayno)) WED
--,MAX(DECODE(day, 'THU', dayno)) THU
--,MAX(DECODE(day, 'FRI', dayno)) FRI
--,MAX(DECODE(day, 'SAT', dayno)) SAT
--FROM cal
----WHERE weekno IN(1,2,3,4)
--GROUP BY weekno
--ORDER BY weekno;

--CREATE USER scott IDENTIFIED BY tiger;
--GRANT CONNECT, RESOUCE to scott;
--SET LIN[ESIZE] 200
--SET PAGES[IZE] 50
--COL empno FOR 9999
--COL ename FOR a8
--SELECT DISTINCT deptno FROM emp;
--SELECT ename, hiredate FROM emp WHERE hobby IS NULL;
--SELECT empno, ename, deptno FROM emp WHERE deptno IN(10, 20);
--SELECT empno, ename, sal FROM emp WHERE ename LIKE 'A%';
--SELECT empno, ename, sal FROM emp WHERE empno='&empno';
--SELECT name, tel,
--REPLACE(tel, SUBSTR(tel, INSTR(tel, '-')+1), '****') REPLACE
--FROM student
--WHERE deptno1=101;
--ALTER TABLE emp
--RENAME COLUMN pay to sal;
--CREATE TABLE emp
--AS
--SELECT * FROM emp2;
--SELECT ename, TO_CHAR(sal, '$999,999,999') SAL FROM emp;
--SELECT name, jumin,
--   DECODE(SUBSTR(jumin, 7,1),
--          '1', 'MAN',
--          '2', 'WOMAN')
--FROM student WHERE deptno1 = 101;
--SELECT COUNT(*) FROM emp;
--SELECT MAX(sal), MIN(sal) FROM emp;
--SELECT deptno, AVG(NVL(sal, 0)) "AVG" FROM emp GROUP BY deptno;
--CREATE TABLE member_tbl(
--id VARCHAR2(5) NOT NULL,
--name VARCHAR2(20),
--gender VARCHAR2(3),
--CONSTRAINT member_tbl_pk PRIMARY KEY(id));
--
--CREATE VIEW vStudent
--AS
--SELECT studno, name, id FROM student;
--
--UPDATE student
--SET name='James Hong'
--WHERE name='James Seo';
--
--SELECT ename, tel
--FROM emp
--WHERE sal > (SELECT sal
--             FROM emp
--             WHERE ename = 'Tom Cruise');
-- 07.05



--conn / as SYSDBA
--GRANT CREATE VIEW to scott;
--conn scott/tiger
--
--CREATE OR REPLACE VIEW vStudent
--AS
--SELECT studno, name, id FROM student;
--
--SELECT * FROM vStudent;


--DROP TABLE new_emp1;
--DROP TABLE new_emp2;
--
--CREATE TABLE new_emp2(
--no NUMBER(4) PRIMARY KEY,
--name VARCHAR2(20) NOT NULL,
--jumin VARCHAR2(13) NOT NULL UNIQUE,
--loc_code NUMBER(1) CHECK(loc_code < 5),
--deptno VARCHAR2(6) REFERENCES dept2(dcode));
--
--CREATE TABLE new_emp1(
--no NUMBER(4) CONSTRAINT emp1_no_pk PRIMARY KEY,
--name VARCHAR2(20)
--     CONSTRAINT emp1_name_nn NOT NULL,
--jumin VARCHAR2(13)
--      CONSTRAINT emp1_jumin_nn NOT NULL
--      CONSTRAINT emp1_jumin_nk UNIQUE,
--loc_code NUMBER(1)
--      CONSTRAINT emp1_area_ck CHECK(loc_code < 5),
--deptno VARCHAR2(6)
--      CONSTRAINT emp1_deptno_ck REFERENCES dept2(dcode));
--
--SELECT owner, constraint_name, constraint_type, status
--FROM user_constraints
--WHERE table_name='NEW_EMP1';
--SELECT owner, constraint_name, constraint_type, status
--FROM user_constraints
--WHERE table_name='NEW_EMP2';


--CREATE TABLE users(
--id NUMBER CONSTRAINT pk_id PRIMARY KEY
--name VARCHAR2(50));

--DROP TABLE projects;
--DROP TABLE users;
--
--CREATE TABLE users(
--id NUMBER,
--user_name VARCHAR2(50) CONSTRAINT uk_users_user_name NOT NUll UNIQUE,
--gender CHAR,
--CONSTRAINT ck_users_gender CHECK(gender IN('M', 'F')),
--CONSTRAINT pk_users_id PRIMARY KEY(id));
--
--INSERT INTO users VALUES(1, 'Peter', 'M');
--INSERT INTO users VALUES(2, 'Danny', 'M');
--
--CREATE TABLE projects(
--id NUMBER,
--prj_name VARCHAR2(50) UNIQUE,
--creator VARCHAR2(50),
--CONSTRAINT fk_projects_creator
--FOREIGN KEY(creator)
--REFERENCES users(user_name));
--
--SELECT owner, constraint_name, constraint_type, status
--FROM user_constraints
--WHERE table_name='USERS';
--
--SELECT owner, constraint_name, constraint_type, status
--FROM user_constraints
--WHERE table_name='PROJECTS';

-- 07.02
--SELECT name,
--REGEXP_SUBSTR(hpage, '/([[:alnum:]]+\.?){3,4}?') "URL"
--FROM professor
--WHERE hpage IS NOT NULL;

--SELECT name, LTRIM(REGEXP_SUBSTR(hpage, '/([[:alnum:]]+\.?){3,4}?'), '/') "URL"
--FROM professor
--WHERE hpage IS NOT NULL;


--SELECT REGEXP_REPLACE('20141023',
--'([[:digit:]]{4})([[:digit:]]{2})([[:digit:]]{2})',
--'\1-\2-\3')
--FROM dual;

--SELECT
--REGEXP_REPLACE('aaa bbb', '( ){2,}', '*') "One",
--REGEXP_REPLACE('aaa  bbb', '( ){2,}', '*') "Two",
--REGEXP_REPLACE('aaa   bbb', '( ){2,}', '*') "Three"
--FROM dual;

--SELECT no, ip,
--REGEXP_REPLACE(ip, '\.', '/',1,2) "REPLACE"
--FROM t_reg2;

--SELECT no, ip,
--REGEXP_REPLACE(ip, '\.', '') "Dot Remove"
--FROM t_reg2;

--SELECT name, tel
--FROM student
--WHERE REGEXP_LIKE(tel, '^[0-9]{2}\)[0-9]{4}');

-- CASE문 연습문제
--SELECT empno, ename, sal/10000,
--CASE
--  WHEN sal/10000 < 1000 THEN 'Level 1'
--  WHEN sal/10000 < 2000 THEN 'Level 2'
--  WHEN sal/10000 < 3000 THEN 'Level 3'
--  WHEN sal/10000 < 4000 THEN 'Level 4'
--  WHEN sal/10000 < 4000 THEN 'Level 4'
--  ELSE 'Level 5'
--END "Level"
--FROM emp
--ORDER BY 3;


-- '='이 아닌경우 
--SELECT name, SUBSTR(jumin, 3, 2) "Month",
--CASE WHEN SUBSTR(jumin, 3, 2) BETWEEN '01' AND '03' THEN '1/4'
--     WHEN SUBSTR(jumin, 3, 2) BETWEEN '04' AND '06' THEN '2/4'
--     WHEN SUBSTR(jumin, 3, 2) BETWEEN '07' AND '09' THEN '3/4'
--     WHEN SUBSTR(jumin, 3, 2) BETWEEN '10' AND '12' THEN '4/4'
--END "Quater"
--FROM student
--ORDER BY 2;

-- '=' 예제
--SELECT name, tel,
--CASE SUBSTR(tel, 1, INSTR(tel, ')')-1)
--     WHEN '02' THEN 'Seoul'
--     WHEN '031' THEN 'Gyunggido'
--     WHEN '051' THEN 'Busan'
--     WHEN '052' THEN 'Ulsan'
--     WHEN '055' THEN 'Gyungnam'
--     ELSE 'Etc'
--END "Loc"
--FROM student
--WHERE deptno1=201;

--SELECT tel, 
--SUBSTR(tel, 1, INSTR(tel, ')')-1) "Loc"
--FROM student
--WHERE deptno1=201;

-- 07.01
-- Ch2. Quiz 2
--SELECT name, tel,
--DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1),
--        '02' , 'Seoul',
--        '031', 'Gyungi',
--        '051', 'Busan',
--        '052', 'Ulsan',
--        '055', 'Gyungnam')
--"LOC"
--FROM student
--WHERE deptno1=101;

--SELECT deptno, name,
--DECODE(deptno, 101, 'ComputerEngineering',
--               102, 'Multimedia Engineering',
--               103, 'Software Engineering',
--               'Etc') "DNAME"
--FROM professor;

-- Ch2. Quiz 1
--SELECT name, jumin,
--DECODE(SUBSTR(jumin, 7,1), 1, 'Man', 'Woman')
--FROM student
--WHERE deptno1=101;

-- Case 6
--SELECT deptno, name,
--DECODE(deptno,
--  101,
--  DECODE(name,
--    'Audie Murphy',
--    'Best!',
--    'Good!'
--  ),
--  'N/A'
--) "ETC"
--FROM professor;

-- Case 5
--SELECT deptno, name,
--DECODE(deptno,
--  101,
--  DECODE(name,
--    'Audie Murphy',
--    'Best!',
--    'Good!')) "ETC"
--FROM professor;

-- Case 4
--SELECT deptno, name,
--DECODE(deptno,
--  101,
--  DECODE(name,
--    'Audie Murphy',
--    'BEST!')) "ETC"
--FROM professor;

--SELECT deptno, name,
--DECODE(deptno, 101, 'ComputerEngineering',
--               102, 'Multimedia Engineering',
--               103, 'Software Engineering',
--               'Etc') "DNAME"
--FROM professor;

--SELECT
--empno, ename,
--TO_CHAR(hiredate, 'YYYY-MM-DD') "hd",
--TO_CHAR(sal*1.2, '$9,999,999,999') "sal",
--TO_CHAR(sal*1.15, '$9,999,999,999') "15% up"
--FROM emp
--WHERE comm IS NOT NULL;

--SELECT
--name, pay, NVL(bonus, 0),
--TO_CHAR(pay*12+NVL(bonus,0),'999,999,999') "TOTAL"
--FROM professor
--WHERE deptno=201;

-- Add a new column
--ALTER TABLE emp
--ADD (comm NUMBER DEFAULT 0.03);

-- Delete a column
--ALTER TABLE emp
--DROP COLUMN comm;

--SELECT empno, ename, hiredate, 
--TO_CHAR(hiredate, 'MM') AS "BM"
--FROM emp
--WHERE
--TO_CHAR(hiredate, 'MM') in (1, 2, 3)
--ORDER BY BM;
--TO_CHAR(hiredate, 'MM') in ('01', '02', '03');

--ALTER TABLE emp
--RENAME COLUMN name to ename;
--
--ALTER TABLE emp
--RENAME COLUMN birthday to hiredate;

--SELECT studno, name, birthday
--FROM student
--WHERE
--MOD(TO_CHAR(birthday, 'YY'), 2)=0
--AND
--MOD(TO_CHAR(birthday, 'MM'), 2)=0
--AND
--MOD(TO_CHAR(birthday, 'DD'), 2)=0;

--SELECT SYSDATE,
--TO_CHAR(SYSDATE, 'YYYY') "YYYY",
--TO_CHAR(SYSDATE, 'RRRR') "RRRR",
--TO_CHAR(SYSDATE, 'YY') "YY",
--TO_CHAR(SYSDATE, 'RR') "RR",
--TO_CHAR(SYSDATE, 'YEAR') "YEAR"
--FROM dual;
--
--SELECT SYSDATE,
--TO_CHAR(SYSDATE, 'MM') "MM",
--TO_CHAR(SYSDATE, 'MON') "MON",
--TO_CHAR(SYSDATE, 'MONTH') "MONTH"
--FROM dual;
--
--SELECT SYSDATE,
--TO_CHAR(SYSDATE, 'DD') "DD",
--TO_CHAR(SYSDATE, 'DAY') "DAY",
--TO_CHAR(SYSDATE, 'DDTH') "DDTH"
--FROM dual;
--
--SELECT SYSDATE,
--TO_CHAR(SYSDATE, 'RRRR-MM-DD:HH24:MI:SS')
--FROM dual;

-- Quiz 3
--SELECT
--tel,
--REPLACE(
--  tel,
--  SUBSTR(
--    tel,
--    INSTR(tel, ')'),
--    INSTR(tel,'-')-INSTR(tel, ')')+1),
--  '****'
--)
--AS "ST"
--FROM student;

-- Quiz 4
-- Sol 1
--SELECT
--tel "TEL1",
--REPLACE(
--  tel,
--  SUBSTR(tel, INSTR(tel, '-')+1),
--  '****'
--)
--AS "TEL2"
--FROM student;

-- Sol 2
--SELECT
--tel,
--RPAD(
--  SUBSTR(tel, 1, INSTR(tel, '-')),
--  LENGTH(tel),
--  '****'
--) "SUB_TEL"
--FROM student;


--SELECT REPLACE('Hello World', 'World', 'Peter') FROM dual;
--SELECT SUBSTR('Hello World', 7) FROM dual;
--SELECT SUBSTR('Hello World', 7, 2) FROM dual;
--SELECT INSTR('Hello World', 'W') FROM dual;

--CTAS Create Table As...
--DROP TABLE t0;
--CREATE TABLE emp
--AS
--SELECT * FROM emp2;
--
--ALTER TABLE emp RENAME COLUMN name to ename;
--
--CREATE TABLE t0
--AS
--SELECT
--ename,
--SUBSTR(ename, 1, INSTR(ename, ' ')-1) fName,
--SUBSTR(ename, INSTR(ename, ' '),
--LENGTH(ename)-INSTR(ename, ' ')) lName
--FROM emp;

--SELECT
--RPAD(fName, 10, SUBSTR('123456789', LENGTH(fName), 10-LENGTH(fName)))
--FROM t0;

--SELECT
--RPAD(fName, 10, SUBSTR('123456789', LENGTH(fName)))
--FROM t0;

--SELECT * FROM t0;
---- [L|R]TRIM
--SELECT
--ename,
--LTRIM(ename, 'A') "LTRIM",
--RTRIM(ename, 'o') "RTRIM"
--FROM emp
--WHERE deptno=1000;

---- REPLACE
--SELECT
--name,
--jumin,
--REPLACE(jumin, SUBSTR(jumin, 7), '-/-/-/-') "REPLACE"
--FROM student;

--COL ename FOR a15
--COL replace FOR a15
--COL substr FOR a15
--
--SELECT
--ename, SUBSTR(ename, 2,4) "SUBSTR",
--REPLACE(ename, SUBSTR(ename, 2,4), '----') "REPLACE"
--FROM emp;




