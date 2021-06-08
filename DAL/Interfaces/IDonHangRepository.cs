using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public partial interface IDonHangRepository
    {
        bool CreateDonHang(DonHang model);
    }
}
