using System;
using System.Collections.Generic;
using System.Text;
using Model;
namespace DAL.Interfaces
{
    public partial interface IHangSanXuatRepository
    {
        HangSanXuatList GetHang(int Pageindex, int Pagesize);
        List<HangSanXuat> GetAllHang();
        bool CreateHang(HangSanXuat hsx);

        HangSanXuat Get_ByID(int MaHang);

        bool UpdateHang(HangSanXuat hsx);
        bool DeleteHang(int MaHang);
    }
}
