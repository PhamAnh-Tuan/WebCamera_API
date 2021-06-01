using System;
using System.Collections.Generic;
using System.Text;
using DAL;
using DAL.Interfaces;
using Model;
using BLL.Interfaces;
namespace BLL
{
    public partial class HangSanXuatBusiness:IHangSanXuatBusiness
    {
        private IHangSanXuatRepository _res;
        public HangSanXuatBusiness(IHangSanXuatRepository IHangsanxuat)
        {
            _res = IHangsanxuat;
        }
        public HangSanXuatList GetHang(int Pageindex, int Pagesize)
        {
            return _res.GetHang(Pageindex, Pagesize);
        }
        public List<HangSanXuat> GetAllHang()
        {
            return _res.GetAllHang();
        }
        public bool CreateHang(HangSanXuat hsx)
        {
            return _res.CreateHang(hsx);
        }
        public HangSanXuat Get_ByID(int MaHang)
        {
            return _res.Get_ByID(MaHang);
        }
        public bool UpdateHang(HangSanXuat hsx)
        {
            return _res.UpdateHang(hsx);
        }
        public bool DeleteHang(int MaHang)
        {
            return _res.DeleteHang(MaHang);
        }
    }
}
