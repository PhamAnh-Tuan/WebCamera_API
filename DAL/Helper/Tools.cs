using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Helper
{
    public class Tools
    {
        public static string ChuanHoaXau(string xau)
        {
            string[] a = xau.Split(new string[] { " " }, StringSplitOptions.None);
            if (a.Length < 15) return xau;
            string tam = "";
            for (int i = 0; i < 15; i++)
                tam += a[i] + " ";
            tam += "...";
            return tam;
        }
        public static string ChuanHoa(string xau,int kitu)
        {
            string[] a = xau.Split(new string[] { " ","-" }, StringSplitOptions.None);
            if (a.Length < kitu) return xau;
            string tam = "";
            for (int i = 0; i < kitu; i++)
                tam += a[i] + " ";
            tam += "...";
            return tam;
        }
    }
}
