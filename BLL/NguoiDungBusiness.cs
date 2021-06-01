using System;
using System.Collections.Generic;
using System.Text;
using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Model;
namespace BLL
{
    public class NguoiDungBusiness:INguoiDungBusiness
    {
        private INguoiDungRepository _res;
        public NguoiDungBusiness(INguoiDungRepository INguoiDung)
        {
            _res = INguoiDung;
        }
        public NguoiDung Login(NguoiDung nguoidung)
        {
            return _res.Login(nguoidung);
        }
    }
}
