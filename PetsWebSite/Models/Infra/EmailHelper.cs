using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace PetsWebSite.Models.Infra
{
    public class EmailHelper
    {
        private string senderEmail = "asd931047@gmail.com"; // 使用發信的 Gmail 帳號
        private string senderName = "驗證信"; // 顯示的名稱
        public void SendVerificationEmail(string url, string name, string email)
        {
            var subject = "請驗證您的電子郵件地址";
            var body = $@"Hi {name},
<br/>
請點擊以下連結驗證您的帳號：[<a href='{url}' target='_blank'>點擊此處驗證</a>]
<br/>
如果您未進行此操作，請忽略此信件。";

            SendFromGmail(senderEmail, email, subject, body);
        }
        public void SendForgotPasswordEmail(string url, string name, string email)
        {
            //            var subject = "[重設密碼通知]";
            //            var body = $@"Hi {name},
            //<br/>
            //請點擊此連結 [<a href='{url}' target='_blank'>我要重設密碼</a>],已進行重設密碼,如果您沒有提出申請,請忽略本信,謝謝";
            //            var from = senderEmail;
            //            var to = email;
            //            SendFromGmail(from, to, subject, body);
            var subject = "[重設密碼通知]";
            var body = $@"Hi {name},
<br/>
請點擊此連結 [<a href='{url}' target='_blank'>我要重設密碼</a>],已進行重設密碼,如果您沒有提出申請,請忽略本信,謝謝";
            var to = email;

            SendFromGmail(senderEmail, to, subject, body);

        }
        public virtual void SendFromGmail(string from, string to, string subject, string body)
        {
            //todo 以下是開發時,測試之用,只是建立text file,不真的寄出信
            //var path = HttpContext.Current.Server.MapPath("~/files/");
            //CreateTextFile(path, from, to, subject, body);
            //return;
            //todo 實作程式,可以視需要真的寄出信,或者只是單純建立text file,供開發使用
            try
            {
                MailMessage mail = new MailMessage();
                // 前面是發信 email，後面是顯示的名稱
                mail.From = new MailAddress(from, senderName);

                // 收信者 email
                mail.To.Add(to);

                // 設定優先權
                mail.Priority = MailPriority.Normal;

                // 標題
                mail.Subject = subject;

                // 內容
                mail.Body = body;

                // 內容使用 HTML
                mail.IsBodyHtml = true;

                // 設定 Gmail 的 SMTP (這是 Google 的)
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

                // 您的 Gmail 帳號密碼
                smtpClient.Credentials = new System.Net.NetworkCredential("asd931047@gmail.com", "btyf edvz xoch rizj");

                // 開啟 SSL
                smtpClient.EnableSsl = true;

                // 發送郵件
                try
                {
                    smtpClient.Send(mail);
                }
                catch (Exception ex)
                {
                    // 打印例外資訊以進行除錯
                    Console.WriteLine($"發送郵件失敗: {ex.Message}");
                }

                // 放掉宣告出來的 smtpClient 和 mail 物件
                smtpClient = null;
                mail.Dispose();
            }
            catch (Exception ex)
            {
                // 處理例外情況，記錄錯誤訊息
                Console.WriteLine($"Error sending email: {ex.Message}");
            }


        }

    }
}