using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class LoaiCamera
    {
        public int MaLoai { get; set; }
        public int MaHang { get; set; }
        public string TenLoai { get; set; }
        public string MoTa { get; set; }
        public string TenHang { get; set; }
        public int Parent_MaHang
        {
            get; set;
        }
    }
}
