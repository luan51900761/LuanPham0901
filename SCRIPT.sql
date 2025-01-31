USE [webbanhang]
GO
/****** Object:  UserDefinedFunction [dbo].[MA]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[MA]()
returns nvarchar(20)
as
	begin
		declare @maXe nvarchar(500)
		declare @num_count int
		set @num_count = (select count(*) from xe)
		set @maXe =(select top 1 maXe from xe order by maxe desc)
		if @maXe is null
			set @maXe = '1'
		else if @num_count < 9
			begin
				set @maXe = substring(@maXe,3,1)
				set @maXe = CONVERT(int,@maXe) + 1
				set @maXe = CONVERT(nvarchar,@maXe)
			end
		else
			begin
				set @maXe = substring(@maXe,3,2)
				set @maXe = CONVERT(int,@maXe) + 1
				set @maXe = CONVERT(nvarchar,@maXe)
			end
		return  'MX' + @maXe
	end
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [char](50) NOT NULL,
	[password] [char](50) NULL,
	[role] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chuyenxe]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chuyenxe](
	[machuyen] [char](10) NOT NULL,
	[tenchuyen] [nchar](50) NULL,
	[matuyen] [char](10) NULL,
	[giodi] [time](7) NULL,
	[gioden] [time](7) NULL,
	[manv] [char](10) NULL,
	[maxe] [char](10) NULL,
	[ngaydi] [date] NULL,
	[matx] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[machuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ghe]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ghe](
	[tenghe] [char](10) NOT NULL,
	[hang] [int] NULL,
	[tang] [int] NULL,
	[cot] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tenghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[mahd] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[username] [char](50) NULL,
	[tongtien] [float] NULL,
	[soluongve] [int] NULL,
	[machuyen] [char](10) NULL,
	[sdt] [char](10) NULL,
	[tinhtrang] [int] NULL,
	[ngaydat] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kigui]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kigui](
	[makg] [int] IDENTITY(1,1) NOT NULL,
	[tennguoigui] [nvarchar](50) NULL,
	[sdtnguoigui] [char](20) NULL,
	[tennguoinhan] [nvarchar](50) NULL,
	[sdtnguoinhan] [char](20) NULL,
	[diachinguoinhan] [nvarchar](200) NULL,
	[machuyen] [char](10) NULL,
	[ngay] [date] NULL,
	[chiphi] [int] NULL,
	[nvsuly] [char](10) NULL,
	[tinhtrang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[makg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loainv]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loainv](
	[maloainv] [char](10) NOT NULL,
	[tenloainv] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maloainv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manv] [char](10) NOT NULL,
	[tennv] [nchar](50) NULL,
	[ngaysinh] [datetime] NULL,
	[gioitinh] [nchar](3) NULL,
	[diachi] [char](100) NULL,
	[cmnd] [char](10) NULL,
	[dienthoai] [char](10) NULL,
	[email] [char](50) NULL,
	[maloainv] [char](10) NULL,
	[username] [char](50) NULL,
	[hinhanh] [char](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tuyenxe]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tuyenxe](
	[matuyen] [char](10) NOT NULL,
	[tentuyen] [nvarchar](50) NULL,
	[diemdi] [nchar](50) NULL,
	[diemden] [nchar](50) NULL,
	[banggia] [float] NULL,
	[image] [char](300) NULL,
	[thoigian] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[matuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vexe]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vexe](
	[mave] [int] IDENTITY(1,1) NOT NULL,
	[mahd] [int] NULL,
	[tenghe] [char](10) NULL,
	[tinhtrang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[mave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xe]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xe](
	[maxe] [char](10) NOT NULL,
	[tenxe] [char](10) NULL,
	[bienso] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maxe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'51900761                                          ', N'935051c3dd450938f1eb4fa39268b770                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'admin                                             ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'admin1                                            ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'alunanana                                         ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'an                                                ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'b                                                 ', N'202cb962ac59075b964b07152d234b70                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'b123                                              ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'b1234                                             ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'bao                                               ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'c                                                 ', N'202cb962ac59075b964b07152d234b70                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'chau                                              ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'd                                                 ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'e                                                 ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'finaltest                                         ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'huy                                               ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'khang                                             ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'linh                                              ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Employee                      ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'luan                                              ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Admin                         ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'test                                              ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'test1                                             ', N'202cb962ac59075b964b07152d234b70                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'test123123                                        ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'test1234                                          ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'test123456                                        ', N'202cb962ac59075b964b07152d234b70                  ', N'Custommer                     ')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'test2                                             ', N'c4ca4238a0b923820dcc509a6f75849b                  ', N'Custommer                     ')
GO
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX01      ', N'chuyến số 1                                       ', N'TX01      ', CAST(N'08:00:00' AS Time), CAST(N'15:30:00' AS Time), N'NV02      ', N'MX01      ', CAST(N'2021-12-05' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX02      ', N'chuyến số 2                                       ', N'TX01      ', CAST(N'09:00:00' AS Time), CAST(N'16:30:00' AS Time), N'NV02      ', N'MX02      ', CAST(N'2021-12-05' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX03      ', N'chuyến số 3                                       ', N'TX01      ', CAST(N'10:00:00' AS Time), CAST(N'17:30:00' AS Time), N'NV02      ', N'MX01      ', CAST(N'2021-12-05' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX04      ', N'chuyến số 4                                       ', N'TX02      ', CAST(N'20:00:00' AS Time), CAST(N'04:00:00' AS Time), N'NV02      ', N'MX04      ', CAST(N'2021-12-05' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX05      ', N'chuyến số 5                                       ', N'TX02      ', CAST(N'02:00:00' AS Time), CAST(N'10:00:00' AS Time), N'NV02      ', N'MX01      ', CAST(N'2021-12-05' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX06      ', N'chuyến số 6                                       ', N'TX02      ', CAST(N'04:00:00' AS Time), CAST(N'12:00:00' AS Time), N'NV02      ', N'MX03      ', CAST(N'2021-12-05' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX07      ', N'chuyến số 7                                       ', N'TX02      ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), N'NV02      ', N'MX04      ', CAST(N'2021-12-05' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX08      ', N'chuyến số 8                                       ', N'TX03      ', CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), N'NV03      ', N'MX05      ', CAST(N'2021-12-05' AS Date), N'NV06      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX09      ', N'chuyến số 9                                       ', N'TX04      ', CAST(N'07:00:00' AS Time), CAST(N'09:30:00' AS Time), N'NV03      ', N'MX02      ', CAST(N'2021-12-05' AS Date), N'NV06      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX10      ', N'chuyến số 10                                      ', N'TX04      ', CAST(N'08:00:00' AS Time), CAST(N'10:30:00' AS Time), N'NV03      ', N'MX01      ', CAST(N'2021-12-05' AS Date), N'NV06      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX11      ', N'chuyến số 11                                      ', N'TX04      ', CAST(N'09:00:00' AS Time), CAST(N'11:30:00' AS Time), N'NV03      ', N'MX03      ', CAST(N'2021-12-05' AS Date), N'NV06      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX110     ', N'Chuyến số 110                                     ', N'TX04      ', CAST(N'12:12:12' AS Time), CAST(N'06:06:06' AS Time), N'NV02      ', N'MX01      ', CAST(N'2021-12-23' AS Date), N'NV04      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX12      ', N'chuyến số 12                                      ', N'TX05      ', CAST(N'08:00:00' AS Time), CAST(N'14:00:00' AS Time), N'NV03      ', N'MX03      ', CAST(N'2021-12-05' AS Date), N'NV06      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX13      ', N'chuyến số 13                                      ', N'TX06      ', CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), N'NV03      ', N'MX02      ', CAST(N'2021-12-05' AS Date), N'NV06      ')
INSERT [dbo].[chuyenxe] ([machuyen], [tenchuyen], [matuyen], [giodi], [gioden], [manv], [maxe], [ngaydi], [matx]) VALUES (N'CX14      ', N'chuyến số 14                                      ', N'TX07      ', CAST(N'08:00:00' AS Time), CAST(N'10:30:00' AS Time), N'NV03      ', N'MX04      ', CAST(N'2021-12-05' AS Date), N'NV06      ')
GO
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A11       ', 1, 1, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A12       ', 1, 1, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A13       ', 1, 1, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A21       ', 2, 1, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A22       ', 2, 1, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A23       ', 2, 1, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A31       ', 3, 1, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A32       ', 3, 1, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A33       ', 3, 1, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A41       ', 4, 1, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A42       ', 4, 1, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A43       ', 4, 1, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A51       ', 5, 1, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A52       ', 5, 1, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A53       ', 5, 1, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A61       ', 6, 1, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A62       ', 6, 1, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'A63       ', 6, 1, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B11       ', 1, 2, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B12       ', 1, 2, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B13       ', 1, 2, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B21       ', 2, 2, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B22       ', 2, 2, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B23       ', 2, 2, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B31       ', 3, 2, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B32       ', 3, 2, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B33       ', 3, 2, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B41       ', 4, 2, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B42       ', 4, 2, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B43       ', 4, 2, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B51       ', 5, 2, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B52       ', 5, 2, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B53       ', 5, 2, 3)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B61       ', 6, 2, 1)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B62       ', 6, 2, 2)
INSERT [dbo].[ghe] ([tenghe], [hang], [tang], [cot]) VALUES (N'B63       ', 6, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2027, N'Phạm Thanh Luận', N'51900761                                          ', 2100000, 6, N'CX01      ', N'0965412293', 1, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2028, N'Lý Duy Nam', N'linh                                              ', 1400000, 4, N'CX01      ', N'0951654654', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2029, N'Tô Tấn Hoàng', N'linh                                              ', 6300000, 18, N'CX02      ', N'0965654654', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2030, N'Dương Hoài Hưng', N'linh                                              ', 1400000, 4, N'CX12      ', N'0912345644', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2031, N'Nguyễn Văn C', N'linh                                              ', 9000000, 18, N'CX04      ', N'0966565161', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2033, N'Phạm Thanh Luận', N'51900761                                          ', 1050000, 3, N'CX03      ', N'0965412293', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2034, N'Dương Hoài Hưng', N'51900761                                          ', 3500000, 10, N'CX03      ', N'0912345678', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2035, N'Trang Hoàng', N'admin                                             ', 6000000, 12, N'CX05      ', N'0915151548', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2036, N'Thích đi xe', N'admin                                             ', 2200000, 11, N'CX08      ', N'0965412294', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2037, N'Trần Văn A', N'admin                                             ', 2100000, 6, N'CX12      ', N'099999999 ', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2038, N'Trần Văn B', N'admin1                                            ', 1600000, 8, N'CX14      ', N'098989885 ', 1, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2039, N'Dương Văn C', N'51900761                                          ', 1400000, 4, N'CX02      ', N'0912547854', 1, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2040, N'Hoài Hưng', N'luan                                              ', 1050000, 3, N'CX03      ', N'0912345678', 1, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2041, N'Nguyễn Thị A', N'51900761                                          ', 700000, 2, N'CX03      ', N'0912345678', 1, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (2042, N'Phạm Thanh Luận', N'51900761                                          ', 1050000, 3, N'CX03      ', N'0912345678', 0, NULL)
INSERT [dbo].[hoadon] ([mahd], [hoten], [username], [tongtien], [soluongve], [machuyen], [sdt], [tinhtrang], [ngaydat]) VALUES (3027, N'Phạm Thanh Luận', N'luan                                              ', 400000, 2, N'CX110     ', N'0965412293', 0, CAST(N'2021-12-16' AS Date))
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[kigui] ON 

INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (4, N'Nguyễn Văn A', N'095654654           ', N'Nguyễn Văn B', N'0165468458          ', N'Quốc lộ 1a, Kp3, Tân nghĩa, Hàm Tân, Bình Thuận', N'CX01      ', CAST(N'2021-11-30' AS Date), 70, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (5, N'Nguyễn Văn An', N'0231651651          ', N'Nguyễn Như B', N'0965564554          ', N'Ngô Quyền, Tân An, Lagi, Bình Thuận', N'CX02      ', CAST(N'2021-11-30' AS Date), 50, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (6, N'Nguyễn Văn An', N'095654654           ', N'Nguyễn Văn An', N'0965564554          ', N'Quốc lộ 1a, Kp3, Tân nghĩa, Hàm Tân, Bình Thuận', N'CX01      ', CAST(N'2021-11-30' AS Date), 50, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (7, N'Nguyễn Văn B', N'095654654           ', N'Chị Như', N'0965564554          ', N'Ngô Quyền, Tân An, Lagi, Bình Thuận', N'CX01      ', CAST(N'2021-11-30' AS Date), 50, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (8, N'Nguyễn Văn An', N'NULL095654654       ', N'Chị Như', N'0965564554          ', N'Ngô Quyền, Tân An, Lagi, Bình Thuận', N'CX01      ', CAST(N'2021-11-30' AS Date), 50, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (9, N'Nguyễn Văn An', N'0231651651          ', N'Nguyễn Như B', N'0165468458          ', N'Ngô Quyền, Tân An, Lagi, Bình Thuận', N'CX03      ', CAST(N'2021-12-01' AS Date), 99, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (10, N'Trần Văn A', N'098916554           ', N'Nguyễn Thị B', N'064651654           ', N'TP.HCM', N'CX12      ', CAST(N'2021-12-01' AS Date), 100, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (11, N'Nguyễn Văn A', N'0913245678          ', N'Nguyễn Văn B', N'0912345612          ', N'Quốc lộ 1a, Kp3, Tân nghĩa, Hàm Tân, Bình Thuận', N'CX04      ', CAST(N'2021-12-03' AS Date), 100, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (12, N'Nguyễn Văn A', N'0231651651          ', N'Nguyễn Văn B', N'0165468458          ', N'Quốc lộ 1a, Kp3, Tân nghĩa, Hàm Tân, Bình Thuận', N'CX03      ', CAST(N'2021-12-03' AS Date), 150, N'NV05      ', 1)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (1005, N'Nguyên Như Bình', N'0231651651          ', N'Nguyễn Như Như', N'0165468458          ', N'Quốc lộ 1a, Kp3, Tân nghĩa, Hàm Tân, Bình Thuận', N'CX01      ', CAST(N'2021-12-16' AS Date), 123, N'NV01      ', NULL)
INSERT [dbo].[kigui] ([makg], [tennguoigui], [sdtnguoigui], [tennguoinhan], [sdtnguoinhan], [diachinguoinhan], [machuyen], [ngay], [chiphi], [nvsuly], [tinhtrang]) VALUES (1006, N'Nguyễn Văn A', N'0231651651          ', N'Nguyễn Như Như', N'03856515            ', N'Quốc lộ 1a, Kp3, Tân nghĩa, Hàm Tân, Bình Thuận', N'CX110     ', CAST(N'2021-12-16' AS Date), 1234, N'NV01      ', NULL)
SET IDENTITY_INSERT [dbo].[kigui] OFF
GO
INSERT [dbo].[loainv] ([maloainv], [tenloainv]) VALUES (N'LNV01     ', N'Quản Lý')
INSERT [dbo].[loainv] ([maloainv], [tenloainv]) VALUES (N'LNV02     ', N'Lơ Xe')
INSERT [dbo].[loainv] ([maloainv], [tenloainv]) VALUES (N'LNV03     ', N'Trực Bàn')
INSERT [dbo].[loainv] ([maloainv], [tenloainv]) VALUES (N'LNV04     ', N'Tài Xế')
GO
INSERT [dbo].[nhanvien] ([manv], [tennv], [ngaysinh], [gioitinh], [diachi], [cmnd], [dienthoai], [email], [maloainv], [username], [hinhanh]) VALUES (N'NV01      ', N'Thanh Luận                                        ', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'Nam', N'TP.HCM                                                                                              ', N'261586680 ', N'0965656512', N'luanpro0021@gmail.com                             ', N'LNV01     ', N'luan                                              ', N'/Content/img/avt-nam.jpg                                                                                                                                                                                ')
INSERT [dbo].[nhanvien] ([manv], [tennv], [ngaysinh], [gioitinh], [diachi], [cmnd], [dienthoai], [email], [maloainv], [username], [hinhanh]) VALUES (N'NV02      ', N'Văn Hide                                            ', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'Nam', N'TP.HCM                                                                                              ', N'261586654 ', N'0916516516', N'ALKAN@gmail.com                                   ', N'LNV02     ', N'an                                                ', N'/Content/img/avt-nam.jpg                                                                                                                                                                                ')
INSERT [dbo].[nhanvien] ([manv], [tennv], [ngaysinh], [gioitinh], [diachi], [cmnd], [dienthoai], [email], [maloainv], [username], [hinhanh]) VALUES (N'NV03      ', N'Strong Khang                                        ', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'Nam', N'TP.HCM                                                                                              ', N'266516516 ', N'0931551556', N'ALKKHANG@gmail.com                                ', N'LNV02     ', N'khang                                             ', N'/Content/img/avt-nam.jpg                                                                                                                                                                                ')
INSERT [dbo].[nhanvien] ([manv], [tennv], [ngaysinh], [gioitinh], [diachi], [cmnd], [dienthoai], [email], [maloainv], [username], [hinhanh]) VALUES (N'NV04      ', N'Quốc Bảo                                          ', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'Nam', N'TP.HCM                                                                                              ', N'313321321 ', N'0852126515', N'ALKBao@gmail.com                                  ', N'LNV04     ', N'bao                                               ', N'/Content/img/avt-nam.jpg                                                                                                                                                                                ')
INSERT [dbo].[nhanvien] ([manv], [tennv], [ngaysinh], [gioitinh], [diachi], [cmnd], [dienthoai], [email], [maloainv], [username], [hinhanh]) VALUES (N'NV05      ', N'Dương Tiểu Linh                                   ', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'Nữ ', N'TP.HCM                                                                                              ', N'261586680 ', N'0965165155', N'ALkLin@gmail.com                                  ', N'LNV03     ', N'linh                                              ', N'/Content/img/avt-nu.jpg                                                                                                                                                                                 ')
INSERT [dbo].[nhanvien] ([manv], [tennv], [ngaysinh], [gioitinh], [diachi], [cmnd], [dienthoai], [email], [maloainv], [username], [hinhanh]) VALUES (N'NV06      ', N'Hoàng Văn Huy                                     ', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'Nam', N'TP.HCM                                                                                              ', N'515165165 ', N'0965165151', N'ALKHuy@gmail.com                                  ', N'LNV04     ', N'huy                                               ', N'/Content/img/avt-nam.jpg                                                                                                                                                                                ')
INSERT [dbo].[nhanvien] ([manv], [tennv], [ngaysinh], [gioitinh], [diachi], [cmnd], [dienthoai], [email], [maloainv], [username], [hinhanh]) VALUES (N'NV07      ', N'Mai Linh Châu                                     ', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'Nữ ', N'TP.HCM                                                                                              ', N'131515161 ', N'0916516544', N'ALkChau@gmail.com                                 ', N'LNV03     ', N'chau                                              ', N'/Content/img/avt-nu.jpg                                                                                                                                                                                 ')
GO
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX01      ', N'tuyến số 1', N'Hồ Chí Minh                                       ', N'Đà Lạt                                            ', 350, N'/Content/img/DL.jpg                                                                                                                                                                                                                                                                                         ', 5.5)
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX02      ', N'tuyến số 2', N'Hồ Chí Minh                                       ', N'Đà Nẵng                                           ', 500, N'/Content/img/DN.jpg                                                                                                                                                                                                                                                                                         ', 8)
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX03      ', N'tuyến số 3', N'Hồ Chí Minh                                       ', N'Phan Thiết                                        ', 200, N'/Content/img/PT.jpg                                                                                                                                                                                                                                                                                         ', 4)
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX04      ', N'tuyến số 4', N'Hồ Chí Minh                                       ', N'Vũng Tàu                                          ', 200, N'/Content/img/VT.jpg                                                                                                                                                                                                                                                                                         ', 2.5)
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX05      ', N'tuyến số 5', N'Đà Lạt                                            ', N'Hồ Chí Minh                                       ', 350, N'/Content/img/DL.jpg                                                                                                                                                                                                                                                                                         ', 6)
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX06      ', N'tuyến số 6', N'Đà Nẵng                                           ', N'Hồ Chí Minh                                       ', 500, N'/Content/img/DN.jpg                                                                                                                                                                                                                                                                                         ', 8)
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX07      ', N'tuyến số 7', N'Phan Thiết                                        ', N'Hồ Chí Minh                                       ', 200, N'/Content/img/PT.jpg                                                                                                                                                                                                                                                                                         ', 4)
INSERT [dbo].[tuyenxe] ([matuyen], [tentuyen], [diemdi], [diemden], [banggia], [image], [thoigian]) VALUES (N'TX08      ', N'tuyến số 8', N'Vũng Tàu                                          ', N'Hồ Chí Minh                                       ', 200, N'/Content/img/VT.jpg                                                                                                                                                                                                                                                                                         ', 2.5)
GO
SET IDENTITY_INSERT [dbo].[vexe] ON 

INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2075, 2027, N'A11       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2076, 2027, N'A31       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2077, 2027, N'A21       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2078, 2027, N'A53       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2079, 2027, N'B13       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2080, 2027, N'B23       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2081, 2028, N'A43       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2082, 2028, N'A33       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2083, 2028, N'A23       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2084, 2028, N'A13       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2085, 2029, N'A11       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2086, 2029, N'A12       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2087, 2029, N'A22       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2088, 2029, N'A13       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2089, 2029, N'A23       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2090, 2029, N'A31       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2091, 2029, N'A32       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2092, 2029, N'A33       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2093, 2029, N'A43       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2094, 2029, N'A53       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2095, 2029, N'A63       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2096, 2029, N'A62       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2097, 2029, N'A61       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2098, 2029, N'A51       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2099, 2029, N'A41       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2100, 2029, N'A52       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2101, 2029, N'A42       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2102, 2029, N'A21       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2103, 2030, N'A11       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2104, 2030, N'A21       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2105, 2030, N'A32       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2106, 2030, N'A42       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2107, 2031, N'A11       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2108, 2031, N'A21       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2109, 2031, N'A31       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2110, 2031, N'A41       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2111, 2031, N'A51       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2112, 2031, N'A61       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2113, 2031, N'B12       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2114, 2031, N'B22       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2115, 2031, N'B32       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2116, 2031, N'B52       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2117, 2031, N'B42       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2118, 2031, N'B62       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2119, 2031, N'A63       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2120, 2031, N'A53       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2121, 2031, N'A43       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2122, 2031, N'A33       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2123, 2031, N'A23       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2124, 2031, N'A13       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2125, 2033, N'A11       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2126, 2033, N'A12       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2127, 2033, N'A13       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2128, 2034, N'A21       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2129, 2034, N'A31       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2130, 2034, N'A41       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2131, 2034, N'A61       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2132, 2034, N'A51       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2133, 2034, N'A22       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2134, 2034, N'A32       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2135, 2034, N'A42       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2136, 2034, N'A52       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2137, 2034, N'A62       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2138, 2035, N'A11       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2139, 2035, N'A21       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2140, 2035, N'A32       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2141, 2035, N'A42       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2142, 2035, N'A52       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2143, 2035, N'A62       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2144, 2035, N'B13       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2145, 2035, N'B23       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2146, 2035, N'B33       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2147, 2035, N'B43       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2148, 2035, N'B53       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2149, 2035, N'B63       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2150, 2036, N'A11       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2151, 2036, N'A22       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2152, 2036, N'A32       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2153, 2036, N'A42       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2154, 2036, N'A52       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2155, 2036, N'A62       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2156, 2036, N'B22       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2157, 2036, N'B32       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2158, 2036, N'B42       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2159, 2036, N'B52       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2160, 2036, N'B62       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2161, 2037, N'B13       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2162, 2037, N'B23       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2163, 2037, N'B33       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2164, 2037, N'B43       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2165, 2037, N'B53       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2166, 2037, N'B63       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2167, 2038, N'A13       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2168, 2038, N'A22       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2169, 2038, N'B21       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2170, 2038, N'B43       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2171, 2038, N'B33       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2172, 2038, N'B23       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2173, 2038, N'B42       ', 1)
GO
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2174, 2038, N'B12       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2175, 2039, N'B12       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2176, 2039, N'B22       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2177, 2039, N'B52       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2178, 2039, N'B62       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2179, 2040, N'B43       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2180, 2040, N'B53       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2181, 2040, N'B63       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2182, 2041, N'B11       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2183, 2041, N'B21       ', 1)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2184, 2042, N'B13       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2185, 2042, N'B23       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (2186, 2042, N'B33       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (3175, 3027, N'A11       ', 0)
INSERT [dbo].[vexe] ([mave], [mahd], [tenghe], [tinhtrang]) VALUES (3176, 3027, N'A21       ', 0)
SET IDENTITY_INSERT [dbo].[vexe] OFF
GO
INSERT [dbo].[xe] ([maxe], [tenxe], [bienso]) VALUES (N'MX01      ', N'Xe 1      ', N'86H6-12345')
INSERT [dbo].[xe] ([maxe], [tenxe], [bienso]) VALUES (N'MX02      ', N'Xe 2      ', N'86H6-12347')
INSERT [dbo].[xe] ([maxe], [tenxe], [bienso]) VALUES (N'MX03      ', N'Xe 3      ', N'86H6-12354')
INSERT [dbo].[xe] ([maxe], [tenxe], [bienso]) VALUES (N'MX04      ', N'Xe 4      ', N'86H6-12356')
INSERT [dbo].[xe] ([maxe], [tenxe], [bienso]) VALUES (N'MX05      ', N'Xe 5      ', N'86H6-12347')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_nhanvien]    Script Date: 12/20/2021 9:02:27 AM ******/
ALTER TABLE [dbo].[nhanvien] ADD  CONSTRAINT [IX_nhanvien] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[xe] ADD  CONSTRAINT [df_xe_maxe]  DEFAULT ([dbo].[MA]()) FOR [maxe]
GO
ALTER TABLE [dbo].[chuyenxe]  WITH CHECK ADD FOREIGN KEY([manv])
REFERENCES [dbo].[nhanvien] ([manv])
GO
ALTER TABLE [dbo].[chuyenxe]  WITH CHECK ADD FOREIGN KEY([matuyen])
REFERENCES [dbo].[tuyenxe] ([matuyen])
GO
ALTER TABLE [dbo].[chuyenxe]  WITH CHECK ADD FOREIGN KEY([matuyen])
REFERENCES [dbo].[tuyenxe] ([matuyen])
GO
ALTER TABLE [dbo].[chuyenxe]  WITH CHECK ADD FOREIGN KEY([matx])
REFERENCES [dbo].[nhanvien] ([manv])
GO
ALTER TABLE [dbo].[chuyenxe]  WITH CHECK ADD FOREIGN KEY([maxe])
REFERENCES [dbo].[xe] ([maxe])
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [fk_hd_machuyen] FOREIGN KEY([machuyen])
REFERENCES [dbo].[chuyenxe] ([machuyen])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [fk_hd_machuyen]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [fk_hd_username] FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [fk_hd_username]
GO
ALTER TABLE [dbo].[kigui]  WITH CHECK ADD  CONSTRAINT [fk_kg_machuyen] FOREIGN KEY([machuyen])
REFERENCES [dbo].[chuyenxe] ([machuyen])
GO
ALTER TABLE [dbo].[kigui] CHECK CONSTRAINT [fk_kg_machuyen]
GO
ALTER TABLE [dbo].[kigui]  WITH CHECK ADD  CONSTRAINT [fk_kigui_nvsuly] FOREIGN KEY([nvsuly])
REFERENCES [dbo].[nhanvien] ([manv])
GO
ALTER TABLE [dbo].[kigui] CHECK CONSTRAINT [fk_kigui_nvsuly]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD FOREIGN KEY([maloainv])
REFERENCES [dbo].[loainv] ([maloainv])
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD FOREIGN KEY([maloainv])
REFERENCES [dbo].[loainv] ([maloainv])
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[vexe]  WITH CHECK ADD  CONSTRAINT [fk_vexe_tenghe] FOREIGN KEY([tenghe])
REFERENCES [dbo].[ghe] ([tenghe])
GO
ALTER TABLE [dbo].[vexe] CHECK CONSTRAINT [fk_vexe_tenghe]
GO
ALTER TABLE [dbo].[vexe]  WITH CHECK ADD  CONSTRAINT [fk_vx_mahd] FOREIGN KEY([mahd])
REFERENCES [dbo].[hoadon] ([mahd])
GO
ALTER TABLE [dbo].[vexe] CHECK CONSTRAINT [fk_vx_mahd]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD CHECK  (([tinhtrang]=(1) OR [tinhtrang]=(0)))
GO
ALTER TABLE [dbo].[kigui]  WITH CHECK ADD CHECK  (([tinhtrang]=(1) OR [tinhtrang]=(0)))
GO
ALTER TABLE [dbo].[vexe]  WITH CHECK ADD CHECK  (([tinhtrang]=(1) OR [tinhtrang]=(0)))
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 12/20/2021 9:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[test](@tenxe char(10), @bienso char(10))
as
begin
	insert into xe(tenxe,bienso) values(@tenxe,@bienso)
end
GO
