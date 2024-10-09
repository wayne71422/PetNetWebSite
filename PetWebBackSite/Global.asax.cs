using AutoMapper;
using PetsWebSite.Models;
using PetWebBackSite.Interface;
using PetWebBackSite.Models.EFModels;
using PetWebBackSite.Models.Repositories;
using PetWebBackSite.Models.Services;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Unity;
using Unity.AspNet.Mvc;

namespace PetWebBackSite
{
    public class MvcApplication : System.Web.HttpApplication
    {
        public static IMapper _mapper;
        protected void Application_Start()
        {
            var container = new UnityContainer();
            container.RegisterType<AppDbContext>(); // 註冊 AppDbContext
            container.RegisterType<IManagerRepository, ManagerRepository>();
            container.RegisterType<ManagerService>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));

            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // AutoMapper 配置
            var config = new MapperConfiguration(cfg =>
            {
                // 使用 MappingProfile 來設定對應關係
                cfg.AddProfile<MappingProfile>();
            });


            _mapper = config.CreateMapper();
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            HttpCookie sessionCookie = Response.Cookies["ASP.NET_SessionId"];
            if (sessionCookie != null)
            {
                sessionCookie.HttpOnly = true;
                sessionCookie.Expires = DateTime.Now.AddDays(1); // 設置有效期，例如1天
            }
        }
    }
}
