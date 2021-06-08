using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DAL
{
    public class KhachHangRepository:IKhachHangRepository
    {
        public string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        public KhachHang Login(KhachHang KhachHang)
        {
            KhachHang user = new KhachHang();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "sp_guest_get_by_email_password";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", KhachHang.Email);
                    cmd.Parameters.AddWithValue("@matkhau", KhachHang.MatKhau);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            user.MaKhachHang = Convert.ToInt32(dataReader["MaKhachHang"]);
                            user.TenKhachHang = Convert.ToString(dataReader["TenKhachHang"]);
                            user.AnhDaiDien = Convert.ToString(dataReader["AnhDaiDien"]);
                            user.Email = Convert.ToString(dataReader["Email"]);
                            user.GioiTinh = Convert.ToInt16(dataReader["GioiTinh"]);
                            user.SDT = Convert.ToString(dataReader["SDT"]);
                            user.DiaChi = Convert.ToString(dataReader["DiaChi"]);
                        }
                    }
                }
                connection.Close();
            }
            return user;
        }
        public bool Register(KhachHang kh)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Register";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TenKhachHang", kh.TenKhachHang);
                        cmd.Parameters.AddWithValue("@Email", kh.Email);
                        cmd.Parameters.AddWithValue("@MatKhau", kh.MatKhau);
                        cmd.Parameters.AddWithValue("@GioiTinh", kh.GioiTinh);
                        cmd.Parameters.AddWithValue("@SDT", kh.SDT);
                        cmd.Parameters.AddWithValue("@DiaChi", kh.DiaChi);
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
