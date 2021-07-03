using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using DAL.Helper;
using DAL.Interfaces;
using BLL.Interfaces;
using DAL;
using BLL;
namespace WebCamera_API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //
            var TokenValidationParameters = new TokenValidationParameters
            {
                ValidIssuer = "https://fbi-demo.com",
                ValidAudience = "https://fbi-demo.com",
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("SXkSqsKyNUyvGbnHs7ke2NCq8zQzNLW7mPmHbnZZ")),
                ClockSkew = TimeSpan.Zero // remove delay of token when expire
            };
            //
            services.AddCors();
            services.AddControllers();

            var appSettingsSection = Configuration.GetSection("AppSettings");

            //
            services.AddAuthorization(cfg =>
            {
                cfg.AddPolicy("Admin", policy => policy.RequireClaim("login", "true"));

            });
            //

            services.Configure<AppSettings>(appSettingsSection);

            var appSettings = appSettingsSection.Get<AppSettings>();
            var key = Encoding.ASCII.GetBytes(appSettings.Secret);
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    //IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,


                    ValidIssuer = Configuration["Jwt:Issuer"],
                    ValidAudience = Configuration["Jwt:Issuer"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]))
                };
            });
            
            services.AddControllers();
            

            services.AddTransient<IHangSanXuatRepository, HangSanXuatRepository>();
            services.AddTransient<IHangSanXuatBusiness, HangSanXuatBusiness>();
            services.AddTransient<ILoaiCameraRepository, LoaiCameraRepository>();
            services.AddTransient<ILoaiCameraBusiness, LoaiCameraBusiness>();
            services.AddTransient<ICameraRepository, CameraRepository>();
            services.AddTransient<ICameraBusiness, CameraBusiness>();
            services.AddTransient<INguoiDungRepository, NguoiDungRepository>();
            services.AddTransient<INguoiDungBusiness, NguoiDungBusiness>();
            services.AddTransient<IKhachHangRepository, KhachHangRepository>();
            services.AddTransient<IKhachHangBusiness, KhachHangBusiness>();
            services.AddTransient<IDonHangRepository, DonHangRepository>();
            services.AddTransient<IDonHangBusiness, DonHangBusiness>();
            services.AddTransient<INhaCungCapRepository, NhaCungCapRepository>();
            services.AddTransient<INhaCungCapBusiness, NhaCungCapBusiness>();
            services.AddTransient<IHoaDonNhapRepository, HoaDonNhapRepository>();
            services.AddTransient<IHoaDonNhapBusiness, HoaDonNhapBusiness>();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {

            app.UseRouting();
            // global cors policy
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

            app.UseAuthentication();
            app.UseRouting();
            app.UseAuthorization();
            

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
