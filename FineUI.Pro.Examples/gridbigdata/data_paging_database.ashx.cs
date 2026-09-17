using System;
using System.Collections.Generic;
using System.Web;

using System.Data;
using Newtonsoft.Json.Linq;


namespace FineUI.Pro.Examples.gridbigdata
{
    /// <summary>
    /// data_paging_database 的摘要说明
    /// </summary>
    public class data_paging_database : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            int total = Convert.ToInt32(context.Request.QueryString["total"]);
            int pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
            int pageSize = Convert.ToInt32(context.Request["pageSize"]);

            // 最大数限制
            if (total > 10000)
            {
                total = 10000;
            }

            context.Response.Write(GetPagedLargeData(total, pageIndex, pageSize));
        }

        private string GetPagedLargeData(int total, int pageIndex, int pageSize)
        {
            JObject jo = new JObject();

            // 总记录数
            jo.Add("recordCount", total);

            // 分页数据
            jo.Add("data", BigDataUtil.GetBigData(total, pageIndex, pageSize));

            return jo.ToString(Newtonsoft.Json.Formatting.None);
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