using BCBHPMSBlazor.Areas.Identity;
using BCBHPMSBlazor.Data;
using BCBHPMSBlazor.Models;
using BCBHPMSBlazor.Services;
using BCBLibrary.BCBModels;
using BCBLibrary.BHW;
using BCBLibrary.Secretary;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Syncfusion.Blazor;

var builder = WebApplication.CreateBuilder(args);

var config = builder.Configuration;

builder.Services.AddScoped<IResidentsRepository, ResidentsRepository>();
builder.Services.AddScoped<IResidentsStore, ResidentsStore>();
builder.Services.AddScoped<ResidentsManager>();
builder.Services.AddScoped<Isecretarydata, secretarydata>();
builder.Services.AddScoped<IUserService, UserService>();

builder.Services.AddScoped<IHealthRepository, HealthRepository>();
builder.Services.AddScoped<IHealthStore, HealthStore>();
builder.Services.AddScoped<HealthManager>();


var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();
builder.Services.AddDefaultIdentity<ApplicationUser>(options => {
    options.SignIn.RequireConfirmedAccount = true;


    options.Password.RequireDigit = true;
    options.Password.RequireNonAlphanumeric = true;
    options.Password.RequireLowercase = true;
    options.Password.RequiredLength = 8;
    options.Password.RequireUppercase = true;

    options.User.AllowedUserNameCharacters = "abcdefghijklmnopqerstuvwxyzABCDEFGHIJKLMNOPQERSTUVWXYZ1234567890.-_@+";
    options.User.RequireUniqueEmail = true;


    options.Lockout.AllowedForNewUsers = true;
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
    options.Lockout.MaxFailedAccessAttempts = 3;

})
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("Secretary",
        authBuilder =>
        {
            authBuilder.RequireRole("Secretary");
        });
});

builder.Services.AddAuthentication().AddGoogle(options =>
{
    options.ClientId = config.GetSection("Authentication:Google:ClientId").Value;
    options.ClientSecret = config.GetSection("Authentication:Google:ClientSecret").Value;
});

builder.Services.AddBlazorBootstrap();
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddScoped<AuthenticationStateProvider, RevalidatingIdentityAuthenticationStateProvider<ApplicationUser>>();
builder.Services.AddSingleton<WeatherForecastService>();
builder.Services.AddSyncfusionBlazor();

var app = builder.Build();


if (app.Environment.IsDevelopment())
{
    app.UseMigrationsEndPoint();
}
else
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
