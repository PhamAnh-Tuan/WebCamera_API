using System;
using System.Collections.Generic;
using System.Text;
using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Model;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.Extensions.Configuration;
using System.Security.Claims;

namespace BLL
{
    public class NguoiDungBusiness:INguoiDungBusiness
    {
        private INguoiDungRepository _res;
        private IConfiguration _config;
        public NguoiDungBusiness(INguoiDungRepository INguoiDung, IConfiguration config)
        {
            _config = config;
            _res = INguoiDung;
        }
        public NguoiDung Login(NguoiDung nguoidung)
        {
            var user= _res.Login(nguoidung);
            if (user.TenNguoiDung != null)
            {
                user.token = token(user.TenNguoiDung);
                return user;
            }
            else
            {
                return null;
            }

        }
        public string token(string type)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var Claims = new List<Claim>
                        {
                            new Claim(ClaimTypes.Role, type),
                        };
            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
            _config["Jwt:Issuer"],
            Claims,
            expires: DateTime.Now.AddDays(1),
            signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
