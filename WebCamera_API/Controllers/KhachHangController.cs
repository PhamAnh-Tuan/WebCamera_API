using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebCamera_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachHangController : ControllerBase
    {
        private IKhachHangBusiness _userbusiness;
        public KhachHangController(IKhachHangBusiness IKhachHang)
        {
            _userbusiness = IKhachHang;
        }

        [Route("login")]
        [HttpPost]
        public KhachHang Login(KhachHang KhachHang)
        {
            return _userbusiness.Login(KhachHang);
        }
    }
}
