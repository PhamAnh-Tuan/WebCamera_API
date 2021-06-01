using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL;
using Model;
using BLL.Interfaces;

namespace WebCamera_API.Admin
{
    [Route("api/admin/[controller]")]
    [ApiController]
    public class NguoiDungController : ControllerBase
    {
        private INguoiDungBusiness _userbusiness;
        public NguoiDungController(INguoiDungBusiness INguoiDung)
        {
            _userbusiness = INguoiDung;
        }

        [Route("login")]
        [HttpPost]
        public NguoiDung Login(NguoiDung nguoidung)
        {
            return _userbusiness.Login(nguoidung);
        }
    }
}
