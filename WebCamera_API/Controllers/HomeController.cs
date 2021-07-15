using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL;
using Model;
using System.IO;
using Microsoft.Extensions.Configuration;
using BLL.Interfaces;

namespace WebCamera_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private ICameraBusiness _camerabusiness;
        private IHangSanXuatBusiness _hsxbusiness;
        private ILoaiCameraBusiness _lcamerabusiness;
        public HomeController(ICameraBusiness ICamera,IHangSanXuatBusiness IHangsx,ILoaiCameraBusiness ILoai)
        {
            _camerabusiness = ICamera;
            _hsxbusiness = IHangsx;
            _lcamerabusiness = ILoai;
        }
        [Route("get-all")]
        [HttpGet]
        public List<Camera> GetAllCamera()
        {
            return _camerabusiness.GetAllCamera();
        }
        [Route("get-detail/{MaCamera}")]
        [HttpGet]
        public Camera ProductDetail(int MaCamera)
        {
            return _camerabusiness.Get_ChiTietSP(MaCamera);
        }
        [Route("get-camera-hot")]
        public List<Camera> Get_SanPhamHot()
        {
            return _camerabusiness.Get_SanPhamHot();
        }
        [Route("search/{KeyWord}")]
        [HttpGet]
        public List<Camera> Search_Product(string KeyWord)
        {
            return _camerabusiness.Search_Product(KeyWord);
        }
        [Route("gethang-all")]
        [HttpGet]
        public List<HangSanXuat> GetAllHang()
        {
            return _hsxbusiness.GetAllHang();
        }
        [Route("get-menu")]
        [HttpGet]
        public List<LoaiCamera> Get_MenuLoai()
        {
            return _lcamerabusiness.Get_MenuLoai();
        }
    }
}
