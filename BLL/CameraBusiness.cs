using System;
using System.Collections.Generic;
using System.Text;
using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Model;

namespace BLL
{
    public class CameraBusiness:ICameraBusiness
    {
        private ICameraRepository _res;
        public CameraBusiness(ICameraRepository ICamera)
        {
            _res = ICamera;
        }
        public CameraList GetCamera(int Pageindex, int Pagesize)
        {
            return _res.GetCamera(Pageindex, Pagesize);
        }
        public bool CreateCamera(Camera hsx)
        {
            return _res.CreateCamera(hsx);
        }
        public Camera Get_ByID(int MaCamera)
        {
            return _res.Get_ByID(MaCamera);
        }
        public bool UpdateCamera(Camera hsx)
        {
            return _res.UpdateCamera(hsx);
        }
        public bool DeleteCamera(int MaCamera)
        {
            return _res.DeleteCamera(MaCamera);
        }
        public List<Camera> GetAllCamera()
        {
            return _res.GetAllCamera();
        }
        public Camera Get_ChiTietSP(int MaCamera)
        {
            return _res.Get_ChiTietSP(MaCamera);
        }
        public List<Camera> Get_SanPhamHot()
        {
            return _res.Get_SanPhamHot();
        }
        public List<Camera> Search_Product(string KeyWord)
        {
            return _res.Search_Product(KeyWord);
        }
        public bool Update_Hot(int MaCamera)
        {
            return _res.Update_Hot(MaCamera);
        }
    }
}
