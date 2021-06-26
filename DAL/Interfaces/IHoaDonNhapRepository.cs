using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public partial interface IHoaDonNhapRepository
    {
        HoaDonNhapList GetHoaDonNhap(int Pageindex, int Pagesize);
        List<ChiTietHoaDonNhap> Get_List_CTHoaDonNhap(int MaHoaDonNhap);
        bool CreateHoaDonNhap(HoaDonNhap hdn);
        bool CreateCTHoaDonNhap(ChiTietHoaDonNhap ct);
    }
}
