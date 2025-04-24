CREATE DATABASE LAB02 ON
PRIMARY (
    NAME = LAB02_data,
    FILENAME = 'F:\projects\SQLServerLog\Lab02\Lab02.mdf'
)
LOG ON (
    NAME = LAB02_log,
    FILENAME = 'F:\projects\SQLServerLog\Lab02\Lab02.ldf'
);
GO

USE LAB02
GO

DECLARE @Name NVARCHAR(100) = N'Quang'
PRINT @Name

DECLARE @Age TINYINT = 20
PRINT @Age

CREATE TABLE Employee
(
	ID			VARCHAR(4) NOT NULL,
	FullName	NVARCHAR(35) NOT NULL,
	Gender		BIT NOT NULL,
	BirthDay	DATETIME NOT NULL,
	Address		NVARCHAR(MAX),
	Email		VARCHAR(100) NOT NULL,
	Salary		FLOAT NOT NULL,
	CONSTRAINT pk_Employee PRIMARY KEY(ID)
)

ALTER TABLE Employee
ADD
	Phone		VARCHAR(20) NOT NULL

GO

INSERT INTO Employee
VALUES
	('NV01', N'Nguyễn Văn A', 1, '1930-01-15', N'Hồ Chí Minh', 'nguyenvana@example.com', 1200000, '0912345678'),
	('NV02', N'Trần Thị B', 0, '1992-03-22', N'Hồ Chí Minh', 'tranthib@example.com', 1050000, '0987654321'),
	('NV03', N'Lê Văn C', 1, '1958-07-09', N'Hà Nội', 'levanc@example.com', 29800000, '0933445566'),
	('NV04', N'Phạm Thị D', 0, '1995-11-30', N'Hà Nội', 'phamthid@example.com', 1100000, '0909123456'),
	('NV05', N'Hoàng Văn E', 1, '1991-05-10', N'Hồ Chí Minh', 'hoangvane@example.com', 1250000, '0978123456'),
	('NV06', N'Võ Thị F', 0, '1993-08-18', N'Hà Nội', 'vothif@example.com', 3990000, '0967123456');
	
SELECT FullName
FROM Employee

SELECT FullName
FROM Employee
WHERE Salary > 2000000

SELECT FullName
FROM Employee
WHERE MONTH(BirthDay) = MONTH(GETDATE());

SELECT FullName, FORMAT(BirthDay, 'dd/MM/yyyy') AS BirthDay
FROM Employee

SELECT FullName
FROM Employee
WHERE Address = N'Hà Nội'

UPDATE Employee
SET FullName = N'John'
WHERE ID = 'NV01'

