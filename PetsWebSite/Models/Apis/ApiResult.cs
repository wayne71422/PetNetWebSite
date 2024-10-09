using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Apis
{
	public class ApiResult
	{
		public bool IsSuccess { get; set; }
		public string ErrorMessage { get; set; }

		public static ApiResult Success() => new ApiResult { IsSuccess = true };
		public static ApiResult Fail(string errorMessage) => new ApiResult { IsSuccess = false, ErrorMessage = errorMessage };
	}

	public class ApiResult<T> : ApiResult
	{
		public T Data { get; set; }

		public static ApiResult<T> Success(T data) => new ApiResult<T> { IsSuccess = true, Data = data };
		public static new ApiResult<T> Fail(string errorMessage) => new ApiResult<T> { IsSuccess = false, ErrorMessage = errorMessage };
	}

}