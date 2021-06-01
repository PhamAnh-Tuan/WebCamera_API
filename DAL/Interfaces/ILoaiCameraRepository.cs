using System;
using System.Collections.Generic;
using System.Text;
using Model;
namespace DAL.Interfaces
{
    public partial interface ILoaiCameraRepository
    {
        LoaiCameraList GetLoai(int Pageindex, int Pagesize);

        bool CreateLoai(LoaiCamera Loai);

        LoaiCamera Get_ByID(int MaLoai);
        List<LoaiCamera> Get_MenuLoai();
        void UpdateLoai(LoaiCamera loai);
        bool DeleteLoai(int MaLoai);

        List<Camera> GetSP_ByMaLoai(int MaLoai);
    }
}
