using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DAL.Helper;
using Model;
using DAL.Interfaces;

namespace DAL
{
    public class CameraRepository:ICameraRepository
    {
        public string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        public CameraList GetCamera(int Pageindex, int Pagesize)
        {
            CameraList listcamera = new CameraList();
            List<Camera> cameraList = new List<Camera>();
            try
            {
                string sql = "SP_PAGE_Camera";
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
                            Camera camera = new Camera();
                            camera.TenHang =Convert.ToString(dataReader["TenHang"]);
                            camera.TenLoai = Convert.ToString(dataReader["TenLoai"]);
                            camera.MaCamera = Convert.ToInt32(dataReader["MaCamera"]);
                            camera.TenCamera = Convert.ToString(dataReader["TenCamera"]);
                            camera.DoPhanGiai = Convert.ToString(dataReader["DoPhanGiai"]);
                            camera.Chip = Convert.ToString(dataReader["Chip"]);
                            camera.OngKinh = Convert.ToString(dataReader["OngKinh"]);
                            camera.TamQuanSat = Convert.ToString(dataReader["TamQuanSat"]);
                            camera.NguonDien = Convert.ToString(dataReader["NguonDien"]);
                            camera.HinhAnh = Convert.ToString(dataReader["HinhAnh"]);
                            camera.Gia = Convert.ToInt32(dataReader["Gia"]);
                            camera.CameraHot = Convert.ToInt32(dataReader["CameraHot"]);
                            cameraList.Add(camera);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listcamera.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listcamera.listCamera = cameraList;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listcamera;
        }
        public bool CreateCamera(Camera camera)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Add_Camera";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TenCamera", camera.TenCamera);
                        cmd.Parameters.AddWithValue("@MaLoai", camera.MaLoai);
                        cmd.Parameters.AddWithValue("@DoPhanGiai", camera.DoPhanGiai);
                        cmd.Parameters.AddWithValue("@Chip", camera.Chip);
                        cmd.Parameters.AddWithValue("@OngKinh", camera.OngKinh);
                        cmd.Parameters.AddWithValue("@TamQuanSat", camera.TamQuanSat);
                        cmd.Parameters.AddWithValue("@NguonDien", camera.NguonDien);
                        cmd.Parameters.AddWithValue("@HinhAnh", camera.HinhAnh);
                        cmd.Parameters.AddWithValue("@Gia", camera.Gia);
                        cmd.Parameters.AddWithValue("@CameraHot", camera.CameraHot);
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

        public Camera Get_ByID(int MaCamera)
        {
            Camera camera = new Camera();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "SP_GetID_Camera";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaCamera", MaCamera);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            camera.MaCamera = Convert.ToInt32(dataReader["MaCamera"]);
                            camera.MaLoai = Convert.ToInt32(dataReader["MaLoai"]);
                            camera.TenLoai = Convert.ToString(dataReader["TenLoai"]);
                            camera.TenCamera = Convert.ToString(dataReader["TenCamera"]);
                            camera.DoPhanGiai = Convert.ToString(dataReader["DoPhanGiai"]);
                            camera.Chip = Convert.ToString(dataReader["Chip"]);
                            camera.OngKinh = Convert.ToString(dataReader["OngKinh"]);
                            camera.TamQuanSat = Convert.ToString(dataReader["TamQuanSat"]);
                            camera.NguonDien = Convert.ToString(dataReader["NguonDien"]);
                            camera.HinhAnh = Convert.ToString(dataReader["HinhAnh"]);
                            camera.Gia = Convert.ToInt32(dataReader["Gia"]);
                        }
                    }
                }
                connection.Close();
            }
            return camera;
        }

        public bool UpdateCamera(Camera camera)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Update_Camera";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaCamera", camera.MaCamera);
                        cmd.Parameters.AddWithValue("@TenCamera", camera.TenCamera);
                        cmd.Parameters.AddWithValue("@MaLoai", camera.MaLoai);
                        cmd.Parameters.AddWithValue("@DoPhanGiai", camera.DoPhanGiai);
                        cmd.Parameters.AddWithValue("@Chip", camera.Chip);
                        cmd.Parameters.AddWithValue("@OngKinh", camera.OngKinh);
                        cmd.Parameters.AddWithValue("@TamQuanSat", camera.TamQuanSat);
                        cmd.Parameters.AddWithValue("@NguonDien", camera.NguonDien);
                        cmd.Parameters.AddWithValue("@HinhAnh", camera.HinhAnh);
                        cmd.Parameters.AddWithValue("@Gia", camera.Gia);
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
        public bool DeleteCamera(int MaCamera)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Delete_Camera";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaCamera", MaCamera);
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
        //Frontend
        public List<Camera> GetAllCamera()
        {
            List<Camera> cameraList = new List<Camera>();
            try
            {
                string sql = "SP_GetAll_SanPham";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
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
                            cameraList.Add(camera);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return cameraList;
        }
        public Camera Get_ChiTietSP(int MaCamera)
        {
            Camera camera = new Camera();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "SP_Get_ChiTietSP";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaCamera", MaCamera);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            camera.MaCamera = Convert.ToInt32(dataReader["MaCamera"]);
                            camera.MaLoai = Convert.ToInt32(dataReader["MaLoai"]);
                            camera.TenCamera = Convert.ToString(dataReader["TenCamera"]);
                            camera.DoPhanGiai = Convert.ToString(dataReader["DoPhanGiai"]);
                            camera.Chip = Convert.ToString(dataReader["Chip"]);
                            camera.OngKinh = Convert.ToString(dataReader["OngKinh"]);
                            camera.TamQuanSat = Convert.ToString(dataReader["TamQuanSat"]);
                            camera.NguonDien = Convert.ToString(dataReader["NguonDien"]);
                            camera.HinhAnh = Convert.ToString(dataReader["HinhAnh"]);
                            camera.Gia = Convert.ToInt32(dataReader["Gia"]);
                        }
                    }
                }
                connection.Close();
            }
            return camera;
        }
        public List<Camera> Get_SanPhamHot()
        {
            List<Camera> cameraList = new List<Camera>();
            try
            {
                string sql = "SP_Get_SanPhamHot";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
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
                            cameraList.Add(camera);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return cameraList;
        }
        public List<Camera> Search_Product(string KeyWord)
        {
            List<Camera> listsearch = new List<Camera>();
            Camera camera ;
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "Search_Product";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@KeyWord", KeyWord);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            camera = new Camera();
                            camera.MaCamera = Convert.ToInt32(dataReader["MaCamera"]);
                            camera.MaLoai = Convert.ToInt32(dataReader["MaLoai"]);
                            camera.TenCamera = Convert.ToString(dataReader["TenCamera"]);
                            camera.DoPhanGiai = Convert.ToString(dataReader["DoPhanGiai"]);
                            camera.Chip = Convert.ToString(dataReader["Chip"]);
                            camera.OngKinh = Convert.ToString(dataReader["OngKinh"]);
                            camera.TamQuanSat = Convert.ToString(dataReader["TamQuanSat"]);
                            camera.NguonDien = Convert.ToString(dataReader["NguonDien"]);
                            camera.HinhAnh = Convert.ToString(dataReader["HinhAnh"]);
                            camera.Gia = Convert.ToInt32(dataReader["Gia"]);
                            listsearch.Add(camera);
                        }
                    }
                }
                connection.Close();
            }
            return listsearch;
        }
        //update Hot
        public bool Update_Hot(int MaCamera)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Update_Hot";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaCamera", MaCamera);
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
