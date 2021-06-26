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
        public bool CreateCTDonHang(ChiTietDonHang model)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Create_ChiTietDH";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonHang", model.MaDonHang);
                        cmd.Parameters.AddWithValue("@MaCamera", model.MaCamera);
                        cmd.Parameters.AddWithValue("@SoLuong", model.SoLuong);
                        cmd.Parameters.AddWithValue("@DonGia", model.DonGia);
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
        public DonHangList GetDonHangChuaXacThuc(int Pageindex, int Pagesize)
        {
            DonHangList listdh = new DonHangList();
            List<DonHang> DonHangList = new List<DonHang>();
            try
            {
                string sql = "sp_page_DonHangChuaXacThuc";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Pageindex", Pageindex);
                    command.Parameters.AddWithValue("@Pagesize", Pagesize);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            DonHang DonHang = new DonHang();
                            DonHang.MaDonHang = Convert.ToString(dataReader["MaDonHang"]);
                            DonHang.TenKhachHang = Convert.ToString(dataReader["TenKhachHang"]);
                            DonHang.DiaChi = Convert.ToString(dataReader["DiaChi"]);
                            DonHang.SDT = Convert.ToString(dataReader["SDT"]);
                            DonHang.NgayTao = Convert.ToString(dataReader["NgayTao"]);
                            DonHang.GhiChu = Convert.ToString(dataReader["GhiChu"]);
                            DonHang.TrangThaiDonHang = Convert.ToString(dataReader["TrangThaiDonHang"]);
                            DonHang.TrangThaiVanChuyen = Convert.ToString(dataReader["TrangThaiVanChuyen"]);
                            DonHang.TrangThaiThanhToan = Convert.ToString(dataReader["TrangThaiThanhToan"]);
                            DonHangList.Add(DonHang);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listdh.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listdh.listDonHang = DonHangList;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listdh;
        }
        public DonHangList GetDonHangDaXacThuc(int Pageindex, int Pagesize)
        {
            DonHangList listdh = new DonHangList();
            List<DonHang> DonHangList = new List<DonHang>();
            try
            {
                string sql = "sp_page_DonHangDaXacThuc";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Pageindex", Pageindex);
                    command.Parameters.AddWithValue("@Pagesize", Pagesize);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            DonHang DonHang = new DonHang();
                            DonHang.MaDonHang = Convert.ToString(dataReader["MaDonHang"]);
                            DonHang.TenKhachHang = Convert.ToString(dataReader["TenKhachHang"]);
                            DonHang.DiaChi = Convert.ToString(dataReader["DiaChi"]);
                            DonHang.SDT = Convert.ToString(dataReader["SDT"]);
                            DonHang.NgayTao = Convert.ToString(dataReader["NgayTao"]);
                            DonHang.GhiChu = Convert.ToString(dataReader["GhiChu"]);
                            DonHang.TrangThaiDonHang = Convert.ToString(dataReader["TrangThaiDonHang"]);
                            DonHang.TrangThaiVanChuyen = Convert.ToString(dataReader["TrangThaiVanChuyen"]);
                            DonHang.TrangThaiThanhToan = Convert.ToString(dataReader["TrangThaiThanhToan"]);
                            DonHangList.Add(DonHang);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listdh.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listdh.listDonHang = DonHangList;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listdh;
        }
        public DonHangList GetDonHangDaGiao(int Pageindex, int Pagesize)
        {
            DonHangList listdh = new DonHangList();
            List<DonHang> DonHangList = new List<DonHang>();
            try
            {
                string sql = "sp_page_DonHangDaGiao";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Pageindex", Pageindex);
                    command.Parameters.AddWithValue("@Pagesize", Pagesize);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            DonHang DonHang = new DonHang();
                            DonHang.MaDonHang = Convert.ToString(dataReader["MaDonHang"]);
                            DonHang.TenKhachHang = Convert.ToString(dataReader["TenKhachHang"]);
                            DonHang.DiaChi = Convert.ToString(dataReader["DiaChi"]);
                            DonHang.SDT = Convert.ToString(dataReader["SDT"]);
                            DonHang.NgayTao = Convert.ToString(dataReader["NgayTao"]);
                            DonHang.GhiChu = Convert.ToString(dataReader["GhiChu"]);
                            DonHang.TrangThaiDonHang = Convert.ToString(dataReader["TrangThaiDonHang"]);
                            DonHang.TrangThaiVanChuyen = Convert.ToString(dataReader["TrangThaiVanChuyen"]);
                            DonHang.TrangThaiThanhToan = Convert.ToString(dataReader["TrangThaiThanhToan"]);
                            DonHangList.Add(DonHang);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listdh.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listdh.listDonHang = DonHangList;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listdh;
        }
        public List<ChiTietDonHang> Get_List_CTDonHang(string MaDonHang)
        {
            List<ChiTietDonHang> ListChiTietDH = new List<ChiTietDonHang>();
            try
            {
                string sql = "SP_CTDonHang_ID";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MaDonHang", MaDonHang);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            ChiTietDonHang CTHDN = new ChiTietDonHang();
                            CTHDN.TenCamera = Convert.ToString(dataReader["TenCamera"]);
                            CTHDN.SoLuong = Convert.ToInt32(dataReader["SoLuong"]);
                            CTHDN.DonGia = Convert.ToInt32(dataReader["DonGia"]);
                            ListChiTietDH.Add(CTHDN);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return ListChiTietDH;
        }
        public bool XacThuc_DonHang(string MaDonHang)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "ComfirmThisOrder";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonHang", MaDonHang);
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
        public bool Huy_DonHang(string MaDonHang)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "CancelThisOrder";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonHang", MaDonHang);
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
        public DonHang SP_Get_ByID(string MaDonHang)
        {
            DonHang DonHang = new DonHang();
            try
            {
                string sql = "SP_DonHang_get_by_id";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MaDonHang", MaDonHang);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            DonHang.MaDonHang = Convert.ToString(dataReader["MaDonHang"]);
                            DonHang.TenKhachHang = Convert.ToString(dataReader["TenKhachHang"]);
                            DonHang.DiaChi = Convert.ToString(dataReader["DiaChi"]);
                            DonHang.SDT = Convert.ToString(dataReader["SDT"]);
                            DonHang.NgayTao = Convert.ToString(dataReader["NgayTao"]);
                            DonHang.GhiChu = Convert.ToString(dataReader["GhiChu"]);
                            DonHang.TrangThaiDonHang = Convert.ToString(dataReader["TrangThaiDonHang"]);
                            DonHang.TrangThaiVanChuyen = Convert.ToString(dataReader["TrangThaiVanChuyen"]);
                            DonHang.TrangThaiThanhToan = Convert.ToString(dataReader["TrangThaiThanhToan"]);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return DonHang;
        }
        public bool Update_Status(DonHang dh)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Update_Status";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonHang", dh.MaDonHang);
                        cmd.Parameters.AddWithValue("@TrangThaiDonHang", dh.TrangThaiDonHang);
                        cmd.Parameters.AddWithValue("@TrangThaiVanChuyen", dh.TrangThaiVanChuyen);
                        cmd.Parameters.AddWithValue("@TrangThaiThanhToan", dh.TrangThaiThanhToan);
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
