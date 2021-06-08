using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class DonHang
    {
        public string MaDonHang { get; set; }
        public int MaKhachHang { get; set; }
        public string NgayTao { get; set; }
        public string TrangThaiDonHang { get; set; }
        public string TrangThaiVanChuyen { get; set; }
        public string TrangThaiThanhToan { get; set; }
        public int TongTien { get; set; }
        public string TenKhachHang { get; set; }
        public string DiaChi { get; set; }
        public string SDT { get; set; }
        public string GhiChu { get; set; }
        public List<ChiTietDonHang> listjson_chitiet { get; set; }
    }
}
