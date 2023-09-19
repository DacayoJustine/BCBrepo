using Microsoft.AspNetCore.Components;
using System.Security.Claims;

namespace BCBHPMSBlazor.Constants
{
    public interface IRedirectionService
    {
        void RedirectToAppropriatePage(ClaimsPrincipal user);
    }

    public class RedirectionService : IRedirectionService
    {
        private readonly NavigationManager _navigationManager;

        public RedirectionService(NavigationManager navigationManager)
        {
            _navigationManager = navigationManager;
        }

        public void RedirectToAppropriatePage(ClaimsPrincipal user)
        {
            if (user.IsInRole("Secretary"))
            {

                try
                {
                    _navigationManager.NavigateTo("/SecretaryHomePage");

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Navigation error: {ex.Message}");
                }

            }
            else
            {
                try
                {
                    _navigationManager.NavigateTo("/");

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Navigation error: {ex.Message}");
                }


            }
        }
    }
}
