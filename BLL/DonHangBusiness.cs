using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class DonHangBusiness: IDonHangBusiness
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
    }
}
