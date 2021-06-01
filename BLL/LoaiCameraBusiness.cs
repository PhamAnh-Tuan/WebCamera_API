using System;
using System.Collections.Generic;
using System.Text;
using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Model;
namespace BLL
{
    public class LoaiCameraBusiness:ILoaiCameraBusiness
    {
        private ILoaiCameraRepository _res;
        public LoaiCameraBusiness(ILoaiCameraRepository ILoaiCamera)
        {
            _res = ILoaiCamera;
        }
        public LoaiCameraList GetLoai(int Pageindex, int Pagesize)
        {
            return _res.GetLoai(Pageindex, Pagesize);
        }
        public bool CreateLoai(LoaiCamera Loai)
        {
            return _res.CreateLoai(Loai);
        }
        public LoaiCamera Get_ByID(int MaLoai)
        {
            return _res.Get_ByID(MaLoai);
        }
        public List<LoaiCamera> Get_MenuLoai()
        {
            return _res.Get_MenuLoai();
        }
        public void UpdateLoai(LoaiCamera loai)
        {
            _res.UpdateLoai(loai);
        }
        public bool DeleteLoai(int MaLoai)
        {
            return _res.DeleteLoai(MaLoai);
        }
        //frontend
        public List<Camera> GetSP_ByMaLoai(int MaLoai)
        {
            return _res.GetSP_ByMaLoai(MaLoai);
        }
    }
}
