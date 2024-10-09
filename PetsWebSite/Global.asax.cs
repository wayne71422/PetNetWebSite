using AutoMapper;
using PetsWebSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace PetsWebSite
{
	public class MvcApplication : System.Web.HttpApplication
	{
        public static IMapper _mapper;
        protected void Application_Start()
		{
			GlobalConfiguration.Configure(WebApiConfig.Register);
			AreaRegistration.RegisterAllAreas();
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
			RouteConfig.RegisterRoutes(RouteTable.Routes);
			BundleConfig.RegisterBundles(BundleTable.Bundles);

            // AutoMapper �t�m
            var config = new MapperConfiguration(cfg =>
            {
                // �ϥ� MappingProfile �ӳ]�w�������Y
                cfg.AddProfile<MappingProfile>();
            });

            _mapper = config.CreateMapper();
        }
	}
}
