-- 데이터베이스 생성 및 설정
CREATE SCHEMA IF NOT EXISTS `krampoline` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON krampoline.* TO 'root'@'%';
FLUSH PRIVILEGES;

-- 사용할 데이터베이스 선택
USE `krampoline`;

-- resume 테이블 생성
CREATE TABLE IF NOT EXISTS resume (
    id INT AUTO_INCREMENT PRIMARY KEY
);

-- skill 테이블 생성
CREATE TABLE IF NOT EXISTS skill (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resume_id INT,
    skill_title VARCHAR(100),
    skill_content TEXT,
    FOREIGN KEY (resume_id) REFERENCES resume(id)
);

-- project 테이블 생성
CREATE TABLE IF NOT EXISTS project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resume_id INT,
    project_title VARCHAR(100),
    project_content TEXT,
    project_period VARCHAR(100),
    is_current BOOLEAN,
    FOREIGN KEY (resume_id) REFERENCES resume(id)
);
