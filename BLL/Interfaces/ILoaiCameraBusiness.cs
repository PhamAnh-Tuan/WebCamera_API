using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL.Interfaces
{
    public partial interface ILoaiCameraBusiness
    {
        LoaiCameraList GetLoai(int Pageindex, int Pagesize);
        bool CreateLoai(LoaiCamera Loai);
        LoaiCamera Get_ByID(int MaLoai);
        List<LoaiCamera> Get_MenuLoai();
        void UpdateLoai(LoaiCamera loai);
        bool DeleteLoai(int MaLoai);
        //frontend
        List<Camera> GetSP_ByMaLoai(int MaLoai);
    }
}
