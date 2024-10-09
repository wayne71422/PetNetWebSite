using System;
using Bogus;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

class Program
{
    static void Main()
    {
        // Step 1: 定義假資料生成器
        var userFaker = new Faker<User>()
            .RuleFor(u => u.Id, f => f.IndexFaker + 1) // 自動遞增的 Id
            .RuleFor(u => u.Name, f => f.Name.FirstName()) // 生成隨機名字
            .RuleFor(u => u.Email, f => f.Internet.Email()) // 生成隨機 Email
            .RuleFor(u => u.Password, f => HashPassword(f.PickRandom(new[] { "123456", "654321" }))) // 雜湊處理密碼
            .RuleFor(u => u.Mobile, f => f.Phone.PhoneNumber("09########")) // 台灣格式的手機號碼
            .RuleFor(u => u.AccountBalance, f => f.Finance.Amount(0, 5000)) // 隨機的帳戶餘額
            .RuleFor(u => u.IsConfirmed, f => f.Random.Bool()) // 隨機的確認狀態
            .RuleFor(u => u.ConfirmCode, f => f.Random.AlphaNumeric(10)) // 隨機確認碼
            .RuleFor(u => u.Address, f => f.Address.StreetAddress()); // 隨機地址

        // Step 2: 生成 100 筆假資料
        var users = userFaker.Generate(100);

        // Step 3: 將資料插入到 SQL 資料庫
        var connectionString = "data source=.;initial catalog=PetDailyNet;user id=sa;password=123;trustservercertificate=True;MultipleActiveResultSets=True;App=EntityFramework";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            foreach (var user in users)
            {
                string query = "INSERT INTO Members (Id, Name, Email, Password, Mobile, AccountBalance, IsConfirmed, ConfirmCode, Address) " +
                               "VALUES (@Id, @Name, @Email, @Password, @Mobile, @AccountBalance, @IsConfirmed, @ConfirmCode, @Address)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", user.Id);
                    command.Parameters.AddWithValue("@Name", user.Name);
                    command.Parameters.AddWithValue("@Email", user.Email);
                    command.Parameters.AddWithValue("@Password", user.Password);
                    command.Parameters.AddWithValue("@Mobile", user.Mobile);
                    command.Parameters.AddWithValue("@AccountBalance", user.AccountBalance);
                    command.Parameters.AddWithValue("@IsConfirmed", user.IsConfirmed);
                    command.Parameters.AddWithValue("@ConfirmCode", user.ConfirmCode);
                    command.Parameters.AddWithValue("@Address", string.IsNullOrEmpty(user.Address) ? (object)DBNull.Value : user.Address);


                    command.ExecuteNonQuery();
                }
            }
        }

        Console.WriteLine("100 筆假資料插入完成！");
    }

    // 密碼雜湊函數
    static string HashPassword(string password)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                builder.Append(bytes[i].ToString("x2"));
            }
            return builder.ToString();
        }
    }
}

// 定義資料模型
public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string Mobile { get; set; }
    public decimal AccountBalance { get; set; }
    public bool IsConfirmed { get; set; }
    public string ConfirmCode { get; set; }
    public string Address { get; set; }
}
