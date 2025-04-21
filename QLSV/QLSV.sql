USE master;
GO

CREATE DATABASE QLSV ON 
PRIMARY (
    NAME = QLHH_data,
    FILENAME = 'F:\projects\SQLServerLog\QLSV\QLSV.mdf',
    SIZE = 50MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
)
LOG ON (
    NAME = QLHH_log,
    FILENAME = 'F:\projects\SQLServerLog\QLSV\QLSV.ldf',
    SIZE = 10MB,
    FILEGROWTH = 5MB
);
GO

USE QLSV
GO

CREATE TABLE KHOA
(
	MaKH		CHAR(2),
	TenKH		NVARCHAR(50),
	CONSTRAINT pk_KHOA PRIMARY KEY(MaKH)
)

CREATE TABLE MON
(
	MaMH		CHAR(2),
	TenMH		NVARCHAR(50),
	Sotiet		INT,
	CONSTRAINT pk_MON PRIMARY KEY(MaMH)
)

CREATE TABLE SINHVIEN
(	
	MaSV		CHAR(2),
	HoSV		NVARCHAR(30),
	TenSV		NVARCHAR(20),
	Phai		BIT,
	Ngaysinh	DATETIME,
	NoiSinh		NVARCHAR(50),
	MaKH		CHAR(2),
	Hocbong		REAL,
	CONSTRAINT pk_SINHVIEN PRIMARY KEY(MaSV),
	CONSTRAINT fk_SINHVIEN_MaKH
				FOREIGN KEY(MaKH)
				REFERENCES KHOA(MaKH)
)

CREATE TABLE KETQUA
(
	MaSV		CHAR(2),
	MaMH		CHAR(2),
	Diem		INT,
	CONSTRAINT pk_KETQUA PRIMARY KEY(MaSV, MaMH),
	CONSTRAINT fk_KETQUA_MaSV
				FOREIGN KEY(MaSV)
				REFERENCES SINHVIEN(MaSV),
	CONSTRAINT fk_KETQUA_MaMH
				FOREIGN KEY(MaMH)
				REFERENCES MON(MaMH)
)

INSERT INTO KHOA (MaKH, TenKH) 
VALUES
	('KH', N'Công nghệ thông tin'),
	('KT', N'Kế toán'),
	('NN', N'Ngôn ngữ Anh'),
	('QL', N'Quản lý công'),
	('DL', N'Du lịch'),
	('VL', N'Vật lý');

INSERT INTO MON (MaMH, TenMH, Sotiet) 
VALUES
	('C1', N'Cơ sở dữ liệu', 45),
	('C2', N'Lập trình C++', 60),
	('KT', N'Kế toán tài chính', 50),
	('TA', N'Tiếng Anh giao tiếp', 40),
	('CN', N'Mạng máy tính', 45),
	('QG', N'Quản lý giáo dục', 35),
	('DL', N'Địa lý du lịch', 30),
	('NN', N'Ngữ pháp tiếng Anh', 50);

INSERT INTO SINHVIEN (MaSV, HoSV, TenSV, Phai, Ngaysinh, NoiSinh, MaKH, Hocbong) 
VALUES
	('01', N'Nguyễn Văn', N'An', 1, '2002-05-14', N'Hà Nội', 'KH', 1000),
	('02', N'Trần Thị', N'Bình', 0, '2001-03-22', N'Hồ Chí Minh', 'KT', 500),
	('03', N'Lê Minh', N'Chi', 1, '2002-09-01', N'Đà Nẵng', 'NN', 0),
	('04', N'Phạm Văn', N'Dũng', 0, '2000-12-11', N'Hải Phòng', 'KH', 800),
	('05', N'Hoàng Thị', N'Lan', 0, '2001-06-30', N'Nghệ An', 'DL', 400),
	('06', N'Đỗ Mạnh', N'Hùng', 0, '2002-10-09', N'Nam Định', 'KH', 300),
	('07', N'Bùi Ngọc', N'Quý', 1, '2003-01-19', N'Quảng Ninh', 'QL', 200),
	('08', N'Vũ Thị', N'Yến', 0, '2000-07-07', N'Bắc Giang', 'KT', 600),
	('09', N'Lý Phước', N'Hiếu', 0, '2001-11-23', N'Bình Định', 'NN', 100),
	('10', N'Tống Anh', N'Khoa', 0, '2002-04-12', N'Thái Bình', 'KH', 700),
	('11', N'Tô Văn', N'Hậu', 0, '2002-03-10', N'Hà Giang', 'DL', 0),
	('12', N'Cao Thị', N'Hường', 0, '2001-08-22', N'Lạng Sơn', 'NN', 250),
	('13', N'Lâm Chí', N'Cường', 1, '2000-09-18', N'Cần Thơ', 'KH', 900),
	('14', N'Ngô Tấn', N'Phát', 1, '2003-06-15', N'Vĩnh Long', 'QL', 300),
	('15', N'Trịnh Hữu', N'Khánh', 1, '2002-02-28', N'Tuyên Quang', 'KT', 350),
	('16', N'Đinh Thị', N'Thúy', 0, '2000-10-05', N'Bình Dương', 'NN', 200),
	('17', N'Huỳnh Mai', N'Chiêu', 0, '2001-01-07', N'Kiên Giang', 'DL', 100),
	('18', N'Kiều Văn', N'Trung', 0, '2002-11-11', N'Kon Tum', 'KH', 800),
	('19', N'Mai Quốc', N'Thành', 1, '2001-05-25', N'Ninh Thuận', 'KT', 150),
	('20', N'Châu Thị', N'Hằng', 0, '2000-04-01', N'Đắk Lắk', 'QL', 400),
	('21', N'Nguyễn Thị', N'Hương', 0, '2001-09-20', N'Hà Nội', 'VL', 700),
	('22', N'Phạm Văn', N'Tài', 0, '2000-08-10', N'Hải Dương', 'VL', 500),
	('23', N'Vũ Đức', N'Minh', 0, '2002-11-02', N'Hà Nam', 'VL', 600);

