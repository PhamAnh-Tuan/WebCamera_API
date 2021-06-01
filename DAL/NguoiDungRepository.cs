using System;
using System.Collections.Generic;
using System.Text;
using Model;
using System.Data;
using System.Data.SqlClient;
using DAL.Interfaces;

namespace DAL
{
    public class NguoiDungRepository:INguoiDungRepository
    {
        public string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        public NguoiDung Login(NguoiDung nguoidung)
        {
            NguoiDung user = new NguoiDung();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "sp_user_get_by_username_password";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@taikhoan", nguoidung.TaiKhoan);
                    cmd.Parameters.AddWithValue("@matkhau", nguoidung.MatKhau);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            user.MaNguoiDung = Convert.ToInt32(dataReader["MaNguoiDung"]);
                            user.TenNguoiDung = Convert.ToString(dataReader["TenNguoiDung"]);
                            user.Anh = Convert.ToString(dataReader["Anh"]);
                            user.TaiKhoan = Convert.ToString(dataReader["TaiKhoan"]);
                        }
                    }
                }
                connection.Close();
            }
            return user;
        }
    }
}
