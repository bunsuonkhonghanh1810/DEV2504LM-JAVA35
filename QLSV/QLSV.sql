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
	MaSV		CHAR(3),
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
	MaSV		CHAR(3),
	MaMH		CHAR(2),
	Diem		FLOAT,
	CONSTRAINT pk_KETQUA PRIMARY KEY(MaSV, MaMH),
	CONSTRAINT fk_KETQUA_MaSV
				FOREIGN KEY(MaSV)
				REFERENCES SINHVIEN(MaSV),
	CONSTRAINT fk_KETQUA_MaMH
				FOREIGN KEY(MaMH)
				REFERENCES MON(MaMH)
)

INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'AV', N'Anh Văn')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'DT', N'Điện tử')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'KT', N'Kế toán')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'TH', N'Tin học')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'TR', N'Triết')

INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'01', N'Cơ sở dữ liệu', 45)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'02', N'Trí tuệ nhân tạo', 45)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'03', N'Toán rời rạc ứng dụng', 45)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'04', N'Đồ họa ứng dụng', 60)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'05', N'Tiếng Anh cơ bản', 60)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'06', N'Tin học văn phòng', 60)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'07', N'Pháp luật đại cương', 30)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'08', N'Anh chuyên Ngành', 45)
INSERT [dbo].MON ([MaMH], [TenMH], [Sotiet]) VALUES (N'09', N'PTTK Hệ thống', 60)

INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A01', N'Nguyễn Thị', N'Vân', 0, CAST(N'1986-02-23T00:00:00' AS SmallDateTime), N'Hà Giang', N'KT', 130000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A02', N'Trần Văn', N'Chính', 0, CAST(N'1994-12-20T00:00:00' AS SmallDateTime), N'Bình Định', N'TH', 150000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A03', N'Lê Thu Bạch', N'Yến', 1, CAST(N'1993-02-21T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TH', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A04', N'Trần Anh', N'Tuấn', 0, CAST(N'1987-12-20T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 80000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A10', N'Trần Thị', N'Mai', 1, CAST(N'1994-10-04T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A11', N'Nguyễn Thành', N'Nam', 0, CAST(N'2000-01-01T00:00:00' AS SmallDateTime), N'Cà Mau', N'AV', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A12', N'Nguyễn Quang', N'Quyền', 0, CAST(N'2001-01-01T00:00:00' AS SmallDateTime), N'Đồng Nai', N'DT', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B01', N'Hoàng Thanh', N'Mai', 1, CAST(N'1992-08-12T00:00:00' AS SmallDateTime), N'Hải Phòng', N'TR', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B02', N'Trần Thị Thu', N'Thủy', 1, CAST(N'1990-01-02T00:00:00' AS SmallDateTime), N'Tp. HCM', N'AV', 80000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B03', N'Đố Văn', N'Lâm', 0, CAST(N'1994-02-26T00:00:00' AS SmallDateTime), N'Bình Định', N'TR', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B04', N'Bùi Kim', N'Dung', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hµ Néi', N'TH', 170000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'C01', N'Hà Quang', N'Anh', 0, CAST(N'1985-03-11T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TR', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'C03', N'Lê Quang', N'Lưu', 0, CAST(N'1985-02-23T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'T03', N'Hoàng Thị Hải', N'Yến', 1, CAST(N'1989-09-10T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 170000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'T06', N'Nguyễn Văn', N'Thắng', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 1500000)

INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'01', 3)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'02', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'03', 5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'04', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'05', 3.9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'01', 4.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'05', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'08', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'01', 2)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'03', 2.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'04', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'02', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'03', 10)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'04', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'08', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'01', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'03', 2.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'04', 4)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'02', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'04', 10)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'08', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'01', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'04', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'01', 3)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'03', 2)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'04', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'05', 5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'06', 6)


-- BÀI 1 --

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
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên', CONVERT(DATE, Ngaysinh) N'Ngày sinh', Hocbong N'Học bổng'
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

-- 9
SELECT MaSV N'Mã sinh viên', HoSV + ' ' + TenSV N'Họ và tên sinh viên', Phai N'Phái', Hocbong N'Học bổng'
FROM SINHVIEN
WHERE TenSV LIKE N'[a-m]%'

-- 10
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên', CONVERT(DATE, Ngaysinh) N'Ngày sinh', NoiSinh N'Nơi sinh', Hocbong N'Học bổng'
FROM SINHVIEN   
WHERE TenSV LIKE N'%[a-m]%'
ORDER BY HoSV + ' ' + TenSV ASC

