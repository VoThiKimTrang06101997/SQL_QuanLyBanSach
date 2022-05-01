create database	if not exists QLBanSach;
use QLBanSach;

create table if not exists KhachHang(
	maKH 			varchar(30),
    taikhoan		varchar(100),
    matkhau			varchar(30),
    email			varchar(50),
    diachi			varchar(255),
    dienthoai		varchar(30),
    gioitinh		varchar(30),
    ngaysinh		date,
    hoten			varchar(255),
    primary key (maKH)
        
);
create table if not exists DonHang(
	madonhang			varchar(30),
    dathanhtoan			boolean,
    ngaygiao			date,
    ngaydat				date,
    tinhtranggiaohang	varchar(30),
    maKH				varchar(30),
    
     primary key (madonhang) 
);
alter table DonHang
add constraint fk_KH_DH
foreign key (maKH) references KhachHang(maKH);


/--------------
create table if not exists Sach(
	masach				varchar(30),
    tensach				varchar(255),
    giaban				double,
    mota				varchar(1000),
    anhbia				binary,
    ngaycapnhat			date,
    soluongton			float,
    primary key (masach) 
);

create table if not exists ChiTietDonHang(
	machitiet			varchar(30),
	masach				varchar(30),
    madonhang			varchar(30),
    soluong				double,
    gia					double,
      
	primary key (machitiet) 
);
Alter table ChiTietDonHang
add constraint fk_DH_CTDH
foreign key (madonhang) references DonHang(madonhang);

Alter table ChiTietDonHang
add constraint fk_Sach_CTDH
foreign key (masach) references Sach(masach);

/-----------------------
create table if not exists ChuDe(
	machude				varchar(30),
	tenchude			varchar(255),
         
	primary key (machude) 
);
Alter table Sach
add column machude varchar(30) not null,
add constraint fk_ChuDe_Sach
foreign key (machude) references ChuDe(machude);

/------------------------------
create table if not exists NhaXuatBan(
	maNSX				varchar(30),
	tenNXB				varchar(255),
    dienthoai			varchar(30),
	diachi				varchar(255),
         
	primary key (maNSX) 
);
Alter table Sach
add column maNSX varchar(30) not null,
add constraint fk_NhaSX_Sach
foreign key (maNSX) references NhaXuatBan(maNSX);

/--------------------------------
create table if not exists TacGia(
	matacgia			varchar(30),
	tentacgia			varchar(255),
    dienthoai			varchar(30),
	diachi				varchar(255),
	tieusu				varchar(2000),
	primary key (matacgia) 
);

create table if not exists TacGia_Sach(
	matacgia_sach		varchar(30),
    matacgia			varchar(30),
    masach				varchar(30),
	vaitro				varchar(255),
    vitri				varchar(255),
	primary key (matacgia_sach) 
);

Alter table TacGia_Sach
add constraint fk_tacgia_Sach
foreign key (matacgia) references TacGia(matacgia);

Alter table TacGia_Sach
add constraint fk_Sach_tacgia
foreign key (masach) references Sach(masach);