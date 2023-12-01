sqlplus shkuropatova/p1P34ab#@185.235.218.67:1521/XEPDB1

CREATE USER shkuropatova IDENTIFIED BY p1P34ab#;
-- GRANT CONNECT, RESOURCE TO student;
GRANT DBA TO shkuropatova;
-- ALTER USER student quota unlimited on USERS;
ALTER USER shkuropatova quota 50M on USERS;