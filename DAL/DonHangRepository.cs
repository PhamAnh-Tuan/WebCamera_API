using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
namespace DAL
{
    public class DonHangRepository:IDonHangRepository
    {
        public string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        
        public bool CreateDonHang(DonHang model)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Create_DonHang";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonHang", model.MaDonHang);
                        cmd.Parameters.AddWithValue("@MaKhachHang", model.MaKhachHang);
                        cmd.Parameters.AddWithValue("@NgayTao", model.NgayTao);
                        cmd.Parameters.AddWithValue("@TrangThaiDonHang", model.TrangThaiDonHang);
                        cmd.Parameters.AddWithValue("@TrangThaiVanChuyen", model.TrangThaiVanChuyen);
                        cmd.Parameters.AddWithValue("@TrangThaiThanhToan", model.TrangThaiThanhToan);
                        cmd.Parameters.AddWithValue("@TongTien", model.TongTien);
                        cmd.Parameters.AddWithValue("@TenKhachHang", model.TenKhachHang);
                        cmd.Parameters.AddWithValue("@DiaChi", model.DiaChi);
                        cmd.Parameters.AddWithValue("@SDT", model.SDT);
                        cmd.Parameters.AddWithValue("@GhiChu", model.GhiChu);
                        cmd.Parameters.AddWithValue("@listjson_chitiet", model.listjson_chitiet);
                        connection.Open();
                        cmd.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