INSERT INTO KETQUA (MaSV, MaMH, Diem) 
VALUES
	('01', 'C1', 8), ('01', 'C2', 9),
	('02', 'KT', 6), ('02', 'TA', 7),
	('03', 'NN', 9), ('03', 'TA', 6),
	('04', 'C1', 7), ('04', 'CN', 8),
	('05', 'DL', 6), ('05', 'TA', 7),
	('06', 'CN', 10), ('06', 'C2', 9),
	('07', 'QG', 7), ('07', 'TA', 6),
	('08', 'KT', 8), ('08', 'C1', 5),
	('09', 'TA', 5), ('09', 'NN', 6),
	('10', 'C1', 9), ('10', 'CN', 7),
	('11', 'DL', 8), ('11', 'QG', 7),
	('12', 'NN', 9), ('12', 'TA', 8),
	('13', 'C2', 10), ('13', 'CN', 9),
	('14', 'QG', 6), ('14', 'KT', 7),
	('15', 'KT', 8), ('15', 'TA', 6),
	('16', 'NN', 8), ('16', 'TA', 7),
	('17', 'DL', 6), ('17', 'TA', 6),
	('18', 'CN', 9), ('18', 'C2', 8),
	('19', 'KT', 7), ('19', 'TA', 5),
	('20', 'QG', 7), ('20', 'DL', 6),
	('21', 'C1', 8), ('21', 'CN', 7),
	('22', 'C1', 6), ('22', 'KT', 5),
	('23', 'CN', 9), ('23', 'C2', 8);

-- 1
SELECT MaMH N'Mã môn học', TenMH N'Tên môn học', Sotiet N'Số tiết'
FROM MON

-- 2
SELECT MaSV N'Mã sinh viên', HoSV N'Họ sinh viên', TenSV N'Tên sinh viên', Hocbong N'Học bổng'
FROM SINHVIEN
ORDER BY MaSV ASC

-- 3
SELECT MaSV N'Mã sinh viên', TenSV N'Tên sinh viên', Phai N'Phái', Ngaysinh N'Ngày sinh'
FROM SINHVIEN
ORDER BY TenSV ASC

-- 4
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên' , CONVERT(DATE, Ngaysinh) N'Ngày sinh', Hocbong N'Học bổng'
FROM SINHVIEN
ORDER BY Ngaysinh ASC, Hocbong DESC;

-- 5
SELECT MaMH N'Mã môn', TenMH N'Tên môn', Sotiet N'Số tiết'
FROM MON
WHERE TenMH LIKE 'T%'

-- 6
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên', CONVERT(DATE, Ngaysinh) N'Ngày sinh', Phai N'Phái'
FROM SINHVIEN
WHERE TenSV LIKE '%i'

-- 7
SELECT MaKH N'Mã khoa', TenKH N'Tên khoa'
FROM KHOA
WHERE TenKH LIKE '_n%'

-- 8
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên'
FROM SINHVIEN
WHERE HoSV LIKE N'%Thị'

