using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace PetsWebSite.Models.Infra
{
    public class HashUtility
    {
        public static string GetSalt()
        {
            return System.Configuration.ConfigurationManager.AppSettings["Salt"];
        }
        public static string ToSHA256(string plainText)
        {
            using (var mySHA256 = SHA256.Create())
            {
                var bytes = System.Text.Encoding.UTF8.GetBytes(plainText); // 不加上 Salt
                var hash = mySHA256.ComputeHash(bytes);

                var sb = new StringBuilder();
                foreach (var b in hash)
                {
                    sb.Append(b.ToString("X2")); // 將 byte 轉為 16 進位字串
                }
                return sb.ToString();
            }
        }

    }
}

