using DAL.Helper;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using System.IO;
using DAL.Interfaces;

namespace DAL
{
    public class HangSanXuatRepository : IHangSanXuatRepository
    {
        public string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        public HangSanXuatList GetHang(int Pageindex, int Pagesize)
        {
            HangSanXuatList listhsx = new HangSanXuatList();
            List<HangSanXuat> hangsxList = new List<HangSanXuat>();
            try
            {
                string sql = "SP_Page_HangSanXuat";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("Pageindex", Pageindex);
                    command.Parameters.AddWithValue("Pagesize", Pagesize);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            HangSanXuat hangsx = new HangSanXuat();
                            hangsx.MaHang = Convert.ToInt32(dataReader["MaHang"]);
                            hangsx.TenHang = Convert.ToString(dataReader["TenHang"]);
                            hangsx.ThongTin = Tools.ChuanHoaXau(Convert.ToString(dataReader["ThongTin"]));
                            hangsxList.Add(hangsx);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listhsx.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listhsx.listHang = hangsxList;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listhsx;
        }
        public List<HangSanXuat> GetAllHang()
        {
            List<HangSanXuat>  listhsx = new List<HangSanXuat>();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "SP_Get_HangSanXuat";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            HangSanXuat hsx = new HangSanXuat();
                            hsx.MaHang = Convert.ToInt32(dataReader["MaHang"]);
                            hsx.TenHang = Convert.ToString(dataReader["TenHang"]);
                            hsx.ThongTin = Tools.ChuanHoaXau(Tools.ChuanHoaXau(Convert.ToString(dataReader["ThongTin"])));
                            listhsx.Add(hsx);
                        }
                    }
                }
                connection.Close();
            }
            return listhsx;
        }
        public bool CreateHang(HangSanXuat hsx)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Add_HangSanXuat";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TenHang", hsx.TenHang);
                        cmd.Parameters.AddWithValue("@ThongTin", hsx.ThongTin);
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
        public HangSanXuat Get_ByID(int MaHang)
        {
            HangSanXuat hsx = new HangSanXuat();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "SP_GetID_HangSanXuat";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaHang", MaHang);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            hsx.MaHang = Convert.ToInt32(dataReader["MaHang"]);
                            hsx.TenHang = Convert.ToString(dataReader["TenHang"]);
                            hsx.ThongTin = Convert.ToString(dataReader["ThongTin"]);
                        }
                    }
                }
                connection.Close();
            }
            return hsx;
        }
        public bool UpdateHang(HangSanXuat hsx)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Update_HangSanXuat";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaHang", hsx.MaHang);
                        cmd.Parameters.AddWithValue("@TenHang", hsx.TenHang);
                        cmd.Parameters.AddWithValue("@ThongTin", hsx.ThongTin);
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
        public bool DeleteHang(int MaHang)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Delete_HangSanXuat";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaHang", MaHang);
                        connection.Open();
                        try
                        {
                            cmd.ExecuteNonQuery();
                        }

                        catch (SqlException ex)
                        {
                            throw;
                        }
                        connection.Close();
                    }
                }
                return true;
            }
            catch
            {
                throw;
            }

        }
    }
}
