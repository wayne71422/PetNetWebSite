using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using EmailBookingReminder.Models.Repositories;
using EmailBookingReminder.Models.EFModels;
using System.Data.Entity;
using System.Runtime.Remoting.Contexts;

namespace EmailBookingReminder.Models.Services
{
    public class EmailBookingReminderService
    {
        
        public static async Task CheckBookingsAndSendEmails()
        {
            var _repo = new EmailBookingReminderRepository();
            DateTime currentTime = DateTime.Now.AddMinutes(-10);
            DateTime thresholdTime = DateTime.Now.AddMinutes(15);

            // Fetch all bookings that start within the next 10 minutes and have not yet started
            var upcomingBookings = _repo.GetRecord(currentTime, thresholdTime);
            if (upcomingBookings == null || !upcomingBookings.Any())
            {
                // Log or debug output to indicate no records were found
                Console.WriteLine("No upcoming bookings found.");
                return; // If no bookings, exit early
            }
            await _repo.SendEmailEachOne(upcomingBookings);
        }

        // A separate method for updating late end bookings every 30 minutes
        public static void UpdateLateEndBookings()
        {
            var _repo = new EmailBookingReminderRepository();
            DateTime currentTime = DateTime.Now.AddMinutes(-10);
            //DateTime checkStartTime = currentTime.AddMinutes(-60);

            // Fetch bookings that ended late and update them
            var lateEndBookings = _repo.GetRecordisStart(currentTime);
            
            _repo.CreateBill(lateEndBookings);
            _repo.CreateIncome(lateEndBookings);

        }

    }
}
