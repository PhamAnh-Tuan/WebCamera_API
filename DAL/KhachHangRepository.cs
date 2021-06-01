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
    }
}
