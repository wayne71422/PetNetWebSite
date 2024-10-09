using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Exts
{
    public static class DateTimeHelperExt
    {
        public static DateTime CombineDateAndTime(DateTime date, string timeString)
        {
            // 解析時間字串為 TimeSpan
            if (TimeSpan.TryParse(timeString, out TimeSpan time))
            {
                // 將日期部分與時間部分組合
                DateTime combinedDateTime = new DateTime(date.Year, date.Month, date.Day, time.Hours, time.Minutes, 0);
                return combinedDateTime;
            }
            else
            {
                throw new ArgumentException("時間格式錯誤，應該是 HH:mm 格式");
            }
        }
    }
}