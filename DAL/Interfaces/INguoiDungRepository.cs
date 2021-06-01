using System;
using System.Collections.Generic;
using System.Text;
using Model;
namespace DAL.Interfaces
{
    public partial interface INguoiDungRepository
    {
        NguoiDung Login(NguoiDung nguoidung);
    }
}