-- 11
SELECT MaSV N'Mã sinh viên', HoSV + ' ' + TenSV N'Họ và tên sinh viên', CONVERT(DATE, Ngaysinh) N'Ngày sinh', MaKH N'Mã khoa'
FROM SINHVIEN
WHERE MaKH = 'NN'

-- 12
SELECT MaSV N'Mã sinh viên', HoSV + ' ' + TenSV N'Họ và tên sinh viên', CONVERT(DATE, Ngaysinh) N'Ngày sinh'
FROM SINHVIEN
WHERE MaKH = 'VL'
ORDER BY Ngaysinh DESC

-- 13
SELECT MaSV N'Mã sinh viên', HoSV + ' ' + TenSV N'Họ và tên sinh viên', MaKH N'Mã khoa', Hocbong N'Học bổng'
FROM SINHVIEN
WHERE Hocbong > 500
ORDER BY MaSV DESC

-- 14
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên', MaKH N'Mã khoa', Hocbong N'Học bổng'
FROM SINHVIEN
WHERE CONVERT(DATETIME, '19871220') = Ngaysinh

-- 15


-- 16
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên', MaKH N'Mã khoa', NoiSinh N'Nơi sinh', Hocbong N'Học bổng'
FROM SINHVIEN
WHERE	Hocbong > 100
	AND	NoiSinh = N'Hồ Chí Minh'

-- 17
SELECT MaSV N'Mã sinh viên', MaKH N'Mã khoa', Phai N'Phái'
FROM SINHVIEN
WHERE	MaKH = 'NN'
	OR	MaKH = 'TR'

-- 18


-- 19
SELECT MaSV N'Mã sinh viên', CONVERT(DATE, Ngaysinh) N'Ngày sinh', Phai N'Phái', MaKH N'Mã khoa'
FROM SINHVIEN
WHERE Hocbong BETWEEN 200 AND 800

-- 20
SELECT MaMH N'Mã môn học', TenMH N'Tên môn học', Sotiet N'Số tiết'
FROM MON
WHERE Sotiet BETWEEN 40 AND 60

-- 21
SELECT MaSV N'Mã sinh viên', HoSV + ' ' + TenSV N'Họ và tên sinh viên', Phai N'Phái'
FROM SINHVIEN
WHERE	Phai = 1
	AND	MaKH = 'NN'

-- 22

-- 23
SELECT HoSV + ' ' + TenSV N'Họ và tên sinh viên'
FROM SINHVIEN
WHERE	TenSV LIKE N'%n%'
	AND Phai = 0

-- 24

-- 25
SELECT 
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
    IIF(Phai = 1, N'Nam', N'Nữ') AS N'Giới tính',
	CONVERT(DATE, Ngaysinh) N'Ngày sinh'
FROM SINHVIEN;

-- 26
SELECT 
	MaSV N'Mã sinh viên',
	(YEAR(GETDATE()) - YEAR(Ngaysinh)) N'Tuổi',
	NoiSinh N'Nơi sính',
	MaKH N'Mã khoa'
FROM SINHVIEN

-- 27
SELECT 
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	(YEAR(GETDATE()) - YEAR(Ngaysinh)) N'Tuổi',
	Hocbong N'Học bổng'
FROM SINHVIEN
WHERE (YEAR(GETDATE()) - YEAR(Ngaysinh)) > 20;

-- 28
SELECT 
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	(YEAR(GETDATE()) - YEAR(Ngaysinh)) N'Tuổi',
	TenKH N'Tên khoa'
FROM SINHVIEN 
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
WHERE (YEAR(GETDATE()) - YEAR(Ngaysinh)) BETWEEN 20 AND 30;


-- BÀI 2 --

-- 1
SELECT 
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	IIF(Phai = 1, N'Nam', N'Nữ') AS N'Giới tính',
	(YEAR(GETDATE()) - YEAR(Ngaysinh)) N'Tuổi',
	MaKH N'Mã khoa'
FROM SINHVIEN 
ORDER BY (YEAR(GETDATE()) - YEAR(Ngaysinh)) DESC

-- 2
SELECT 
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	Phai N'Phái',
	DAY(Ngaysinh) N'Ngày sinh'
FROM SINHVIEN
WHERE	MONTH(Ngaysinh) = 2
	AND YEAR(Ngaysinh) = 1994

-- 3
SELECT 
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	Phai N'Phái',
	DAY(Ngaysinh) N'Ngày sinh'
