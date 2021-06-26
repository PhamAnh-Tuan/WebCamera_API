using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DAL
{
    public class HoaDonNhapRepository: IHoaDonNhapRepository
    {
        public string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        public HoaDonNhapList GetHoaDonNhap(int Pageindex, int Pagesize)
        {
            HoaDonNhapList listhdn = new HoaDonNhapList();
            List<HoaDonNhap> HoaDonNhapList = new List<HoaDonNhap>();
            try
            {
                string sql = "SP_Page_HoaDonNhap";
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
                            HoaDonNhap HoaDonNhap = new HoaDonNhap();
                            HoaDonNhap.MaHoaDonNhap = Convert.ToString(dataReader["MaHoaDonNhap"]);
                            HoaDonNhap.TenNCC = Convert.ToString(dataReader["TenNCC"]);
                            HoaDonNhap.TongTien = Convert.ToInt32(dataReader["TongTien"]);
                            HoaDonNhap.NgayNhap = Convert.ToString(dataReader["NgayNhap"]);
                            HoaDonNhapList.Add(HoaDonNhap);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listhdn.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listhdn.listHoaDonNhap = HoaDonNhapList;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listhdn;
        }
        public List<ChiTietHoaDonNhap> Get_List_CTHoaDonNhap(int MaHoaDonNhap)
        {
            List<ChiTietHoaDonNhap> ListChiTietHDN = new List<ChiTietHoaDonNhap>();
            try
            {
                string sql = "SP_CTHoaDonNhap_ID";
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MaHoaDonNhap", MaHoaDonNhap);
                    connection.Open();
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            ChiTietHoaDonNhap CTHDN = new ChiTietHoaDonNhap();
                            CTHDN.MaCTHoaDonNhap = Convert.ToString(dataReader["MaCTHoaDonNhap"]);
                            CTHDN.MaCamera = Convert.ToInt32(dataReader["MaCamera"]);
                            CTHDN.SoLuong = Convert.ToInt32(dataReader["SoLuong"]);
                            CTHDN.DonGia = Convert.ToInt32(dataReader["DonGia"]);
                            ListChiTietHDN.Add(CTHDN);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return ListChiTietHDN;
        }
        public bool CreateHoaDonNhap(HoaDonNhap hdn)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "ADD_HoaDonNhap";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaHoaDonNhap", hdn.MaHoaDonNhap);
                        cmd.Parameters.AddWithValue("@MaNCC", hdn.MaNCC);
                        cmd.Parameters.AddWithValue("@TongTien", hdn.TongTien);
                        cmd.Parameters.AddWithValue("@NgayNhap", hdn.NgayNhap);
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
        public bool CreateCTHoaDonNhap(ChiTietHoaDonNhap ct)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "ADD_ChiTietHoaDonNhap";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaCTHoaDonNhap", ct.MaCTHoaDonNhap);
                        cmd.Parameters.AddWithValue("@MaHoaDonNhap", ct.MaHoaDonNhap);
                        cmd.Parameters.AddWithValue("@MaCamera", ct.MaCamera);
                        cmd.Parameters.AddWithValue("@SoLuong", ct.SoLuong);
                        cmd.Parameters.AddWithValue("@DonGia", ct.DonGia);
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
