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
    public class LoaiCameraController : ControllerBase
    {
        private ILoaiCameraBusiness _loaicamerabusiness;
        public LoaiCameraController(ILoaiCameraBusiness ILoaiCamera)
        {
            _loaicamerabusiness = ILoaiCamera;
        }

        [Route("get-sp-maloai/{MaLoai}")]
        [HttpGet]
        public List<Camera> GetSP_ByMaLoai(int MaLoai)
        {
            return _loaicamerabusiness.GetSP_ByMaLoai(MaLoai);
        }
    }
}
