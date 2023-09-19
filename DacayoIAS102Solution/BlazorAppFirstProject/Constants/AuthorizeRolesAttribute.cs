using System.Linq;
using System.Security.Claims;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Rendering;

public class AuthorizeRolesAttribute
{
    public string[] Roles { get; }

    public AuthorizeRolesAttribute(params string[] roles)
    {
        Roles = roles;
    }
}