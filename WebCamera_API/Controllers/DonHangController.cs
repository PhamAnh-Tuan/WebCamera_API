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
    public class DonHangController : ControllerBase
    {
        private IDonHangBusiness _donhangbusiness;
        
        public DonHangController(IDonHangBusiness IDonHang)
        {
            _donhangbusiness = IDonHang;
        }

        [Route("create-donhang")]
        [HttpPost]
        public bool CreateDonHang(DonHang model)
        {
            return _donhangbusiness.CreateDonHang(model);
        }
    }
}
