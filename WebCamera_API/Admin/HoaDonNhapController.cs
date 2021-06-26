using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebCamera_API.Admin
{
    [Route("api/admin/[controller]")]
    [ApiController]
    public class HoaDonNhapController : ControllerBase
    {
        private IHoaDonNhapBusiness _hoadonnhapbusiness;
        public HoaDonNhapController(IHoaDonNhapBusiness HoaDonNhapBusiness)
        {
            _hoadonnhapbusiness = HoaDonNhapBusiness;
        }
        [Route("get-hoadonnhap/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public HoaDonNhapList GetHoaDonNhap(int Pageindex, int Pagesize)
        {
            return _hoadonnhapbusiness.GetHoaDonNhap(Pageindex, Pagesize);
        }
        [Route("get-list-cthoadonnhap/{MaHoaDonNhap}")]
        [HttpGet]
        public List<ChiTietHoaDonNhap> Get_List_CTHoaDonNhap(int MaHoaDonNhap)
        {
            return _hoadonnhapbusiness.Get_List_CTHoaDonNhap(MaHoaDonNhap);
        }
        [Route("create-hoadonnhap")]
        [HttpPost]
        public bool CreateHoaDonNhap(HoaDonNhap hdn)
        {
            return _hoadonnhapbusiness.CreateHoaDonNhap(hdn);
        }
        [Route("create-cthoadonnhap")]
        [HttpPost]
        public bool CreateCTHoaDonNhap(ChiTietHoaDonNhap ct)
        {
            return _hoadonnhapbusiness.CreateCTHoaDonNhap(ct);
        }
    }
}
