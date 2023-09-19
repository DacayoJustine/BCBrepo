namespace BCBHPMSBlazor.Services
{
    public interface IUserService
    {
        Task<User> AuthenticateAsync(string Username, string Password);
    }

    public class UserService : IUserService
    {
        private readonly List<User> users = new List<User>
    {
        new User { Id = 1, Username = "Secretary", Password = "123456", Roles = new List<string> { "Secretary" } }, // Example user

        // Add more users as needed
    };

        public async Task<User> AuthenticateAsync(string Username, string Password)
        {
            await Task.Delay(TimeSpan.FromSeconds(1));

            var user = users.SingleOrDefault(u => u.Username == Username && u.Password == Password);

            return user;
        }
    }

    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public List<string> Roles { get; set; } = new List<string>();
    }
}
