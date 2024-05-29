using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;

var builder = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json");

var config = builder.Build();
var connectionString = config.GetConnectionString("DefaultConnection");

using (var conn = new MySqlConnection(connectionString))
{
    conn.Open();
    using (var cmd = new MySqlCommand("SELECT * FROM succursale", conn))
    {
        using (var reader = cmd.ExecuteReader())
        {
            while (reader.Read())
            {
                Console.WriteLine($"{reader.GetString(0)} {reader.GetString(1)}");
            }
        }
    }
}