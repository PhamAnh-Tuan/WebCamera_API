using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class NhaCungCapBusiness: INhaCungCapBusiness
    {
        private INhaCungCapRepository _res;
        public NhaCungCapBusiness(INhaCungCapRepository INhacungcap)
        {
            _res = INhacungcap;
        }
        public NhaCungCapList GetNCC(int Pageindex, int Pagesize)
        {
            return _res.GetNCC(Pageindex, Pagesize);
        }
        public List<NhaCungCap> GetAllNCC()
        {
            return _res.GetAllNCC();
        }
        public bool CreateNCC(NhaCungCap hsx)
        {
            return _res.CreateNCC(hsx);
        }
        public NhaCungCap Get_ByID(int MaNCC)
        {
            return _res.Get_ByID(MaNCC);
        }
        public bool UpdateNCC(NhaCungCap hsx)
        {
            return _res.UpdateNCC(hsx);
        }
        public bool DeleteNCC(int MaNCC)
        {
            return _res.DeleteNCC(MaNCC);
        }
    }
}
