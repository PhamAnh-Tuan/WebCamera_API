--create database WebCamera_API
use WebCamera_API
go

create table HangSanXuat
(
MaHang int identity primary key,
TenHang nvarchar(30) not null,
ThongTin nvarchar(MAX) not null
)
go
create table LoaiCamera
(
MaLoai int identity primary key,
MaHang int foreign key(MaHang) references HangSanXuat(MaHang) on delete cascade on update cascade,
TenLoai nvarchar(30) not null,
MoTa nvarchar(MAX) not null
)
go
create table Camera
(
MaCamera int identity primary key,
TenCamera nvarchar(100) not null,
MaLoai int foreign key(MaLoai) references LoaiCamera(MaLoai) on delete cascade on update cascade,
DoPhanGiai nvarchar(30) not null,
Chip nvarchar(20) not null,
OngKinh nvarchar(40) not null,
TamQuanSat nvarchar(30) not null,
NguonDien nvarchar(30),
HinhAnh nvarchar(70),
Gia int,
CameraHot bit,
SoLuong int
)

go
create table NguoiDung
(
MaNguoiDung int identity primary key,
TenNguoiDung nvarchar(50),
Anh nvarchar(50),
TaiKhoan nvarchar(50) not null,
MatKhau nvarchar(Max)
)

create table KhachHang
(
MaKhachHang int identity primary key,
TenKhachHang nvarchar(30) unique not null,
AnhDaiDien nvarchar(70) null,
Email nvarchar(50) not null,
MatKhau nvarchar(20) not null,
GioiTinh int not null,
SDT nvarchar(10) not null,
DiaChi nvarchar(100) not null
)
go
create table DonHang
(
MaDonHang nvarchar(30) primary key,
MaKhachHang int foreign key(MaKhachHang) references KhachHang(MaKhachHang) on delete cascade on update cascade,
NgayTao date not null,
TongTien int,
TenKhachHang nvarchar(50),
DiaChi nvarchar(70),
SDT nvarchar(10),
GhiChu nvarchar(50),
TrangThaiDonHang nvarchar(30) not null,
TrangThaiVanChuyen nvarchar(30) not null,
TrangThaiThanhToan nvarchar(30) not null
)

go

create table ChiTietDonHang
(
MaChiTietDonHang int identity primary key,
MaDonHang nvarchar(30) foreign key(MaDonHang) references DonHang(MaDonHang) on delete cascade on update cascade,
MaCamera int foreign key(MaCamera) references Camera(MaCamera) on delete cascade on update cascade,
SoLuong int not null,
DonGia int
)
go
create table NhaCungCap
(
MaNCC int identity primary key not null,
TenNCC nvarchar(max) not null,
DiaChi nvarchar(max) not null,
SDT nvarchar(10) not null,
Email nvarchar(30) not null
)

create table HoaDonNhap
(
MaHoaDonNhap nvarchar(30) primary key,
MaNCC int foreign key(MaNCC) references NhaCungCap(MaNCC) on delete cascade on update cascade,
TongTien int not null,
NgayNhap datetime
)
go
create table ChiTietHoaDonNhap
(
MaCTHoaDonNhap nvarchar(30) primary key,
MaHoaDonNhap nvarchar(30) foreign key(MaHoaDonNhap) references HoaDonNhap(MaHoaDonNhap) on delete cascade on update cascade,
MaCamera int foreign key(MaCamera) references Camera(MaCamera) on delete cascade on update cascade,
SoLuong int not null,
DonGia int not null
)
go
insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(N'Thiết Bị An Ninh An Toàn VITECK- Công Ty TNHH Giải Pháp Công Nghệ VITECK',N'180 Trần Quốc Toản, KP. 4, P. Bình Đa, TP. Biên Hòa, Đồng Nai','0966788876','info@viteck.vn')
go
insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(N'Khôi Ngô Security - Công Ty TNHH Khôi Ngô',N'22A Kỳ Đồng, P. 9, Q. 3, Tp. Hồ Chí Minh (TPHCM)','0908375212','contact@khoingo.net')
go
insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(N'Camera Kiến Hưng - Công Ty TNHH TM & DV Công Nghệ Kiến Hưng',N'VP Miền Bắc: Số 31, Ngõ 44, P. Mai Dịch, Q. Cầu Giấy, Hà Nội','0868796078','hatientrong886@gmail.com')
go
insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(N'Camera Quang Mai - Công Ty TNHH MTV Tin Học Viễn Thông Quang Mai',N'485/46 Phan Văn Trị, P. 5, Q. Gò Vấp, Tp. Hồ Chí Minh (TPHCM)','0903517025','tuyetphuongkt@quangmai.net')
go
insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(N'Camera Thiên Long - Công Ty TNHH Công Nghệ Kỹ Thuật Thiên Long',N'Số 501, Đại Lộ Bình Dương, P. Hiệp Thành, TP. Thủ Dầu Một, Bình Dương','0901669916','voquang@camerabinhduong.vn')

