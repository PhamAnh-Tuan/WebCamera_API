USE [WebCamera_API]
GO
/****** Object:  Table [dbo].[Camera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camera](
	[MaCamera] [int] IDENTITY(1,1) NOT NULL,
	[TenCamera] [nvarchar](100) NOT NULL,
	[MaLoai] [int] NULL,
	[DoPhanGiai] [nvarchar](30) NOT NULL,
	[Chip] [nvarchar](20) NOT NULL,
	[OngKinh] [nvarchar](40) NOT NULL,
	[TamQuanSat] [nvarchar](30) NOT NULL,
	[NguonDien] [nvarchar](30) NULL,
	[HinhAnh] [nvarchar](70) NULL,
	[Gia] [int] NULL,
	[CameraHot] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCamera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTietDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [nvarchar](30) NULL,
	[MaCamera] [int] NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaCTHoaDonNhap] [nvarchar](30) NOT NULL,
	[MaHoaDonNhap] [nvarchar](30) NULL,
	[MaCamera] [int] NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [nvarchar](30) NOT NULL,
	[MaKhachHang] [int] NULL,
	[NgayTao] [date] NOT NULL,
	[TrangThaiDonHang] [nvarchar](30) NOT NULL,
	[TrangThaiVanChuyen] [nvarchar](30) NOT NULL,
	[TrangThaiThanhToan] [nvarchar](30) NOT NULL,
	[TongTien] [int] NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](70) NULL,
	[SDT] [nvarchar](10) NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](30) NOT NULL,
	[ThongTin] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHoaDonNhap] [nvarchar](30) NOT NULL,
	[MaNCC] [int] NULL,
	[TongTien] [int] NOT NULL,
	[NgayNhap] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](30) NOT NULL,
	[AnhDaiDien] [nvarchar](70) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
	[GioiTinh] [int] NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCamera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCamera](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[MaHang] [int] NULL,
	[TenLoai] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Camera] ON 

INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (1, N'Dahua IP IPC-A22EP-imou', 1, N'2.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'Từ 10-15m', N'DC 12V – 1000mA', N'IMOU-IPC-A22EP.jpg', 580000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (2, N'IMOU Ranger Pro IPC-A26HP', 1, N'2.0 Megapixel', N'Chip CMOS', N'3.6mmm góc nhìn 90 độ', N'10 mét', N'5v/2A', N'45981_dahua_miuo.jpg', 990000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (3, N'Dahua IPC-G42P-imou', 1, N'4Megapixel CMOS 1/2.7', N'', N'Loại 2.8mm', N'30m', N'DC 5V', N'32389_ipc_g42p_imou_1.jpg', 1015000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (4, N'IP Fisheye Dahua DH-IPC-EBW81230P', 1, N'12.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 5-10m', N'DC 12V', N'36575_p_26330_dahua_dh_ipc_ebw81230p.jpg', 2025000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (5, N'IP Fisheye Dahua DH-IPC-EB5531P', 1, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'36574_p_25379_dahua_dh_ipc_eb5531p.jpg', 7000000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (6, N'IP AI 4.0MP DAHUA DH-IPC-HDW3441TMP-AS', 2, N'4.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'50m', N'DC 12V', N'DAHUA-IPC-HDW3441TMP-AS.jpg', 3924000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (7, N'IP AI 2.0MP DAHUA DH-IPC-HDW3241TMP-AS', 2, N'4.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'50m', N'DC 12V', N'DAHUA-IPC-HDW3441TMP-AS.jpg', 3924000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (8, N'Camera IP PRO-AI 2.0MP DAHUA DH-IPC-HFW5241EP-S', 2, N'2.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'50m', N'DC 12V', N'camera-ip-pro-ai-2-0mp-dahua-dh-ipc-hfw5241ep-s.jpg', 5546000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (9, N'Camera IP AI 8MP DAHUA DH-IPC-HDW3849HP-AS-PV', 2, N'8.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'30m', N'DC 12V', N'DAHUA-IPC-HDW3441TMP-AS.jpg', 3924000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (10, N'Camera IP PRO-AI 2.0MP DAHUA DH-IPC-HFW5241TP-AS-PV', 2, N'2.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'60m', N'DC 12V', N'DAHUA-IPC-HDW3441TMP-AS.jpg', 3924000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (11, N'Camera IP AI 2.0MP DAHUA DH-IPC-HDBW3241EP-AS', 2, N'4.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'50m', N'DC 12V', N'DAHUA-IPC-HDBW3241EP-AS.jpg', 3924000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (12, N'Camera IP AI 2.0MP Dome DAHUA DH-IPC-HDBW3241RP-ZAS', 2, N'2.0 Megapixel', N'Chip CMOS', N'Loại 2.7 – 13.5mm', N'40m', N'DC 12V', N'camera-ip-ai-2-0mp-dome-dahua-dh-ipc-hdbw3241rp-zas.jpg', 3924000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (13, N'Camera IP Pro-Ai 2.0MP DAHUA DH-IPC-HDW5241TMP-AS', 2, N'2.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'50m', N'DC 12V', N'camera-ip-pro-ai-2-0mp-dahua-dh-ipc-hdw5241tmp-as.jpg', 3924000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (14, N'Camera IP AI 4.0MP DAHUA DH-IPC-HDBW3441RP-ZAS', 2, N'4.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'40m', N'DC 12V', N'DAHUA-IPC-HDBW3441RP-ZAS.jpg', 7986000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (15, N'Camera IP AI 2.0MP DAHUA DH-IPC-HDBW3241EP-S', 2, N'2.0 Megapixel', N'Chip CMOS', N'Loại 3.6mm', N'50m', N'DC 12V', N'DAHUA-IPC-HDBW3241EP-S.jpg', 3290000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (16, N'Camera IP bán cầu 4.0MP HiLook IPC-D640H-V', 3, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-ban-cau-4mp-hilook-ipc-d640h-v-250x250.jpg', 5170000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (17, N'Camera IP Dome 2MP HiLook IPC-D121H', 3, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'HiLook-IPC-D121H.jpg', 1440000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (18, N'Camera IP bán cầu 5MP HiLook IPC-T651H-Z', 3, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-ban-cau-5mp-hilook-ipc-t651h-z.jpg', 5650000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (19, N'Camera IP bán cầu 2MP HiLook IPC-T621H-Z', 3, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-ban-cau-2mp-hilook-ipc-d620h-v-2.jpg', 4830000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (20, N'Camera IP thân trụ 2MP HiLook IPC-B620H-Z', 3, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-than-tru-2mp-hilook-ipc-b620h-z-1.jpg', 4350000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (21, N'Camera IP thân trụ hồng ngoại 2MP HiLook IPC-B120W', 4, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-than-tru-hong-ngoai-2mp-hilook-ipc-b120w.jpg', 1540000, 1)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (22, N'Camera IP Cube 2MP hồng ngoại Hilook IPC-C120-D/W(B)', 4, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-cube-2mp-hong-ngoai-hilook-ipc-c120-d-wb-1.jpg', 1650000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (23, N'Camera IP Quay quét 2MP hồng ngoại Hilook IPC-P220-D/W', 4, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-quay-quet-2mp-hong-ngoai-hilook-ipc-p220-d-w-1.jpg', 1335000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (24, N'Camera IP Cube 2MP hồng ngoại Hilook IPC-C220H-D/W', 4, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'camera-ip-cube-2mp-hong-ngoai-hilook-ipc-c220h-d-w-1.jpg', 2170000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (25, N'Camera IP có kết nối Wifi 2MP HiLook IPC-B120-D/W', 4, N'5.0 Megapixel', N'Chip CMOS', N'Loại 1.98mm', N'Từ 20-30m', N'DC 12V', N'HiLook-IPC-B120-D-W-1.jpg', 4350000, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (32, N'hh', 5, N'hh', N'hh', N'hh', N'hh', N'hh', N'cover_lg_dantri_in-02.png', 4444, 0)
INSERT [dbo].[Camera] ([MaCamera], [TenCamera], [MaLoai], [DoPhanGiai], [Chip], [OngKinh], [TamQuanSat], [NguonDien], [HinhAnh], [Gia], [CameraHot]) VALUES (33, N'tt65444', 4, N'rr', N'rr', N'ty', N'ttt', N'rr', N'cover_lg_dantri_in-02.png', 1000000, 0)
SET IDENTITY_INSERT [dbo].[Camera] OFF
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (6, N'DH11623297581486', 1, 2, 580000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (7, N'DH11623297581486', 3, 1, 1015000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (8, N'DH11623297581486', 1, 2, 580000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (25, N'DH11625381513134', 15, 1, 3290000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (26, N'DH11625381513134', 13, 2, 3924000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (27, N'DH11625381865317', 17, 3, 1440000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (28, N'DH11625381865317', 15, 1, 3290000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (29, N'DH11625381865317', 18, 1, 5650000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (40, N'DH21633624', 14, 1, 7986000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (48, N'DH1981013', 14, 1, 7986000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (49, N'DH1981013', 16, 1, 5170000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (1009, N'DH160311', 5, 1, 7000000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (1010, N'DH160311', 3, 1, 1015000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaCamera], [SoLuong], [DonGia]) VALUES (1011, N'DH160311', 1, 1, 580000)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayTao], [TrangThaiDonHang], [TrangThaiVanChuyen], [TrangThaiThanhToan], [TongTien], [TenKhachHang], [DiaChi], [SDT], [GhiChu]) VALUES (N'DH11623297581486', 1, CAST(N'2021-06-10' AS Date), N'Đã giao', N'Đang giao', N'Chưa thanh toán', 2175000, N'Quang Trần', N'Ba Đình - Hà Nội', N'0973787880', N'giao nhanh cho anh nhé ')
INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayTao], [TrangThaiDonHang], [TrangThaiVanChuyen], [TrangThaiThanhToan], [TongTien], [TenKhachHang], [DiaChi], [SDT], [GhiChu]) VALUES (N'DH11625381513134', 1, CAST(N'2021-07-04' AS Date), N'Đã hủy', N'Chưa vận chuyển', N'Chưa thanh toán', 11138000, N'Quang Trần', N'Ba Đình - Hà Nội', N'0973787880', N'muộn rồi mà sao còn')
INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayTao], [TrangThaiDonHang], [TrangThaiVanChuyen], [TrangThaiThanhToan], [TongTien], [TenKhachHang], [DiaChi], [SDT], [GhiChu]) VALUES (N'DH11625381865317', 1, CAST(N'2021-07-04' AS Date), N'Đã giao', N'Đang giao', N'Chưa thanh toán', 13260000, N'Quang Trần', N'Ba Đình - Hà Nội', N'0973787880', N'muộn rồi mà sao còn')
INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayTao], [TrangThaiDonHang], [TrangThaiVanChuyen], [TrangThaiThanhToan], [TongTien], [TenKhachHang], [DiaChi], [SDT], [GhiChu]) VALUES (N'DH160311', 1, CAST(N'2021-07-05' AS Date), N'Chưa xác thực', N'Chưa vận chuyển', N'Chưa thanh toán', 8595000, N'Quang Trần', N'Ba Đình - Hà Nội', N'0973787880', N'giao nhanh cho anh')
INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayTao], [TrangThaiDonHang], [TrangThaiVanChuyen], [TrangThaiThanhToan], [TongTien], [TenKhachHang], [DiaChi], [SDT], [GhiChu]) VALUES (N'DH17685636', 1, CAST(N'2021-07-04' AS Date), N'Chưa xác thực', N'Chưa vận chuyển', N'Chưa thanh toán', 6270000, N'Quang Trần', N'Ba Đình - Hà Nội', N'0973787880', N'vvvwww')
INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayTao], [TrangThaiDonHang], [TrangThaiVanChuyen], [TrangThaiThanhToan], [TongTien], [TenKhachHang], [DiaChi], [SDT], [GhiChu]) VALUES (N'DH1981013', 1, CAST(N'2021-07-04' AS Date), N'Chưa xác thực', N'Chưa vận chuyển', N'Chưa thanh toán', 13156000, N'Quang Trần', N'Ba Đình - Hà Nội', N'0973787880', N'rrrr')
INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayTao], [TrangThaiDonHang], [TrangThaiVanChuyen], [TrangThaiThanhToan], [TongTien], [TenKhachHang], [DiaChi], [SDT], [GhiChu]) VALUES (N'DH21633624', 2, CAST(N'2021-07-04' AS Date), N'Đã giao', N'Đã vận chuyển', N'Đã thanh toán', 11910000, N'Nguyễn Hải Hưng', N'Hồ Tây, Hà Nội', N'0987787888', N'gói hàng cẩn thận')
SET IDENTITY_INSERT [dbo].[HangSanXuat] ON 

INSERT [dbo].[HangSanXuat] ([MaHang], [TenHang], [ThongTin]) VALUES (1, N'Dahua', N'Thương hiệu DAHUA hiện đang là 1 trong nhà 5 nhà sản xuất sản xuất thiết bị an ninh hàng đầu thế giới (Theo số liệu thống kê của Asmag năm 2019), cung cấp các thiết bị Camera quan sát, Alarm, Access Control, Network, Khóa cửa thông minh … được sử dụng rộng rãi trong nhiều lĩnh vực như ngân hàng, cơ sở hạ tầng, khu vực công cộng…Các sản phẩm Dahua có kiểu dáng đẹp, giá cả cạnh tranh, chất lượng cao, thời gian sử dụng lâu dài đem lại sự tiện ích cho người sử dụng, Quy trình sản xuất hiện đại. Dahua có một đội ngũ R&D mạnh mẽ với hơn 2000 chuyên gia, nhằm tối đa hóa giá trị cho khách hàng.Dahua Technology Co. Ltd sở hữu 442 bằng sáng chế trong đó có 20 bằng sáng chế thuộc quyền sở hữu độc quyền. Dahua được đề xuất là thương hiệu cho giải pháp camera giao thông an toàn có mức ảnh hưởng bậc nhất Trung Quốc.')
INSERT [dbo].[HangSanXuat] ([MaHang], [TenHang], [ThongTin]) VALUES (2, N'HILOOK', N'HiLook là dòng sản phẩm từ thương hiệu camera Hikvision số 1 thế giới - xuất xứ từ Trung Quốc. Hilook được bán trên thị trường Việt Nam vào cuối năm 2019.Chuẩn nén H.265 + cho băng thông tối đa và hiệu quả lưu trữ dữ liệu. Hình ảnh độ phân giải siêu cao lên đến 5.0MP. EXIR 2.0 cho hiệu quả phát sáng hồng ngoại cao hơn, WDR để cân bằng màu sắc và độ sáng trong điều kiện ánh sáng khắc nghiệt và còn nhiều tính năng vượt trội khác ...Sản phẩm có mức giá tốt, kích thước gọn nhẹ, không chiếm diện tích giúp bạn dễ dàng lắp đặt, bố trí phù hợp với nhu cầu sử dụng của hộ gia đình, công ty, cửa hàng.')
INSERT [dbo].[HangSanXuat] ([MaHang], [TenHang], [ThongTin]) VALUES (3, N'VANTECH', N'VANTECH - thương hiệu camera an ninh số 1 Việt Nam (Công nghệ Nhật Bản) của công ty CP Vạn Xuân. Các sản phẩm camera AHD, camera IP, camera HDCVI, camera HDTVI, Powerline camera IP và hệ thống DTV 4K ra đời mang tính cạnh tranh về giá cả, chất lượng vượt trội.Đó là ưu thế khiến cho VANTECH đứng vững trên thị trường nhiều năm nay, và giúp cho khách hàng khi sử dụng đặt hiệu quả cao và hoàn toàn tin tưởng vào chất lượng của sản phẩm.')
INSERT [dbo].[HangSanXuat] ([MaHang], [TenHang], [ThongTin]) VALUES (4, N'IMOU', N'IMOU thương hiệu thiết bị camera an ninh, nhà thông minh toàn cầu – là công ty con của Dahua xuất xứ từ Trung Quốc.Là dòng camera IP Wifi với nhiều tính năng tiện ích sử dụng cho gia đình. Với các công nghệ tối ưu cho việc giám sát và phát hiện đột nhập, đe dọa kẻ đột nhậpCamera Wifi IMOU là sản phẩm tiện ích và dễ sử dụng cho gia đình, cửa hàng. Hướng tới khách hàng cuối cùng với sự tiện lợi, dễ dàng lắp đặt, cài đặt.')
INSERT [dbo].[HangSanXuat] ([MaHang], [TenHang], [ThongTin]) VALUES (5, N'EZVIZ', N'EZVIZ thương hiệu cung cấp thiết bị camera an ninh, nhà thông minh toàn cầu. Là thương hiệu riêng của camera Hikvision xuất xứ từ Trung Quốc.Với sứ mệnh tạo ra một cuộc sống an toàn, thông minh và tiện lợi cho người dùng thông qua các thiết bị thông minh, nền tảng dựa trên đám mây và công nghệ AI.Hướng tới khách hàng cuối cùng với sự tiện lợi, dễ dàng lắp đặt, cài đặt. Sản phẩm và dịch vụ sáng tạo từ camera wifi không dây EZVIZ có thể được áp dụng cho gia đình, nơi làm việc, cửa hàng, trường học hay bất cứ nơi đâu …EZVIZ trao quyền cho các đối tác chia sẻ các dịch vụ đám mây độc đáo và xây dựng một Hệ sinh thái IoT phát triển mạnh – giúp các thiết bị liên kết và tương tích với nhau một cách thông minh, hiệu quả và thân thiện…')
INSERT [dbo].[HangSanXuat] ([MaHang], [TenHang], [ThongTin]) VALUES (2002, N'KBvision', N'là hãng sản xuất camera an ninh')
INSERT [dbo].[HangSanXuat] ([MaHang], [TenHang], [ThongTin]) VALUES (2003, N'Yi', N'Hãng sản xuất camera nhỏ lẻ, không phân phối rộng')
SET IDENTITY_INSERT [dbo].[HangSanXuat] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [AnhDaiDien], [Email], [MatKhau], [GioiTinh], [SDT], [DiaChi]) VALUES (1, N'Quang Trần', NULL, N'Quangtran97@gmail.com', N'12345', 0, N'0973787880', N'Ba Đình - Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [AnhDaiDien], [Email], [MatKhau], [GioiTinh], [SDT], [DiaChi]) VALUES (2, N'Nguyễn Hải Hưng', NULL, N'Haihung97@gmail.com', N'12345', 0, N'0987787888', N'Hồ Tây, Hà Nội')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiCamera] ON 

INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (1, 1, N'Camera IP', N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (2, 1, N'Camera AI', N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (3, 2, N'Camera IP', N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (4, 2, N'Camera IP Wifi không dây', N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (5, 3, N'Camera IP', N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (6, 3, N'Camera Speedome', N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (7, 3, N'Camera Analog', N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
INSERT [dbo].[LoaiCamera] ([MaLoai], [MaHang], [TenLoai], [MoTa]) VALUES (1004, 3, N'hh9999', N'hhh99999')
SET IDENTITY_INSERT [dbo].[LoaiCamera] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [Anh], [TaiKhoan], [MatKhau]) VALUES (1, N'TuanPC', N'anhadmin.jpg', N'tuanphamacb05@gmail.com', N'1234')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (1, N'Thiết Bị An Ninh An Toàn VITECK- Công Ty TNHH Giải Pháp Công Nghệ VITECK', N'180 Trần Quốc Toản, KP. 4, P. Bình Đa, TP. Biên Hòa, Đồng Nai', N'0966788876', N'info@viteck.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (2, N'Khôi Ngô Security - Công Ty TNHH Khôi Ngô', N'22A Kỳ Đồng, P. 9, Q. 3, Tp. Hồ Chí Minh (TPHCM)', N'0908375212', N'contact@khoingo.net')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (3, N'Camera Kiến Hưng - Công Ty TNHH TM & DV Công Nghệ Kiến Hưng', N'VP Miền Bắc: Số 31, Ngõ 44, P. Mai Dịch, Q. Cầu Giấy, Hà Nội', N'0868796078', N'hatientrong886@gmail.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (5, N'Camera Thiên Long - Công Ty TNHH Công Nghệ Kỹ Thuật Thiên Long', N'Số 501, Đại Lộ Bình Dương, P. Hiệp Thành, TP. Thủ Dầu Một, Bình Dương', N'0901669916', N'voquang@camerabinhduong.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (6, N'Camera Quang Mai - Công Ty TNHH MTV Tin Học Viễn Thông Quang Mai', N'485/46 Phan Văn Trị, P. 5, Q. Gò Vấp, Tp. Hồ Chí Minh (TPHCM)', N'0903517025', N'tuyetphuongkt@quangmai.net')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__92A7EFABF9DD4CFB]    Script Date: 7/15/2021 11:53:27 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[TenKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Camera]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiCamera] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaCamera])
REFERENCES [dbo].[Camera] ([MaCamera])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaCamera])
REFERENCES [dbo].[Camera] ([MaCamera])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaHoaDonNhap])
REFERENCES [dbo].[HoaDonNhap] ([MaHoaDonNhap])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoaiCamera]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[HangSanXuat] ([MaHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[Add_Camera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_Camera]
@TenCamera nvarchar(100),
@MaLoai int,
@DoPhanGiai nvarchar(30),
@Chip nvarchar(20),
@OngKinh nvarchar(40),
@TamQuanSat nvarchar(30),
@NguonDien nvarchar(30),
@HinhAnh nvarchar(70),
@Gia int,
@CameraHot int
as
	begin
		insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia,CameraHot) 
		values(@TenCamera,@MaLoai,@DoPhanGiai,@Chip,@OngKinh,@TamQuanSat,@NguonDien,@HinhAnh,@Gia,@CameraHot)
	end
GO
/****** Object:  StoredProcedure [dbo].[ADD_ChiTietHoaDonNhap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ADD_ChiTietHoaDonNhap]
@MaCTHoaDonNhap nvarchar(30),
@MaHoaDonNhap nvarchar(30),
@MaCamera int,
@SoLuong int,
@DonGia int
as
begin
	insert into ChiTietHoaDonNhap(MaCTHoaDonNhap,MaHoaDonNhap,MaCamera,SoLuong,DonGia) 
	values(@MaCTHoaDonNhap,@MaHoaDonNhap,@MaCamera,@SoLuong,@DonGia)

	update HoaDonNhap
	set TongTien=(select sum(SoLuong*DonGia) 
					from ChiTietHoaDonNhap 
					where ChiTietHoaDonNhap.MaHoaDonNhap=@MaHoaDonNhap
					group by ChiTietHoaDonNhap.MaHoaDonNhap
					)
	where HoaDonNhap.MaHoaDonNhap=@MaHoaDonNhap
end
GO
/****** Object:  StoredProcedure [dbo].[Add_HangSanXuat]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Add_HangSanXuat]
@TenHang nvarchar(50),
@ThongTin nvarchar(max)
as
	begin
		insert into HangSanXuat(TenHang,ThongTin) values(@TenHang,@ThongTin)
	end

GO
/****** Object:  StoredProcedure [dbo].[ADD_HoaDonNhap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ADD_HoaDonNhap]
@MaHoaDonNhap nvarchar(30),
@MaNCC int,
@TongTien int,
@NgayNhap date
as
	begin
		insert into HoaDonNhap(MaHoaDonNhap,MaNCC,TongTien,NgayNhap)
		values(@MaHoaDonNhap,@MaNCC,@TongTien,@NgayNhap)
	end
GO
/****** Object:  StoredProcedure [dbo].[Add_LoaiCamera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Add_LoaiCamera]
@MaHang int,
@TenLoai nvarchar(50),
@MoTa nvarchar(max)
as
	begin
		insert into LoaiCamera(MaHang,TenLoai,MoTa) values(@MaHang,@TenLoai,@MoTa)
	end

GO
/****** Object:  StoredProcedure [dbo].[Add_NhaCungCap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_NhaCungCap]
@TenNCC nvarchar(max),
@DiaChi nvarchar(max),
@SDT nvarchar(10),
@Email nvarchar(30)
as
	begin
		insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(@TenNCC,@DiaChi,@SDT,@Email)
	end

GO
/****** Object:  StoredProcedure [dbo].[CancelThisOrder]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CancelThisOrder]
@MaDonHang nvarchar(30)
as
	begin
		update DonHang
		set TrangThaiDonHang=N'Đã hủy'
		where MaDonHang=@MaDonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[ComfirmThisOrder]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ComfirmThisOrder]
@MaDonHang nvarchar(30)
as
	begin
		update DonHang
		set TrangThaiDonHang=N'Đã xác thực'
		where MaDonHang=@MaDonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[Create_ChiTietDH]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Create_ChiTietDH]
@MaDonHang nvarchar(50),
@MaCamera int,
@SoLuong int,
@DonGia int
as
begin
 INSERT INTO ChiTietDonHang
                        (MaDonHang, 
                         MaCamera, 
                         SoLuong,
						 DonGia
                        )
						values(@MaDonHang,@MaCamera,@SoLuong,@DonGia)
                         

end
GO
/****** Object:  StoredProcedure [dbo].[Create_DonHang]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Create_DonHang]
(@MaDonHang              VARCHAR(30), 
 @MaKhachHang          int, 
 @NgayTao         date,  
 @TrangThaiDonHang         NVARCHAR(30),
 @TrangThaiVanChuyen         NVARCHAR(30),
 @TrangThaiThanhToan         NVARCHAR(30),
 @TongTien         int,
 @TenKhachHang         NVARCHAR(50),
 @DiaChi         NVARCHAR(70),
 @SDT         NVARCHAR(10),
 @GhiChu         NVARCHAR(50)
)
AS
    BEGIN
        INSERT INTO DonHang
                (MaDonHang, 
                 MaKhachHang, 
                 NgayTao,
				 TrangThaiDonHang,
				 TrangThaiVanChuyen,
				 TrangThaiThanhToan,
				 TongTien,
				 TenKhachHang,
				 DiaChi,
				 SDT,
				 GhiChu
                )
                VALUES
                (@MaDonHang, 
                 @MaKhachHang, 
                 @NgayTao,
				 @TrangThaiDonHang,
				 @TrangThaiVanChuyen,
				 @TrangThaiThanhToan,
				 @TongTien,
				 @TenKhachHang,
				 @DiaChi,
				 @SDT,
				 @GhiChu)
		END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Camera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Camera]
@MaCamera int
as
	begin
		delete from Camera where MaCamera=@MaCamera
	end
GO
/****** Object:  StoredProcedure [dbo].[Delete_HangSanXuat]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Delete_HangSanXuat]
@MaHang int
as
	begin
		delete from HangSanXuat where MaHang=@MaHang
	end
GO
/****** Object:  StoredProcedure [dbo].[Delete_LoaiCamera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Delete_LoaiCamera]
@MaLoai int
as
	begin
		delete from LoaiCamera where MaLoai=@MaLoai
	end
GO
/****** Object:  StoredProcedure [dbo].[Delete_NhaCungCap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_NhaCungCap]
@MaNCC int
as
	begin
		delete from NhaCungCap where MaNCC=@MaNCC
	end
GO
/****** Object:  StoredProcedure [dbo].[Get_MenuLoai]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get_MenuLoai]
as
	begin
		select H.MaHang,TenHang,MaLoai,TenLoai 
		from HangSanXuat H inner join LoaiCamera L on H.MaHang=L.MaHang
	end
GO
/****** Object:  StoredProcedure [dbo].[GetSP_ByMaLoai]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetSP_ByMaLoai]
@MaLoai int
as
	begin
		select *
		from Camera
		where MaLoai=@MaLoai
	end
GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Register]
@TenKhachHang nvarchar(30),
@Email nvarchar(50),
@MatKhau nvarchar(20),
@GioiTinh int,
@SDT nvarchar(10),
@DiaChi nvarchar(100)
as
	begin
		insert into KhachHang(TenKhachHang,Email,MatKhau,GioiTinh,SDT,DiaChi) 
		values(@TenKhachHang,@Email,@MatKhau,@GioiTinh,@SDT,@DiaChi)
	end
GO
/****** Object:  StoredProcedure [dbo].[RestoreOrder]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RestoreOrder]
@MaDonHang nvarchar(30)
as
	begin
		update DonHang
		set TrangThaiDonHang=N'Chưa xác thực'
		where MaDonHang=@MaDonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[Search_Product]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Search_Product]
@KeyWord nvarchar(100)
as
	begin
			select *
			from Camera
			where TenCamera LIKE '%'+@KeyWord+'%'or CONVERT(nvarchar,Gia)=@KeyWord or DoPhanGiai LIKE '%'+@KeyWord+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_CTDonHang_ID]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CTDonHang_ID]
@MaDonHang nvarchar(30)
as
	begin
		select TenCamera,SoLuong,DonGia,HinhAnh
		from DonHang D inner join ChiTietDonHang C on D.MaDonHang=C.MaDonHang inner join Camera S on C.MaCamera=S.MaCamera
		where D.MaDonHang=@MaDonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_CTHoaDonNhap_ID]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CTHoaDonNhap_ID]
@MaHoaDonNhap nvarchar(30)
as
	begin
		select MaCTHoaDonNhap,MaCamera,SoLuong,DonGia
		from HoaDonNhap H inner join ChiTietHoaDonNhap C on H.MaHoaDonNhap=C.MaHoaDonNhap
		where H.MaHoaDonNhap=@MaHoaDonNhap
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_DonHang]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DonHang]
as
	begin
		select * from DonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_DonHang_get_by_id]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DonHang_get_by_id]
@MaDonHang NVARCHAR(50)
AS
    BEGIN
        SELECT h.MaDonHang, 
               h.TrangThaiDonHang, 
               h.TrangThaiVanChuyen,
			   h.TrangThaiThanhToan,
			   h.TenKhachHang,
			   h.DiaChi,
			   h.TongTien,
			   h.SDT,
			   h.GhiChu,
			   h.NgayTao
        FROM DonHang h
      where  h.MaDonHang = @MaDonHang;
    END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_ChiTietSP]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Get_ChiTietSP]
@MaCamera int
as
	begin
		select * 
		from Camera
		where MaCamera=@MaCamera
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_HangSanXuat]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_Get_HangSanXuat]
as
	begin
		select*from HangSanXuat
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_NhaCungCap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Get_NhaCungCap]
as
	begin
		select *
		from NhaCungCap
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_SanPhamHot]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Get_SanPhamHot]
as
	begin
		select * 
		from Camera
		where CameraHot=1
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAll_SanPham]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_GetAll_SanPham]
as
	begin
		select *
		from Camera
		where CameraHot=0
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetID_Camera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_GetID_Camera]
@MaCamera int
as
	begin
		select MaCamera,C.MaLoai,TenLoai,TenCamera,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia
		from Camera C inner join LoaiCamera L on C.MaLoai=L.MaLoai where MaCamera=@MaCamera
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetID_HangSanXuat]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_GetID_HangSanXuat]
@MaHang int
as
	begin
		select*from HangSanXuat where MaHang=@MaHang
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetID_LoaiCamera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_GetID_LoaiCamera]
@MaLoai int
as
	begin
		select*from LoaiCamera where MaLoai=@MaLoai
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetID_NhaCungCap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_GetID_NhaCungCap]
@MaNCC int
as
	begin
		select*from NhaCungCap where MaNCC=@MaNCC
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetSP_ByMaLoai]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_GetSP_ByMaLoai]
@MaLoai int
as
	begin
		select *
		from Camera
		where MaLoai=@MaLoai
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_guest_get_by_email_password]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_guest_get_by_email_password]
(@email varchar(30), @matkhau varchar(60))
AS
    BEGIN
        SELECT  MaKhachHang               , 
					 TenKhachHang           ,
					 AnhDaiDien		,
					 Email          ,
					 GioiTinh,
					 SDT,
					 DiaChi
        FROM KhachHang
      where  Email = @email and MatKhau = @matkhau ;
    END;
GO
/****** Object:  StoredProcedure [dbo].[SP_PAGE_Camera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_PAGE_Camera]

@Pageindex int,
@Pagesize int

as
	begin
		select TenHang,TenLoai,MaCamera,TenCamera,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia,CameraHot 
		from Camera C inner join LoaiCamera L on C.MaLoai=L.MaLoai inner join HangSanXuat H on L.MaHang=H.MaHang 
		order by MaCamera asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(TenCamera) as totalcount from Camera
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_page_DonHangChuaXacThuc]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_page_DonHangChuaXacThuc]

@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Chưa xác thực' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_page_DonHangDaGiao]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_page_DonHangDaGiao]

@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Đã giao' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_page_DonHangDaHuy]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_page_DonHangDaHuy]
@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Đã hủy' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_page_DonHangDaXacThuc]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_page_DonHangDaXacThuc]

@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Đã xác thực' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_PAGE_HangSanXuat]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_PAGE_HangSanXuat]

@Pageindex int,
@Pagesize int

as
	begin
		select * from HangSanXuat order by MaHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(TenHang) as totalcount from HangSanXuat
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_PAGE_HoaDonNhap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_PAGE_HoaDonNhap]

@Pageindex int,
@Pagesize int

as
	begin
		select MaHoaDonNhap,TenNCC,N.MaNCC,TongTien,NgayNhap
		from HoaDonNhap H inner join NhaCungCap N on H.MaNCC=N.MaNCC
		order by MaHoaDonNhap asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaHoaDonNhap) as totalcount from HoaDonNhap
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_PAGE_LoaiCamera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[SP_PAGE_LoaiCamera]

@Pageindex int,
@Pagesize int

as
	begin
		select * from LoaiCamera order by MaLoai asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(TenLoai) as totalcount from LoaiCamera
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_PAGE_NhaCungCap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_PAGE_NhaCungCap]

@Pageindex int,
@Pagesize int

as
	begin
		select * from NhaCungCap order by MaNCC asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaNCC) as totalcount from NhaCungCap
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_username_password]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_user_get_by_username_password]
(@taikhoan varchar(30), @matkhau varchar(60))
AS
    BEGIN
        SELECT  MaNguoiDung               , 
					 TenNguoiDung           ,
					 Anh          ,
					 TaiKhoan 
        FROM NguoiDung
      where  TaiKhoan = @taikhoan and MatKhau = @matkhau ;
    END;
GO
/****** Object:  StoredProcedure [dbo].[Update_Camera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_Camera]
@MaCamera int,
@TenCamera nvarchar(100),
@MaLoai int,
@DoPhanGiai nvarchar(30),
@Chip nvarchar(20),
@OngKinh nvarchar(40),
@TamQuanSat nvarchar(30),
@NguonDien nvarchar(30),
@HinhAnh nvarchar(70),
@Gia int
as
	begin
		update Camera 
		set TenCamera=@TenCamera, 
		MaLoai=@MaLoai, 
		DoPhanGiai=@DoPhanGiai,
		Chip=@Chip,
		OngKinh=@OngKinh,
		TamQuanSat=@TamQuanSat,
		NguonDien=@NguonDien,
		HinhAnh=@HinhAnh,
		Gia=@Gia
		where MaCamera=@MaCamera
	end
GO
/****** Object:  StoredProcedure [dbo].[Update_HangSanXuat]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_HangSanXuat]
@MaHang int,
@TenHang nvarchar(50),
@ThongTin nvarchar(MAX)
as
	begin
		update HangSanXuat set TenHang=@TenHang, ThongTin=@ThongTin 
		where MaHang=@MaHang
	end
GO
/****** Object:  StoredProcedure [dbo].[Update_Hot]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_Hot]
@MaCamera int
as
	begin
		declare @CamHot int
		select @CamHot= CameraHot 
		from Camera where MaCamera=@MaCamera
		IF @CamHot=0	
			update Camera set CameraHot=1 where MaCamera=@MaCamera
		ELSE
			update Camera set CameraHot=0 where MaCamera=@MaCamera
	end
GO
/****** Object:  StoredProcedure [dbo].[Update_LoaiCamera]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_LoaiCamera]
@MaLoai int,
@MaHang int,
@TenLoai nvarchar(50),
@MoTa nvarchar(MAX)
as
	begin
		update LoaiCamera set MaHang=@MaHang, TenLoai=@TenLoai, MoTa=@MoTa 
		where MaLoai=@MaLoai
	end
GO
/****** Object:  StoredProcedure [dbo].[Update_NhaCungCap]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_NhaCungCap]
@MaNCC int,
@TenNCC nvarchar(max),
@DiaChi nvarchar(max),
@SDT nvarchar(10),
@Email nvarchar(30)
as
	begin
		update NhaCungCap 
		set TenNCC=@TenNCC,
			DiaChi=@DiaChi,
			SDT=@SDT,
			Email=@Email
		where MaNCC=@MaNCC
	end
GO
/****** Object:  StoredProcedure [dbo].[Update_Status]    Script Date: 7/15/2021 11:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Update_Status]
@MaDonHang NVARCHAR(50),
@TrangThaiDonHang nvarchar(30),
@TrangThaiVanChuyen nvarchar(30),
@TrangThaiThanhToan nvarchar(30)
AS
    BEGIN
		update DonHang
		set TrangThaiDonHang=@TrangThaiDonHang,
			TrangThaiVanChuyen=@TrangThaiVanChuyen,
			TrangThaiThanhToan=@TrangThaiThanhToan
		where MaDonHang=@MaDonHang
	END
GO
