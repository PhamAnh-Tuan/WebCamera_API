using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public partial interface INhaCungCapRepository
    {
        NhaCungCapList GetNCC(int Pageindex, int Pagesize);
        List<NhaCungCap> GetAllNCC();
        bool CreateNCC(NhaCungCap ncc);
        NhaCungCap Get_ByID(int MaNCC);
        bool UpdateNCC(NhaCungCap ncc);
        bool DeleteNCC(int MaNCC);
    }
}
