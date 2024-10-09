using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using EmailBookingReminder.Models.EFModels;
using EmailBookingReminder.Models.Services;

namespace EmailBookingReminder
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            DateTime lastUpdateTime = DateTime.Now;

            // Schedule the task to run periodically
            while (true)
            {
                await EmailBookingReminderService.CheckBookingsAndSendEmails();

                // Check if 30 minutes have passed since the last update
                
                EmailBookingReminderService.UpdateLateEndBookings();
                lastUpdateTime = DateTime.Now; // Reset the last update time
                
                // Sleep for 5 minutes before checking again
                await Task.Delay(TimeSpan.FromMinutes(5));  // 實作時，將檔案轉為EXE交給WINDOWS排定每5分鐘呼叫一次 
            }
        }
    }
}
