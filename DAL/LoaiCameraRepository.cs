using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using System.IO;
using DAL.Interfaces;
using Model;
using DAL.Helper;
namespace DAL
{
    public class LoaiCameraRepository: ILoaiCameraRepository
    {
        private string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        public LoaiCameraList GetLoai(int Pageindex, int Pagesize)
        {
            LoaiCameraList listloai = new LoaiCameraList();
            List<LoaiCamera> loailist = new List<LoaiCamera>();
            try
            {
                string sql = "SP_Page_LoaiCamera";
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
                            LoaiCamera loai = new LoaiCamera();
                            loai.MaLoai = Convert.ToInt32(dataReader["MaLoai"]);
                            loai.MaHang = Convert.ToInt32(dataReader["MaHang"]);
                            loai.TenLoai = Convert.ToString(dataReader["TenLoai"]);
                            loai.MoTa = Tools.ChuanHoaXau(Convert.ToString(dataReader["MoTa"]));
                            loailist.Add(loai);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listloai.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listloai.listLoai = loailist;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listloai;
        }

        public bool CreateLoai(LoaiCamera Loai)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Add_LoaiCamera";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaHang", Loai.MaHang);
                        cmd.Parameters.AddWithValue("@TenLoai", Loai.TenLoai);
                        cmd.Parameters.AddWithValue("@MoTa", Loai.MoTa);
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

        public LoaiCamera Get_ByID(int MaLoai)
        {
            LoaiCamera loai = new LoaiCamera();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "SP_GetID_LoaiCamera";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            loai.MaLoai = Convert.ToInt32(dataReader["MaLoai"]);
                            loai.MaHang = Convert.ToInt32(dataReader["MaHang"]);
                            loai.TenLoai = Convert.ToString(dataReader["TenLoai"]);
                            loai.MoTa = Tools.ChuanHoaXau(Tools.ChuanHoaXau(Convert.ToString(dataReader["MoTa"])));
                        }
                    }
                }
                connection.Close();
            }
            return loai;
        }
        public List<LoaiCamera> Get_MenuLoai()
        {
            List<LoaiCamera> listloai = new List<LoaiCamera>();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "Get_MenuLoai";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            LoaiCamera loai = new LoaiCamera();
                            loai.MaHang = Convert.ToInt32(dataReader["MaHang"]);
                            loai.TenHang = Convert.ToString(dataReader["TenHang"]);
                            loai.Parent_MaHang = Convert.ToInt32(dataReader["Parent_MaHang"]);
                            loai.MaLoai = Convert.ToInt32(dataReader["MaLoai"]);
                            loai.TenLoai = Convert.ToString(dataReader["TenLoai"]);
                            listloai.Add(loai);
                        }
                    }
                }
                connection.Close();
            }
            return listloai;
        }
        public void UpdateLoai(LoaiCamera loai)
        {
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "Update_LoaiCamera";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaLoai", loai.MaLoai);
                    cmd.Parameters.AddWithValue("@MaHang", loai.MaHang);
                    cmd.Parameters.AddWithValue("@TenLoai", loai.TenLoai);
                    cmd.Parameters.AddWithValue("@MoTa", loai.MoTa);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
        public bool DeleteLoai(int MaLoai)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Delete_LoaiCamera";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaLoai", MaLoai);
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

        public List<Camera> GetSP_ByMaLoai(int MaLoai)
        {
            List<Camera> listCamera = new List<Camera>();
            try
            {
                string sql = "GetSP_ByMaLoai";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("MaLoai", MaLoai);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            Camera camera = new Camera();
                            camera.MaCamera = Convert.ToInt32(dataReader["MaCamera"]);
                            camera.TenCamera = Convert.ToString(dataReader["TenCamera"]);
                            camera.DoPhanGiai = Convert.ToString(dataReader["DoPhanGiai"]);
                            camera.Chip = Convert.ToString(dataReader["Chip"]);
                            camera.OngKinh = Convert.ToString(dataReader["OngKinh"]);
                            camera.TamQuanSat = Convert.ToString(dataReader["TamQuanSat"]);
                            camera.NguonDien = Convert.ToString(dataReader["NguonDien"]);
                            camera.HinhAnh = Convert.ToString(dataReader["HinhAnh"]);
                            camera.Gia = Convert.ToInt32(dataReader["Gia"]);
                            listCamera.Add(camera);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listCamera;
        }
    }
}
