using System;
using System.Collections.Generic;
using System.Web;

using System.Data;
using Newtonsoft.Json.Linq;


namespace FineUI.Pro.Examples.gridbigdata
{
    /// <summary>
    /// data 的摘要说明
    /// </summary>
    public class data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //System.Threading.Thread.Sleep(2000);

            context.Response.ContentType = "text/plain";

            int total = Convert.ToInt32(context.Request.QueryString["total"]);
            string resultType = context.Request.QueryString["type"];

            // 最大数限制
            if (total > 10000)
            {
                total = 10000;
            }

            if (resultType == "simple")
            {
                // 数据格式一
                context.Response.Write(BigDataUtil.GetSimpleBigDataString(total));
            }
            else
            {
                // 数据格式二
                context.Response.Write(BigDataUtil.GetBigDataString(total));
            }
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}