select * from DonHang


create PROCEDURE Create_DonHang
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

create proc Create_ChiTietDH
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
go


create proc SP_Get_HangSanXuat
as
	begin
		select*from HangSanXuat
	end
go
create proc SP_PAGE_HangSanXuat

@Pageindex int,
@Pagesize int

as
	begin
		select * from HangSanXuat order by MaHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(TenHang) as totalcount from HangSanXuat
	end
go

create proc SP_GetID_HangSanXuat
@MaHang int
as
	begin
		select*from HangSanXuat where MaHang=@MaHang
	end
go

create proc Add_HangSanXuat
@TenHang nvarchar(50),
@ThongTin nvarchar(max)
as
	begin
		insert into HangSanXuat(TenHang,ThongTin) values(@TenHang,@ThongTin)
	end

go
create proc Update_HangSanXuat
@MaHang int,
@TenHang nvarchar(50),
@ThongTin nvarchar(MAX)
as
	begin
		update HangSanXuat set TenHang=@TenHang, ThongTin=@ThongTin 
		where MaHang=@MaHang
	end
go

create proc Delete_HangSanXuat
@MaHang int
as
	begin
		delete from HangSanXuat where MaHang=@MaHang
	end
go

--loại camera

insert into LoaiCamera(MaHang,TenLoai,MoTa) values(1,N'Camera IP',N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
insert into LoaiCamera(MaHang,TenLoai,MoTa) values(1,N'Camera AI',N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')


insert into LoaiCamera(MaHang,TenLoai,MoTa) values(2,N'Camera IP',N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
insert into LoaiCamera(MaHang,TenLoai,MoTa) values(2,N'Camera IP Wifi không dây',N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')

insert into LoaiCamera(MaHang,TenLoai,MoTa) values(3,N'Camera IP',N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
insert into LoaiCamera(MaHang,TenLoai,MoTa) values(3,N'Camera Speedome',N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')
insert into LoaiCamera(MaHang,TenLoai,MoTa) values(3,N'Camera Analog',N' là dòng camera giá rẻ với chất lượng tương đối tốt thường được sử dụng cho các hộ gia đình, phòng trọ, cửa hàng mua sắm tiện ích, văn phòng công ty, căn hộ giá rẻ cần chất lượng hình ảnh camera vừa phải để quan sát')

go


create proc SP_PAGE_LoaiCamera

@Pageindex int,
@Pagesize int

as
	begin
		select * from LoaiCamera order by MaLoai asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(TenLoai) as totalcount from LoaiCamera
	end
go

create proc SP_GetID_LoaiCamera
@MaLoai int
as
	begin
		select*from LoaiCamera where MaLoai=@MaLoai
	end
go

create proc Add_LoaiCamera
@MaHang int,
@TenLoai nvarchar(50),
@MoTa nvarchar(max)
as
	begin
		insert into LoaiCamera(MaHang,TenLoai,MoTa) values(@MaHang,@TenLoai,@MoTa)
	end

go
create proc Update_LoaiCamera
@MaLoai int,
@MaHang int,
@TenLoai nvarchar(50),
@MoTa nvarchar(MAX)
as
	begin
		update LoaiCamera set MaHang=@MaHang, TenLoai=@TenLoai, MoTa=@MoTa 
		where MaLoai=@MaLoai
	end
go

create proc Delete_LoaiCamera
@MaLoai int
as
	begin
		delete from LoaiCamera where MaLoai=@MaLoai
	end
go


-- Camera
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Dahua IP IPC-A22EP-imou',1,N'2.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'Từ 10-15m',N'DC 12V – 1000mA','IMOU-IPC-A22EP.jpg',580000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'IMOU Ranger Pro IPC-A26HP',1,N'2.0 Megapixel',N'Chip CMOS',N'3.6mmm góc nhìn 90 độ',N'10 mét',N'5v/2A','45981_dahua_miuo.jpg',990000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Dahua IPC-G42P-imou',1,N'4Megapixel CMOS 1/2.7',N'',N'Loại 2.8mm',N'30m',N'DC 5V','32389_ipc_g42p_imou_1.jpg',1015000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'IP Fisheye Dahua DH-IPC-EBW81230P',1,N'12.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 5-10m',N'DC 12V','36575_p_26330_dahua_dh_ipc_ebw81230p.jpg',2025000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'IP Fisheye Dahua DH-IPC-EB5531P',1,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','36574_p_25379_dahua_dh_ipc_eb5531p.jpg',7000000)

--camera AI dahua

insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'IP AI 4.0MP DAHUA DH-IPC-HDW3441TMP-AS',2,N'4.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'50m',N'DC 12V','DAHUA-IPC-HDW3441TMP-AS.jpg',3924000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'IP AI 2.0MP DAHUA DH-IPC-HDW3241TMP-AS',2,N'4.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'50m',N'DC 12V','DAHUA-IPC-HDW3441TMP-AS.jpg',3924000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP PRO-AI 2.0MP DAHUA DH-IPC-HFW5241EP-S',2,N'2.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'50m',N'DC 12V','camera-ip-pro-ai-2-0mp-dahua-dh-ipc-hfw5241ep-s.jpg',5546000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP AI 8MP DAHUA DH-IPC-HDW3849HP-AS-PV',2,N'8.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'30m',N'DC 12V','DAHUA-IPC-HDW3441TMP-AS.jpg',3924000)
--
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP PRO-AI 2.0MP DAHUA DH-IPC-HFW5241TP-AS-PV',2,N'2.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'60m',N'DC 12V','DAHUA-IPC-HDW3441TMP-AS.jpg',3924000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP AI 2.0MP DAHUA DH-IPC-HDBW3241EP-AS',2,N'4.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'50m',N'DC 12V','DAHUA-IPC-HDBW3241EP-AS.jpg',3924000)
--
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP AI 2.0MP Dome DAHUA DH-IPC-HDBW3241RP-ZAS',2,N'2.0 Megapixel',N'Chip CMOS',N'Loại 2.7 – 13.5mm',N'40m',N'DC 12V','camera-ip-ai-2-0mp-dome-dahua-dh-ipc-hdbw3241rp-zas.jpg',3924000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP Pro-Ai 2.0MP DAHUA DH-IPC-HDW5241TMP-AS',2,N'2.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'50m',N'DC 12V','camera-ip-pro-ai-2-0mp-dahua-dh-ipc-hdw5241tmp-as.jpg',3924000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP AI 4.0MP DAHUA DH-IPC-HDBW3441RP-ZAS',2,N'4.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'40m',N'DC 12V','DAHUA-IPC-HDBW3441RP-ZAS.jpg',7986000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP AI 2.0MP DAHUA DH-IPC-HDBW3241EP-S',2,N'2.0 Megapixel',N'Chip CMOS',N'Loại 3.6mm',N'50m',N'DC 12V','DAHUA-IPC-HDBW3241EP-S.jpg',3290000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP bán cầu 4.0MP HiLook IPC-D640H-V',3,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-ban-cau-4mp-hilook-ipc-d640h-v-250x250.jpg',5170000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP Dome 2MP HiLook IPC-D121H',3,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','HiLook-IPC-D121H.jpg',1440000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP bán cầu 5MP HiLook IPC-T651H-Z',3,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-ban-cau-5mp-hilook-ipc-t651h-z.jpg',5650000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP bán cầu 2MP HiLook IPC-T621H-Z',3,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-ban-cau-2mp-hilook-ipc-d620h-v-2.jpg',4830000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP thân trụ 2MP HiLook IPC-B620H-Z',3,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-than-tru-2mp-hilook-ipc-b620h-z-1.jpg',4350000)

go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP thân trụ hồng ngoại 2MP HiLook IPC-B120W',4,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-than-tru-hong-ngoai-2mp-hilook-ipc-b120w.jpg',1540000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP Cube 2MP hồng ngoại Hilook IPC-C120-D/W(B)',4,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-cube-2mp-hong-ngoai-hilook-ipc-c120-d-wb-1.jpg',1650000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP Quay quét 2MP hồng ngoại Hilook IPC-P220-D/W',4,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-quay-quet-2mp-hong-ngoai-hilook-ipc-p220-d-w-1.jpg',1335000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP Cube 2MP hồng ngoại Hilook IPC-C220H-D/W',4,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','camera-ip-cube-2mp-hong-ngoai-hilook-ipc-c220h-d-w-1.jpg',2170000)
go
insert into Camera(TenCamera,MaLoai,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia) 
values(N'Camera IP có kết nối Wifi 2MP HiLook IPC-B120-D/W',4,N'5.0 Megapixel',N'Chip CMOS',N'Loại 1.98mm',N'Từ 20-30m',N'DC 12V','HiLook-IPC-B120-D-W-1.jpg',4350000)





go
create proc SP_PAGE_Camera

@Pageindex int,
@Pagesize int

as
	begin
		select TenHang,TenLoai,MaCamera,TenCamera,DoPhanGiai,Chip,OngKinh,TamQuanSat,NguonDien,HinhAnh,Gia,CameraHot 
		from Camera C inner join LoaiCamera L on C.MaLoai=L.MaLoai inner join HangSanXuat H on L.MaHang=H.MaHang 
		order by MaCamera asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(TenCamera) as totalcount from Camera
	end
go


create proc SP_GetID_Camera
@MaCamera int
as
	begin
		select*from Camera where MaCamera=@MaCamera
	end
go

create proc Add_Camera
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
go


create proc Update_Camera
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
go

create proc Delete_Camera
@MaCamera int
as
	begin
		delete from Camera where MaCamera=@MaCamera
	end
go


create proc Get_MenuLoai
as
	begin
		select H.MaHang,TenHang,MaLoai,TenLoai 
		from HangSanXuat H inner join LoaiCamera L on H.MaHang=L.MaHang
	end
go


--Người dùng
create PROCEDURE sp_user_get_by_username_password
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
go

exec sp_user_get_by_username_password 'tuanphamacb05@gmail.com','1234'
--Khách hàng

create PROCEDURE sp_guest_get_by_email_password
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
go

--trang home
create proc SP_Get_SanPhamHot
as
	begin
		select * 
		from Camera
		where CameraHot=1
	end
go

create proc SP_GetAll_SanPham
as
	begin
		select *
		from Camera
		where CameraHot=0
	end
go

create proc SP_Get_ChiTietSP
@MaCamera int
as
	begin
		select * 
		from Camera
		where MaCamera=@MaCamera
	end
go

create proc SP_GetSP_ByMaLoai
@MaLoai int
as
	begin
		select *
		from Camera
		where MaLoai=@MaLoai
	end
go

create proc Search_Product
@KeyWord nvarchar(100)
as
	begin
			select *
			from Camera
			where TenCamera LIKE '%'+@KeyWord+'%'or CONVERT(nvarchar,Gia)=@KeyWord or DoPhanGiai LIKE '%'+@KeyWord+'%'
	end
go

exec Search_Product 'ranger_pro'
go

create proc GetSP_ByMaLoai
@MaLoai int
as
	begin
		select *
		from Camera
		where MaLoai=@MaLoai
	end
go


create proc Register
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
go
-------------

create proc SP_PAGE_NhaCungCap

@Pageindex int,
@Pagesize int

as
	begin
		select * from NhaCungCap order by MaNCC asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaNCC) as totalcount from NhaCungCap
	end
