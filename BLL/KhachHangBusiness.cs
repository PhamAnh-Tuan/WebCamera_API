using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class KhachHangBusiness:IKhachHangBusiness
    {
        private IKhachHangRepository _res;
        public KhachHangBusiness(IKhachHangRepository IKhachHang)
        {
            _res = IKhachHang;
        }
        public KhachHang Login(KhachHang KhachHang)
        {
            return _res.Login(KhachHang);
        }
        public bool Register(KhachHang kh)
        {
            return _res.Register(kh);
        }
    }
}