FROM SINHVIEN
WHERE	MONTH(Ngaysinh) = 2
	AND YEAR(Ngaysinh) = 1994
ORDER BY DAY(Ngaysinh) DESC

-- 4
SELECT 
	MaSV N'Mã sinh viên',
	Phai N'Phái',
	MaKH N'Mã khoa',
	IIF(Hocbong > 500, N'Học bổng cao', N'Mức trung bình') N'Mức học bổng'
FROM SINHVIEN

-- 5
SELECT 
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	MaMH N'Mã môn học',
	Diem N'Điểm'
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
ORDER BY HoSV + ' ' + TenSV ASC, MaMH ASC

-- 6
SELECT
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	IIF(Phai = 1, N'Nam', N'Nữ') N'Giới tính',
	TenKH N'Tên khoa'
FROM SINHVIEN
JOIN KHOA ON SINHVIEN.MaKH =  KHOA.MaKH
WHERE TenKH = N'Ngôn ngữ Anh'

-- 7
SELECT
	TenKH N'Tên khoa',
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	TenMH N'Tên môn học',
	Sotiet N'Số tiết',
	Diem N'Điểm'
FROM ((SINHVIEN JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV)
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH)
JOIN MON ON KETQUA.MaMH = MON.MaMH
WHERE TenKH = N'Công nghệ thông tin'

-- 8
SELECT
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	MaKH N'Mã khoa',
	TenMH N'Tên môn học',
	Diem N'Điểm thi',
    IIF(Diem > 8, N'Giỏi', IIF(Diem >= 6, N'Khá', N'Trung bình')) AS N'Xếp loại'
FROM ((SINHVIEN JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV)
JOIN MON ON KETQUA.MaMH = MON.MaMH)


-- BÀI 3 --

-- 1
SELECT
	KETQUA.MaMH N'Mã môn',
	TenMH N'Tên môn',
	AVG(Diem) N'Trung bình điểm thi'
FROM KETQUA 
JOIN MON ON KETQUA.MaMH = MON.MaMH
GROUP BY KETQUA.MaMH, TenMH

-- 2
SELECT
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	TenKH N'Tên khoa',
	COUNT(MaMH) N'Số môn thi'
FROM (SINHVIEN JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV)
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
GROUP BY HoSV + ' ' + TenSV, TenKH

-- 3
SELECT
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	TenKH N'Tên khoa',
	Phai N'Phái',
	SUM(Diem) N'Tổng điểm thi'
FROM (SINHVIEN JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV)
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
GROUP BY HoSV + ' ' + TenSV, TenKH, Phai

-- 4
SELECT
	TenKH N'Tên khoa',
	COUNT(MaSV) N'Tổng số sinh viên'
FROM SINHVIEN
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
GROUP BY TenKH

-- 5
SELECT
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	MAX(Diem) N'Điểm'
FROM SINHVIEN 
JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
GROUP BY HoSV + ' ' + TenSV


-- BÀI 4 --

-- 1
DECLARE @KhoaCanTim VARCHAR(2) = 'AV'

SELECT
	MaSV N'Mã sinh viên',
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	IIF(Phai = 0, N'Nam', N'Nữ') N'Giới tính',
	TenKH N'Tên khoa'
FROM SINHVIEN
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
WHERE SINHVIEN.MaKH = @KhoaCanTim

-- 2
DECLARE @DiemNhapVao FLOAT = 4

SELECT
	SINHVIEN.MaSV N'Mã sinh viên',
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	TenMH N'Tên môn',
	Diem N'Điểm'
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
JOIN MON ON KETQUA.MaMH = MON.MaMH
WHERE MON.TenMH = N'Cơ sở dữ liệu'
	AND Diem > @DiemNhapVao

-- 3
DECLARE @MonCanXem NVARCHAR(30) = N'Toán rời rạc ứng dụng'

SELECT
	SINHVIEN.MaSV N'Mã sinh viên',
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	TenMH N'Tên môn',
	Diem N'Điểm'
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
JOIN MON ON KETQUA.MaMH = MON.MaMH
WHERE MON.TenMH = @MonCanXem


-- BÀI 5 --

-- 1
SELECT 
	TTSV.MaSV N'Mã sinh viên',
	TTSV.MaKH N'Mã khoa',
	TTSV.Phai N'Phái'
FROM
(	
	SELECT
		SINHVIEN.MaSV,
		MaKH,
		Phai,
		COUNT(Diem) SoLanThi
	FROM SINHVIEN
	LEFT JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
	GROUP BY SINHVIEN.MaSV, MaKH, Phai
) TTSV
WHERE TTSV.SoLanThi = 0

