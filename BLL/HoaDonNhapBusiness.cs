using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class HoaDonNhapBusiness : IHoaDonNhapBusiness
    {
        private IHoaDonNhapRepository _res;
        public HoaDonNhapBusiness(IHoaDonNhapRepository IHoaDonNhap)
        {
            _res = IHoaDonNhap;
        }
        public HoaDonNhapList GetHoaDonNhap(int Pageindex, int Pagesize)
        {
            return _res.GetHoaDonNhap(Pageindex, Pagesize);
        }
        public List<ChiTietHoaDonNhap> Get_List_CTHoaDonNhap(string MaHoaDonNhap)
        {
            return _res.Get_List_CTHoaDonNhap(MaHoaDonNhap);
        }
        public bool CreateHoaDonNhap(HoaDonNhap hdn)
        {
            return _res.CreateHoaDonNhap(hdn);
        }
        public bool CreateCTHoaDonNhap(ChiTietHoaDonNhap ct)
        {
            return _res.CreateCTHoaDonNhap(ct);
        }
    }
}
