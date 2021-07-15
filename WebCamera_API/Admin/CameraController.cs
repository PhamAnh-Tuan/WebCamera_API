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
using Microsoft.AspNetCore.Authorization;

namespace WebCamera_API.Admin
{
    [Authorize]
    [Route("api/admin/[controller]")]
    [ApiController]
    public class CameraController : ControllerBase
    {
        private string _path;
        private ICameraBusiness _camerabusiness;
        public CameraController(ICameraBusiness ICamera, IConfiguration configuration)
        {
            _camerabusiness = ICamera;
            _path = configuration["AppSettings:PATH"];
        }

        [Route("get-camera/{Pageindex}/{Pagesize}")]
        [HttpGet]
        public CameraList GetCamera(int Pageindex, int Pagesize)
        {
            return _camerabusiness.GetCamera(Pageindex, Pagesize);
        }
        [Route("upload")]
        [HttpPost, DisableRequestSizeLimit]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            try
            {
                if (file.Length > 0)
                {
                    string filePath = $"upload/{file.FileName}";
                    var fullPath = CreatePathFile(filePath);
                    using (var fileStream = new FileStream(fullPath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                    return Ok(new { filePath });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Không tìm thây");
            }
        }

        [NonAction]
        private string CreatePathFile(string RelativePathFileName)
        {
            try
            {
                string serverRootPathFolder = _path;
                string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
                string fullPathFolder = System.IO.Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                return fullPathFile;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        [Route("create-camera")]
        [HttpPost]
        public bool CreateCamera(Camera hsx)
        {
            return _camerabusiness.CreateCamera(hsx);
        }
        [Route("get-byid-camera/{MaCamera}")]
        [HttpGet]
        public Camera Get_ByID(int MaCamera)
        {
            return _camerabusiness.Get_ByID(MaCamera);
        }
        [Route("update-camera")]
        [HttpPost]
        public bool UpdateCamera(Camera hsx)
        {
            return _camerabusiness.UpdateCamera(hsx);
        }
        [Route("delete-camera/{MaCamera}")]
        [HttpGet]
        public bool DeleteCamera(int MaCamera)
        {
            return _camerabusiness.DeleteCamera(MaCamera);
        }

        [Route("update-hot/{MaCamera}")]
        [HttpPost]
        public bool Update_Hot(int MaCamera)
        {
            return _camerabusiness.Update_Hot(MaCamera);
        }
        //[AllowAnonymous]
        [Route("get-all")]
        [HttpGet]
        public List<Camera> GetAllCamera()
        {
            return _camerabusiness.GetAllCamera();
        }
    }
}
