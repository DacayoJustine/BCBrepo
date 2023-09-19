using System.ComponentModel.DataAnnotations;

namespace BCBHPMSBlazor.Data
{
    public class Secretary
    {
        [Required]
        public string LoginName { get; set; } = string.Empty;

        [Required]
        public string Password { get; set; } = string.Empty;
    }
} 
