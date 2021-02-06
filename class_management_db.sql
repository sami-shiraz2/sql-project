
--
-- Database: class management
--

-- --------------------------------------------------------

--
-- Table structure for table academicprogram_dim
--
Create database dwh_project

CREATE TABLE academicprogram_dim (
  AcademicProgramID int primary key,
  Name varchar(100) NOT NULL,
  Description varchar(100) NOT NULL
)
go

--
-- Dumping data for table academicprogram_dim
--

INSERT INTO academicprogram_dim (AcademicProgramID, Name, Description) VALUES
(1, 'BE', 'Bachelor Of Enginering'),
(2, 'BS', 'Bachelor Of Science'),
(3, 'ME', 'Masters Of Engineering'),
(4,'MSc', 'Masters Of Science'),
(5, 'BA', 'Bachelor of Arts'),
(6, 'MA', 'Masters of Arts'),
(7, 'BBA', 'Bachelors of Business Administration'),
(8, 'MBA', 'Master of Business Administration');
go
-- --------------------------------------------------------

--
-- Table structure for table answer_dim
--

CREATE TABLE answer_dim (
  answer_id int primary key identity,
  question_id int NOT NULL,
  answer varchar(255) NOT NULL
)
Go
--
-- Dumping data for table answer_dim
--

INSERT INTO answer_dim (question_id, answer) VALUES
( 1, ' In Strong AI the machine actually has a mind of its own and can take decisions but in Weak AI, the machine can just simulate the human behavior.'),
( 6, 'Java Virtual machine & Java run time environment'),
( 3, 'It act as a persistent layer between Object of class and db entity'),
( 8, 'Java Database connectivity'),
( 4, 'Software Requirement Specification'),
( 2, 'Data Structure and Algorithms');
go

-- --------------------------------------------------------

--
-- Table structure for table class_dim
--

CREATE TABLE class_dim (
  class_id int primary key identity,
  class_name varchar(255) NOT NULL,
  teacher_id int NOT NULL
);
go

--
-- Dumping data for table class_dim
--

INSERT INTO class_dim (class_name, teacher_id) VALUES
('Artificial Intelligence', 1),
('Computer Network', 2),
('Data Structure & Algorithms', 1),
('Dataware house', 4),
('Java', 5),
('Java Script', 6),
('Python', 10),
('Microprocessor', 9),
('Android Development', 7),
('Introduction to Software Engineering', 8);
go
-- --------------------------------------------------------

--
-- Table structure for table date_dim
--

CREATE TABLE date_dim (
  dateId int primary key identity,
  date date NOT NULL,
  month varchar(30) NOT NULL,
  year varchar(30) NOT NULL
);
go
--
-- Dumping data for table date_dim
--

INSERT INTO date_dim (date, month, year) VALUES
('2016-10-01', '01', '2016'),
('2015-01-11', '11', '2015'),
('2016-01-11', '11', '2016'),
('2015-01-01', '01', '2015'),
('2017-01-01', '01', '2017'),
('2017-01-11', '11', '2017'),
('2018-01-01', '01', '2018'),
('2018-01-11', '11', '2018'),
('2019-01-01', '01', '2019'),
('2019-01-11', '11', '2019');
go
-- --------------------------------------------------------

--
-- Table structure for table placeoforigin_dim
--

CREATE TABLE placeoforigin_dim (
  placeOfOriginid int primary key,
  city varchar(30) NOT NULL,
  country varchar(30) NOT NULL
);
go
--
-- Dumping data for table placeoforigin_dim
--

INSERT INTO placeoforigin_dim (placeOfOriginid, city, country) VALUES
(1, 'karachi', 'Pakistan'),
(2, 'Lahore', 'Pakistan'),
(3, 'Islamabad', 'Pakistan'),
(4, 'Hyderabad', 'Pakistan'),
(5, 'London', 'United Kingdom'),
(6, 'Bristol', 'United Kingdom'),
(7, 'Leeds', 'United Kingdom'),
(8, 'Glasgow ', 'United Kingdom'),
(9, 'Mirpurkhas', 'Pakistan'),
(10, 'Umerkot', 'Pakistan');
go
-- --------------------------------------------------------

--
-- Table structure for table question_dim
--

CREATE TABLE question_dim (
  question_id int primary key identity,
  question_desc varchar(255) NOT NULL,
  class_id int NOT NULL,
  student_id int NOT NULL,
  status varchar(255) NOT NULL
);
go
--
-- Dumping data for table question_dim
--

