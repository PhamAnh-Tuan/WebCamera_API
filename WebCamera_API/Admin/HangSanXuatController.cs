using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL.Interfaces;
using Model;
using BLL;
using Microsoft.AspNetCore.Authorization;

namespace WebCamera_API.Areas
{
    [Authorize]
    [Route("api/admin/[controller]")]
    [ApiController]
    public class HangSanXuatController : ControllerBase
    {
        private IHangSanXuatBusiness _hsxbusiness;
        public HangSanXuatController(IHangSanXuatBusiness HangsanxuatBusiness)
        {
            _hsxbusiness = HangsanxuatBusiness;
        }
        [Route("get-hang/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public HangSanXuatList GetHang(int Pageindex,int Pagesize)
        {
            return _hsxbusiness.GetHang(Pageindex, Pagesize);
        }
        [Route("get-all")]
        [HttpGet]
        public List<HangSanXuat> GetAllHang()
        {
            return _hsxbusiness.GetAllHang();
        }
        [Route("create-hang")]
        [HttpPost]
        public bool CreateHang([FromBody] HangSanXuat hsx)
        {
            return _hsxbusiness.CreateHang(hsx);
        }
        [Route("get-byid-hang/{MaHang}")]
        [HttpGet]
        public HangSanXuat Get_ByID(int MaHang)
        {
            return _hsxbusiness.Get_ByID(MaHang);
        }
        [Route("update-hang")]
        [HttpPost]
        public bool UpdateHang(HangSanXuat hsx)
        {
            return _hsxbusiness.UpdateHang(hsx);
        }
        [Route("delete-hang/{MaHang}")]
        [HttpGet]
        public bool DeleteHang(int MaHang)
        {
            return _hsxbusiness.DeleteHang(MaHang);
        }
    }
}
