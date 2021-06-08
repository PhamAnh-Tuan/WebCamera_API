using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public partial interface IKhachHangRepository
    {
        KhachHang Login(KhachHang KhachHang);
        bool Register(KhachHang kh);
    }
}
