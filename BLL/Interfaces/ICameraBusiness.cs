using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL.Interfaces
{
    public partial interface ICameraBusiness
    {
        CameraList GetCamera(int Pageindex, int Pagesize);
        bool CreateCamera(Camera hsx);
        Camera Get_ByID(int MaCamera);
        bool UpdateCamera(Camera hsx);
        bool DeleteCamera(int MaCamera);
        List<Camera> GetAllCamera();
        Camera Get_ChiTietSP(int MaCamera);
        List<Camera> Get_SanPhamHot();
        List<Camera> Search_Product(string KeyWord);
        bool Update_Hot(int MaCamera);
    }
}