INSERT INTO question_dim (question_desc, class_id, student_id, status) VALUES
('Difference between week and strong AI?', 1, 2, 'read'),
('DSA stand for?', 3, 2, 'read'),
('Hibernate means?', 1, 2, 'read'),
('SRS stands for??', 1, 2, 'read'),
('Android Life Cycle means?', 9, 11, 'unread'),
('JVM vs JRE?', 5, 6, 'unread'),
('garbbage collection means?', 5, 6, 'read'),
('JDBC means?', 5, 6, 'unread');
go
-- --------------------------------------------------------

--
-- Table structure for table student_assessment_dim
--

CREATE TABLE student_assessment_dim (
  assessment_id int primary key,
  class_id int NOT NULL,
  student_id int NOT NULL,
  obtained_marks int NOT NULL,
  marks_status varchar(255) NOT NULL
);
go
--
-- Dumping data for table student_assessment_dim
--

INSERT INTO student_assessment_dim (assessment_id, class_id, student_id, obtained_marks, marks_status) VALUES
(1, 1, 1, 20, 'Mid'),
(2, 1, 2, 5, 'Quiz'),
(3, 3, 9, 2, 'Assignment'),
(4, 1, 1, 10, 'Attendance'),
(5, 1, 2, 5, 'test'),
(6, 1, 1, 5, 'Quiz'),
(7, 1, 1, 60, 'Exams'),
(8, 1, 2, 10, 'Mid'),
(9, 3, 9, 20, 'Mid'),
(10, 3, 9, 60, 'Exams');
go
-- --------------------------------------------------------

--
-- Table structure for Fact table student_fact
--

CREATE TABLE student_fact (
  student_id int primary key,
  roll_number varchar(255) NOT NULL,
  class_id int NOT NULL,
  dateId int NOT NULL,
  academicProgramId int NOT NULL,
  PlaceOfOriginId int NOT NULL,
  question_id int NOT NULL,
  answer_id int NOT NULL,
  assessment_id int NOT NULL
);
go
--
-- Dumping data for Fact table student_fact
--

INSERT INTO student_fact (student_id, roll_number, class_id, dateId, academicProgramId, PlaceOfOriginId, question_id, answer_id, assessment_id) VALUES
(1, 'F16SW14', 1, 1, 1, 1, 1, 1, 9),
(2, 'F16SW17', 4, 2, 4, 2, 2, 4, 5),
(3, 'F16SW27', 5, 3, 1, 3, 1, 2, 8),
(4, 'F16SW158', 6, 2, 2, 5, 3, 5, 10),
(5, 'F16SW57', 2, 1, 2, 7, 7, 3, 7),
(6, 'F16SW45', 5, 3, 2, 9, 4, 2, 6),
(7, 'F16SW55', 6, 4, 4, 10, 7, 4, 4),
(8, '17SW01', 7, 6, 3, 2, 5, 5, 5),
(9, '17SW03', 3, 5, 2, 8, 8, 3, 2),
(10, '17SW05', 8, 8, 1, 6, 6, 1, 3),
(11, '17SW07', 9, 7, 3, 4, 2, 4, 1);
go

--
-------------Add Relation between FACT TABLE and DIMENSION TABLES----------------------------
--

-- Relation between FACT and student_assessment_dim
ALTER TABLE student_fact ADD CONSTRAINT fK_st_assessment FOREIGN KEY (assessment_id) REFERENCES student_assessment_dim (assessment_id);

-- Relation between FACT and academicprogram_dim
ALTER TABLE student_fact ADD CONSTRAINT fk_st_academicprogram FOREIGN KEY (academicProgramId) REFERENCES academicprogram_dim (AcademicProgramID);

-- Relation between FACT and answer_dim
ALTER TABLE student_fact ADD CONSTRAINT fk_st_answer FOREIGN KEY (answer_id) REFERENCES answer_dim (answer_id);

-- Relation between FACT and date_dim
ALTER TABLE student_fact  ADD CONSTRAINT fk_st_date FOREIGN KEY (dateId) REFERENCES date_dim (dateId);

-- Relation between FACT and placeoforigin_dim
ALTER TABLE student_fact  ADD CONSTRAINT fk_st_placeOfOrigin FOREIGN KEY (PlaceOfOriginId) REFERENCES placeoforigin_dim (placeOfOriginid);

-- Relation between FACT and question_dim
ALTER TABLE student_fact  ADD CONSTRAINT fk_st_question FOREIGN KEY (question_id) REFERENCES question_dim (question_id);

-- Relation between FACT and class_dim
ALTER TABLE student_fact  ADD CONSTRAINT student_fact_ibfk_1 FOREIGN KEY (class_id) REFERENCES class_dim (class_id);
go

select * from date_dim
select * from academicprogram_dim
select * from question_dim
select * from answer_dim
select * from class_dim
select * from student_assessment_dim
select * from placeoforigin_dim
select * from student_fact