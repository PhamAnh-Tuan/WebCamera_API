﻿using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL.Interfaces
{
    public partial interface IKhachHangBusiness
    {
        KhachHang Login(KhachHang KhachHang);
        bool Register(KhachHang kh);
    }
}
