using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Entities
{
	public class UserEntity
	{
		public string Account { get; set; }
		public string Password { get; set; }
		public string Function { get; set; }
	}
}