go

create proc SP_GetID_NhaCungCap
@MaNCC int
as
	begin
		select*from NhaCungCap where MaNCC=@MaNCC
	end
go

create proc Add_NhaCungCap
@TenNCC nvarchar(max),
@DiaChi nvarchar(max),
@SDT nvarchar(10),
@Email nvarchar(30)
as
	begin
		insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(@TenNCC,@DiaChi,@SDT,@Email)
	end

go
create proc Update_NhaCungCap
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
go

create proc Delete_NhaCungCap
@MaNCC int
as
	begin
		delete from NhaCungCap where MaNCC=@MaNCC
	end
go
-----------

create proc SP_PAGE_HoaDonNhap

@Pageindex int,
@Pagesize int

as
	begin
		select MaHoaDonNhap,TenNCC,N.MaNCC,TongTien,NgayNhap
		from HoaDonNhap H inner join NhaCungCap N on H.MaNCC=N.MaNCC
		order by MaHoaDonNhap asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaHoaDonNhap) as totalcount from HoaDonNhap
	end
go


create proc SP_CTHoaDonNhap_ID
@MaHoaDonNhap int
as
	begin
		select MaCTHoaDonNhap,MaCamera,SoLuong,DonGia
		from HoaDonNhap H inner join ChiTietHoaDonNhap C on H.MaHoaDonNhap=C.MaHoaDonNhap
		where H.MaHoaDonNhap=@MaHoaDonNhap
	end
