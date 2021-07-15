using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public partial interface IDonHangRepository
    {
        bool CreateDonHang(DonHang model);
        bool CreateCTDonHang(ChiTietDonHang model);
        DonHangList GetAllDonHang();
        DonHangList GetDonHangChuaXacThuc(int Pageindex, int Pagesize);
        DonHangList GetDonHangDaXacThuc(int Pageindex, int Pagesize);
        DonHangList GetDonHangDaGiao(int Pageindex, int Pagesize);
        DonHangList GetDonHangDaHuy(int Pageindex, int Pagesize);
        List<ChiTietDonHang> Get_List_CTDonHang(string MaDonHang);
        bool XacThuc_DonHang(string MaDonHang);
        bool Huy_DonHang(string MaDonHang);
        DonHang SP_Get_ByID(string MaDonHang);
        bool Update_Status(DonHang dh);
        bool Restore_Order(string MaDonHang);
    }
}
