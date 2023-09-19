using Microsoft.AspNetCore.Identity;

namespace BCBHPMSBlazor.Models
{
    public class ApplicationUser : IdentityUser
    {

        public string LastName { get; set; }

        public string FirstName { get; set; }

        public DateTime BirthDate { get; set; }

        public string Address { get; set; }

    }
}