go
---------------------------

create proc ADD_HoaDonNhap
@MaHoaDonNhap nvarchar(30),
@MaNCC int,
@TongTien int,
@NgayNhap date
as
	begin
		insert into HoaDonNhap(MaHoaDonNhap,MaNCC,TongTien,NgayNhap)
		values(@MaHoaDonNhap,@MaNCC,@TongTien,@NgayNhap)
	end
go

go
create proc ADD_ChiTietHoaDonNhap
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
go
---------------------------
create proc Add_NhaCungCap
@TenNCC nvarchar(max),
@DiaChi nvarchar(max),
@SDT nvarchar(10),
@Email nvarchar(30)
as
	begin
		insert into NhaCungCap(TenNCC,DiaChi,SDT,Email) values(@TenNCC,@DiaChi,@SDT,@Email)
	end

go
create proc sp_DonHang
as
	begin
		select * from DonHang
	end
go
create proc sp_page_DonHangChuaXacThuc
@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Chưa xác thực' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
go
--exec sp_page_DonHangChuaXacThuc 1,1
create proc sp_page_DonHangDaXacThuc

@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Đã xác thực' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
go

--phân trang đơn hàng đã giao
create proc sp_page_DonHangDaGiao

@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Đã giao' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
go

create proc sp_page_DonHangDaHuy
@Pageindex int,
@Pagesize int

