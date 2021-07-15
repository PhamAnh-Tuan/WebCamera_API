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
    public class DonHangController : ControllerBase
    {
        private IDonHangBusiness _donhangbusiness;
        public DonHangController(IDonHangBusiness DonHangBusiness)
        {
            _donhangbusiness = DonHangBusiness;
        }
        [Route("getall-donhang")]
        [HttpGet]
        public DonHangList GetAllDonHang()
        {
            return _donhangbusiness.GetAllDonHang();
        }
        [Route("get-donhang-chuaxacthuc/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public DonHangList GetDonHangChuaXacThuc(int Pageindex, int Pagesize)
        {
            return _donhangbusiness.GetDonHangChuaXacThuc(Pageindex, Pagesize);
        }
        [Route("get-donhang-daxacthuc/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public DonHangList GetDonHangDaXacThuc(int Pageindex, int Pagesize)
        {
            return _donhangbusiness.GetDonHangDaXacThuc(Pageindex, Pagesize);
        }
        [Route("get-donhang-dagiao/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public DonHangList GetDonHangDaGiao(int Pageindex, int Pagesize)
        {
            return _donhangbusiness.GetDonHangDaGiao(Pageindex, Pagesize);
        }
        [Route("get-donhang-dahuy/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public DonHangList GetDonHangDaHuy(int Pageindex, int Pagesize)
        {
            return _donhangbusiness.GetDonHangDaHuy(Pageindex, Pagesize);
        }
        [Route("get-chitietdh/{MaDonHang}")]
        [HttpGet]
        public List<ChiTietDonHang> Get_List_CTDonHang(string MaDonHang)
        {
            return _donhangbusiness.Get_List_CTDonHang(MaDonHang);
        }
        [Route("xacthuc/{MaDonHang}")]
        [HttpGet]
        public bool XacThuc_DonHang(string MaDonHang)
        {
            return _donhangbusiness.XacThuc_DonHang(MaDonHang);
        }
        [Route("huy-donhang/{MaDonHang}")]
        [HttpGet]
        public bool Huy_DonHang(string MaDonHang)
        {
            return _donhangbusiness.Huy_DonHang(MaDonHang);
        }
        [Route("get-by-id/{MaDonHang}")]
        [HttpGet]
        public DonHang SP_Get_ByID(string MaDonHang)
        {
            return _donhangbusiness.SP_Get_ByID(MaDonHang);
        }
        [Route("update-status")]
        [HttpPost]
        public bool SP_Get_ByID(DonHang dh)
        {
            return _donhangbusiness.Update_Status(dh);
        }
        [Route("restore/{MaDonHang}")]
        [HttpGet]
        public bool Restore_Order(string MaDonHang)
        {
            return _donhangbusiness.Restore_Order(MaDonHang);
        }
    }
}
