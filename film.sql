create database TicketFilm;
use ticketFilm;
create table tblPhim (
PhimID int primary key,
Ten_phim varchar (30),
Loai_phim varchar (25),
Thoi_Gian int
);

create table tblPhong(
PhongID int primary key,
Ten_phong varchar (20),
Trang_thai tinyint
);

create table tblGhe(
GheID int primary key,
PhongID int,
foreign key (PhongID) references tblPhong(PhongID),
So_ghe varchar(10)
);

create table tblVe (
PhimID int,
foreign key (PhimID) references tblPhim(PhimID),
GheID int,
foreign key (GheID) references tblGhe(GheID),
Ngay_chieu datetime,
Trang_thai varchar (20),
primary key(PhimID, GheID)
);

-- câu 2:
select tblPhim.*, tblVe.Ngay_chieu 
from tblPhim join tblVe on tblPhim.PhimID = tblVe.PhimID
order by tblVe.Ngay_chieu;

-- câu 3:
select *
from tblPhim
order by thoi_gian desc
limit 1;

-- câu 4:
select * 
from tblPhim
where thoi_gian = (select min(Thoi_Gian) from tblPhim);

-- câu 5:
select *
from tblGhe
where So_ghe like 'a%';

-- câu 6:
ALTER TABLE tblphong
CHANGE COLUMN Trang_thai Trang_thai VARCHAR(25) NULL DEFAULT NULL ;


-- câu 7:
update tblPhong set Trang_Thai = (
case when Trang_thai = 0 then 'Đang sửa' 
	 when Trang_thai = 1 then 'Đang sử dụng'
     else 'Unknow'
     End 
) where PhongID >0;
select * from tblPhong;

-- câu 8:
select * from tblPhim
where length(tblPhim.Ten_phim) > 15 and length(tblPhim.Ten_phim) <25;

-- câu 9:
select concat(Ten_Phong,'  ', Trang_Thai) as 'Trạng Thái Phòng Chiếu'
from tblPhong;

-- câu 10:
create table tblRank (
STT int primary key auto_increment,
Ten_phim varchar (30),
thoi_Gian int
);
insert into tblRank (tblrank.Ten_phim,tblrank.Thoi_Gian) (select Ten_phim,Thoi_Gian from tblPhim order by ten_phim);
select * from tblRank;
-- câu 11:
update tblPhim set Mo_ta = (select concat ('Đây là bộ phim thể loại ', Loai_Phim))
where PhimID > 0;

select * from tblphim;

update tblPhim set Mo_ta = (select concat ('Đây là film thể loại ', Loai_Phim))
where PhimID > 0;

-- câu 12:
ALTER TABLE tblghe  DROP FOREIGN KEY tblghe_ibfk_1;
ALTER TABLE tblve  DROP FOREIGN KEY tblve_ibfk_1;
ALTER TABLE tblve  DROP FOREIGN KEY tblve_ibfk_2;

-- câu 13:
truncate tblGhe;

-- câu 14: 
 SELECT DATE(NOW()),Date(now()+5000*1000)  today;






