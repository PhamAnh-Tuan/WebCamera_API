using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using DAL.Helper;
namespace DAL
{
    public class NhaCungCapRepository:INhaCungCapRepository
    {
        public string dbconnectionStr = "Data Source=DESKTOP-UTR8NLF;Initial Catalog=WebCamera_API;Integrated Security=True";
        public NhaCungCapList GetNCC(int Pageindex, int Pagesize)
        {
            NhaCungCapList listncc = new NhaCungCapList();
            List<NhaCungCap> nccList = new List<NhaCungCap>();
            try
            {
                string sql = "SP_Page_NhaCungCap";
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
                            NhaCungCap ncc = new NhaCungCap();
                            ncc.MaNCC = Convert.ToInt32(dataReader["MaNCC"]);
                            ncc.TenNCC =Tools.ChuanHoa(Convert.ToString(dataReader["TenNCC"]),8);
                            ncc.DiaChi =Tools.ChuanHoa(Convert.ToString(dataReader["DiaChi"]),4);
                            ncc.SDT = Convert.ToString(dataReader["SDT"]);
                            ncc.Email = Convert.ToString(dataReader["Email"]);
                            nccList.Add(ncc);
                        }
                        dataReader.NextResult();
                        while (dataReader.Read())
                        {
                            listncc.totalcount = Convert.ToInt32(dataReader["totalcount"]);
                        }
                        listncc.listNCC = nccList;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return listncc;
        }
        public List<NhaCungCap> GetAllNCC()
        {
            List<NhaCungCap> listncc = new List<NhaCungCap>();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "SP_Get_NhaCungCap";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            NhaCungCap ncc = new NhaCungCap();
                            ncc.MaNCC = Convert.ToInt32(dataReader["MaNCC"]);
                            ncc.TenNCC = Convert.ToString(dataReader["TenNCC"]);
                            ncc.DiaChi = Convert.ToString(dataReader["DiaChi"]);
                            ncc.SDT = Convert.ToString(dataReader["SDT"]);
                            ncc.Email = Convert.ToString(dataReader["Email"]);
                            listncc.Add(ncc);
                        }
                    }
                }
                connection.Close();
            }
            return listncc;
        }
        public bool CreateNCC(NhaCungCap ncc)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Add_NhaCungCap";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TenNCC", ncc.TenNCC);
                        cmd.Parameters.AddWithValue("@DiaChi", ncc.DiaChi);
                        cmd.Parameters.AddWithValue("@SDT", ncc.SDT);
                        cmd.Parameters.AddWithValue("@Email", ncc.Email);
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

        public NhaCungCap Get_ByID(int MaNCC)
        {
            NhaCungCap ncc = new NhaCungCap();
            using (SqlConnection connection = new SqlConnection(dbconnectionStr))
            {
                string sql = "SP_GetID_NhaCungCap";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaNCC", MaNCC);
                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            ncc.MaNCC = Convert.ToInt32(dataReader["MaNCC"]);
                            ncc.TenNCC = Convert.ToString(dataReader["TenNCC"]);
                            ncc.DiaChi = Convert.ToString(dataReader["DiaChi"]);
                            ncc.SDT = Convert.ToString(dataReader["SDT"]);
                            ncc.Email = Convert.ToString(dataReader["Email"]);
                        }
                    }
                }
                connection.Close();
            }
            return ncc;
        }

        public bool UpdateNCC(NhaCungCap ncc)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Update_NhaCungCap";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaNCC", ncc.MaNCC);
                        cmd.Parameters.AddWithValue("@TenNCC", ncc.TenNCC);
                        cmd.Parameters.AddWithValue("@DiaChi", ncc.DiaChi);
                        cmd.Parameters.AddWithValue("@SDT", ncc.SDT);
                        cmd.Parameters.AddWithValue("@Email", ncc.Email);
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
        public bool DeleteNCC(int MaNCC)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(dbconnectionStr))
                {
                    string sql = "Delete_NhaCungCap";
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaNCC", MaNCC);
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
