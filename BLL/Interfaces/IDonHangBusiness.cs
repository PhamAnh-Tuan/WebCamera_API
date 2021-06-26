using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL.Interfaces
{
    public partial interface IDonHangBusiness
    {
        bool CreateDonHang(DonHang model);
        bool CreateCTDonHang(ChiTietDonHang model);
        DonHangList GetDonHangChuaXacThuc(int Pageindex, int Pagesize);
        DonHangList GetDonHangDaXacThuc(int Pageindex, int Pagesize);
        DonHangList GetDonHangDaGiao(int Pageindex, int Pagesize);
        List<ChiTietDonHang> Get_List_CTDonHang(string MaDonHang);
        bool XacThuc_DonHang(string MaDonHang);
        bool Huy_DonHang(string MaDonHang);
        DonHang SP_Get_ByID(string MaDonHang);
        bool Update_Status(DonHang dh);
    }
}
