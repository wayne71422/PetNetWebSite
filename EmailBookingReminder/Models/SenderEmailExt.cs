using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using EmailBookingReminder.Models.EFModels;
using System.Configuration;

namespace EmailBookingReminder.Models
{
    public class SenderEmailExt
    {
        public static async Task SendEmailReminder(string toEmail, string memberName, BookRecord book, ManagerProfile doctor)
        {
            var mail = CreateEmailMessage(toEmail, memberName, book, doctor);
            await SendEmail(mail);
        }


        public static MailMessage CreateEmailMessage(string toEmail, string memberName, BookRecord book, ManagerProfile doctor)
        {
            string fromEmail = "wayne71422@gmail.com";/*ConfigurationManager.AppSettings["EmailSender"];*/ // Replace with your Gmail address

            // 假設目標網址格式為 https://example.com/Booking/StartConsultation/{bookingId}
            string consultationUrl = $"https://localhost:44393/BookDate/BookCheck/{book.Id}";

            // Set up the email message
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(fromEmail);
            mail.To.Add(toEmail);
            mail.Subject = "貓狗有佳日誌~您的預約諮詢即將開始";
            mail.Body = $"您好親愛的 {memberName},\n\n這邊在此提醒您，您的諮詢預約即將於 {book.BookTime}開始，請預先加入{doctor.Name}醫生的LINE以便開始諮詢!" +
                $"\n\nLINE ID:{doctor.LineCode}" +
                $"\n\n加入流程：請先開啟LINE軟體，選擇底下的首頁，再點擊右上角有人物剪影與+字號的圖案，選擇搜尋，點擊ID並輸入ID即可。" +
                $"\n\n加入完畢後請前往以下網址以便完成諮詢:{consultationUrl}" +
                $"\n\n感謝您的支持與配合,請記得準時進行諮詢，逾時將不候且不做退款喔!" +
                $"\n貓狗有佳日誌謝謝您～";

            return mail;
        }

        public static async Task SendEmail(MailMessage mail)
        {
            try
            {
                string fromEmail = mail.From.Address; // Replace with your Gmail address
                string fromPassword = "cmowdizfuyuliwzg";/*ConfigurationManager.AppSettings["sitePassword"];*/ // Replace with your Gmail password

                // Set up the SMTP client
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    Credentials = new NetworkCredential(fromEmail, fromPassword)
                };

                // Send the email
                await smtp.SendMailAsync(mail);
                Console.WriteLine($"Email sent to {mail.To}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to send email to {mail.To}: {ex.Message}");
            }
        }
    }
}
