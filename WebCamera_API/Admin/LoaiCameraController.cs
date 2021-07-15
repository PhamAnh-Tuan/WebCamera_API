using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL;
using Model;
using Microsoft.AspNetCore.Authorization;
using BLL.Interfaces;

namespace WebCamera_API.Admin
{
    [Authorize]
    [Route("api/admin/[controller]")]
    [ApiController] 
    public class LoaiCameraController : ControllerBase
    {
        private ILoaiCameraBusiness _lcamerabusiness;
        public LoaiCameraController(ILoaiCameraBusiness LoaiCameraBusiness)
        {
            _lcamerabusiness = LoaiCameraBusiness;
        }
        //[AllowAnonymous]
        [Route("get-loai/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public LoaiCameraList GetLoai(int Pageindex, int Pagesize)
        {
            return _lcamerabusiness.GetLoai(Pageindex, Pagesize);
        }
        [Route("create-loai")]
        [HttpPost]
        public bool CreateLoai(LoaiCamera Loai)
        {
            return _lcamerabusiness.CreateLoai(Loai);
        }
        [Route("get-byid-loai/{MaLoai}")]
        [HttpGet]
        public LoaiCamera Get_ByID(int MaLoai)
        {
            return _lcamerabusiness.Get_ByID(MaLoai);
        }
        [Route("get-menu")]
        [HttpGet]
        public List<LoaiCamera> Get_MenuLoai()
        {
            return _lcamerabusiness.Get_MenuLoai();
        }
        [Route("update-loai")]
        [HttpPost]
        public void UpdateLoai(LoaiCamera loai)
        {
            _lcamerabusiness.UpdateLoai(loai);
        }
        [Route("delete-loai/{MaLoai}")]
        [HttpGet]
        public bool DeleteLoai(int MaLoai)
        {
            return _lcamerabusiness.DeleteLoai(MaLoai);
        }
    }
}