-- 2
SELECT
	MaSV N'Mã sinh viên',
	HoSV + ' ' + TenSV AS N'Họ và tên sinh viên',
	MaKH N'Mã khoa'
FROM SINHVIEN
WHERE MaSV NOT IN
(
	SELECT
		SINHVIEN.MaSV
	FROM (SINHVIEN JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV)
		JOIN MON ON KETQUA.MaMH = MON.MaMH
	WHERE TenMH = N'Cơ sở dữ liệu'
)

-- 3
SELECT
	MaMH N'Mã môn',
	TenMH N'Tên môn',
	Sotiet N'Số tiết'
FROM MON
WHERE MaMH NOT IN (SELECT MaMH FROM KETQUA)

-- 4
SELECT * FROM KHOA
WHERE MaKH NOT IN (SELECT MaKH FROM SINHVIEN)

-- 5
SELECT
	*
FROM SINHVIEN 
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
WHERE	TenKH = N'Anh văn'
	AND MaSV NOT IN 
	(
		SELECT
			MaSV
		FROM KETQUA 
		JOIN MON ON KETQUA.MaMH = MON.MaMH
		WHERE TenMH = N'Cơ sở dữ liệu'
	)

-- 6

-- 7
SELECT
	*
FROM SINHVIEN 
JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
JOIN MON ON KETQUA.MaMH = MON.MaMH
WHERE	Diem <	(
					SELECT TOP 1
						Diem
					FROM SINHVIEN 
					JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
					JOIN MON ON KETQUA.MaMH = MON.MaMH
					JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
					WHERE	TenKH = N'Tin học'
						AND TenMH = N'Đồ họa ứng dụng'
					ORDER BY Diem ASC
				)
	AND	TenMH = N'Đồ họa ứng dụng'

-- 8
SELECT
	*
FROM SINHVIEN
WHERE	Ngaysinh >	(
						SELECT TOP 1
							Ngaysinh
						FROM SINHVIEN
						JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
						WHERE TenKH = N'Anh văn'
						ORDER BY Ngaysinh DESC
					)
					
-- 9
SELECT
	SUM(Hocbong)
FROM SINHVIEN
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH
WHERE TenKH = N'Triết'

-- 10

-- 11
SELECT 
	SINHVIEN.MaSV N'Mã sinh viên',
	HoSV + ' ' + TenSV N'Họ và tên sinh viên',
	TenMH N'Tên môn',
	KETQUA.Diem N'Điểm'
FROM KETQUA
JOIN
(
	SELECT
		MaMH,
		MAX(Diem) Diem
	FROM KETQUA
	GROUP BY MaMH
)CAONHAT ON KETQUA.MaMH = CAONHAT.MaMH
		AND KETQUA.Diem = CAONHAT.Diem
JOIN SINHVIEN ON KETQUA.MaSV = SINHVIEN.MaSV
JOIN MON ON KETQUA.MaMH = MON.MaMH

-- 12
SELECT
	SINHVIEN.MaSV N'Mã sinh viên',
	TenKH N'Tên khoa',
	Hocbong N'Học bổng'
FROM SINHVIEN
JOIN
(
	SELECT
		MaKH,
		MAX(Hocbong) HB
	FROM SINHVIEN
	GROUP BY MaKH
)HBCAONHAT ON SINHVIEN.MaKH = HBCAONHAT.MaKH
			AND SINHVIEN.Hocbong = HBCAONHAT.HB
JOIN KHOA ON SINHVIEN.MaKH = KHOA.MaKH


-- BÀI 6 --

-- 1
INSERT INTO SINHVIEN
VALUES
	('C01', N'Lê Thành', N'Nguyên', 0, CONVERT(DATETIME, '19801020'), N'Tp. HCM', 'TH', 850000)

-- 2
INSERT INTO MON
VALUES
	('06', N'Xử lý ảnh', 45)

-- 3
INSERT INTO KHOA
VALUES
	('CT', N'Công trình')
 
-- 4
INSERT INTO SINHVIEN
VALUES
	('C02', N'Nguyễn Trần', N'Quân', 0, GETDATE(), N'Huế', 'CT', 950000)

-- 5
SELECT sv.MaSV
FROM SINHVIEN sv
JOIN KHOA k ON sv.MaKH = k.MaKH
WHERE k.TenKH = N'Tin học';

SELECT
	*
FROM SINHVIEN
JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
JOIN