as
	begin
		select *from DonHang where TrangThaiDonHang=N'Đã hủy' order by MaDonHang asc offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
		select COUNT(MaDonHang) as totalcount from DonHang
	end
go

--Khôi phục đơn hàng
create proc RestoreOrder
@MaDonHang nvarchar(30)
as
	begin
		update DonHang
		set TrangThaiDonHang=N'Chưa xác thực'
		where MaDonHang=@MaDonHang
	end
go
--Xác thực đơn hàng
create proc ComfirmThisOrder
@MaDonHang nvarchar(30)
as
	begin
		update DonHang
		set TrangThaiDonHang=N'Đã xác thực'
		where MaDonHang=@MaDonHang
	end
go

create proc SP_CTDonHang_ID
@MaDonHang nvarchar(30)
as
	begin
		select TenCamera,SoLuong,DonGia,HinhAnh
		from DonHang D inner join ChiTietDonHang C on D.MaDonHang=C.MaDonHang inner join Camera S on C.MaCamera=S.MaCamera
		where D.MaDonHang=@MaDonHang
	end
go

create proc CancelThisOrder
@MaDonHang nvarchar(30)
as
	begin
		update DonHang
		set TrangThaiDonHang=N'Đã hủy'
		where MaDonHang=@MaDonHang
	end
go

--select*from DonHang
-------
create PROCEDURE SP_DonHang_get_by_id
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

go

---

create PROCEDURE Update_Status
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
go

create proc Comfirm_Recover
@MaDonHang nvarchar(30)
as
	begin
		update DonHang
		set TrangThaiDonHang=N'Đổi trả'
		where MaDonHang=@MaDonHang
	end
go

create proc SP_Get_NhaCungCap
as
	begin
		select *
		from NhaCungCap
	end

select NgayTao, DoanhThu=sum(SoLuong*DonGia)
from DonHang D inner join ChiTietDonHang C on D.MaDonHang=C.MaDonHang
group by NgayTao