using System;
using System.Collections.Generic;
using System.Text;
using Model;

namespace DAL.Interfaces
{
    public partial interface ICameraRepository
    {
        CameraList GetCamera(int Pageindex, int Pagesize);
        bool CreateCamera(Camera camera);

        Camera Get_ByID(int MaCamera);

        bool UpdateCamera(Camera camera);
        bool DeleteCamera(int MaCamera);
        //Frontend
        List<Camera> GetAllCamera();
        Camera Get_ChiTietSP(int MaCamera);
        List<Camera> Get_SanPhamHot();
        List<Camera> Search_Product(string KeyWord);
        bool Update_Hot(int MaCamera);
    }
}
