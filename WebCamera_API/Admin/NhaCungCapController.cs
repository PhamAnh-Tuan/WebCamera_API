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
    public class NhaCungCapController : ControllerBase
    {
        private INhaCungCapBusiness _hsxbusiness;
        public NhaCungCapController(INhaCungCapBusiness NhaCungCapBusiness)
        {
            _hsxbusiness = NhaCungCapBusiness;
        }
        [Route("get-ncc/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public NhaCungCapList GetNCC(int Pageindex, int Pagesize)
        {
            return _hsxbusiness.GetNCC(Pageindex, Pagesize);
        }
        [Route("get-all")]
        [HttpGet]
        public List<NhaCungCap> GetAllNCC()
        {
            return _hsxbusiness.GetAllNCC();
        }
        [Route("create-ncc")]
        [HttpPost]
        public bool CreateNCC(NhaCungCap hsx)
        {
            return _hsxbusiness.CreateNCC(hsx);
        }
        [Route("get-byid-ncc/{MaNCC}")]
        [HttpGet]
        public NhaCungCap Get_ByID(int MaNCC)
        {
            return _hsxbusiness.Get_ByID(MaNCC);
        }
        [Route("update-ncc")]
        [HttpPost]
        public bool UpdateNCC(NhaCungCap hsx)
        {
            return _hsxbusiness.UpdateNCC(hsx);
        }
        [Route("delete-ncc/{MaNCC}")]
        [HttpGet]
        public bool DeleteNCC(int MaNCC)
        {
            return _hsxbusiness.DeleteNCC(MaNCC);
        }
    }
}
