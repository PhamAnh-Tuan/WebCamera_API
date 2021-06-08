using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL.Interfaces
{
    public partial interface INhaCungCapBusiness
    {
        NhaCungCapList GetNCC(int Pageindex, int Pagesize);
        List<NhaCungCap> GetAllNCC();
        bool CreateNCC(NhaCungCap hsx);
        NhaCungCap Get_ByID(int MaNCC);
        bool UpdateNCC(NhaCungCap hsx);
        bool DeleteNCC(int MaNCC);
    }
}
