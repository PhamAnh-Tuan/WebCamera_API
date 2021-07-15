using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class DonHangBusiness : IDonHangBusiness
    {
        private IDonHangRepository _res;
        public DonHangBusiness(IDonHangRepository IDonHang)
        {
            _res = IDonHang;
        }
        public bool CreateDonHang(DonHang model)
        {
            return _res.CreateDonHang(model);
        }
        public bool CreateCTDonHang(ChiTietDonHang model)
        {
            return _res.CreateCTDonHang(model);
        }
        public DonHangList GetAllDonHang()
        {
            return _res.GetAllDonHang();
        }
        public DonHangList GetDonHangChuaXacThuc(int Pageindex, int Pagesize)
        {
            return _res.GetDonHangChuaXacThuc(Pageindex, Pagesize);
        }
        public DonHangList GetDonHangDaXacThuc(int Pageindex, int Pagesize)
        {
            return _res.GetDonHangDaXacThuc(Pageindex, Pagesize);
        }
        public DonHangList GetDonHangDaGiao(int Pageindex, int Pagesize)
        {
            return _res.GetDonHangDaGiao(Pageindex, Pagesize);
        }
        public DonHangList GetDonHangDaHuy(int Pageindex, int Pagesize)
        {
            return _res.GetDonHangDaHuy(Pageindex, Pagesize);
        }
        public List<ChiTietDonHang> Get_List_CTDonHang(string MaDonHang)
        {
            return _res.Get_List_CTDonHang(MaDonHang);
        }
        public bool XacThuc_DonHang(string MaDonHang)
        {
            return _res.XacThuc_DonHang(MaDonHang);
        }
        public bool Huy_DonHang(string MaDonHang)
        {
            return _res.Huy_DonHang(MaDonHang);
        }
        public DonHang SP_Get_ByID(string MaDonHang)
        {
            return _res.SP_Get_ByID(MaDonHang);
        }
        public bool Update_Status(DonHang dh)
        {
            return _res.Update_Status(dh);
        }
        public bool Restore_Order(string MaDonHang)
        {
            return _res.Restore_Order(MaDonHang);
        }
    }
}
