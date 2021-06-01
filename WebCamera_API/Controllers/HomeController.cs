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
        public HomeController(ICameraBusiness ICamera)
        {
            _camerabusiness = ICamera;
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
    }
}
