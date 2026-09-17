using System;
using System.Collections.Generic;
using System.Web;

using System.Data;
using Newtonsoft.Json.Linq;


namespace FineUI.Pro.Examples.griddataurl
{
    /// <summary>
    /// griddataurl1 的摘要说明
    /// </summary>
    public class griddataurl_treegrid_data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            JArray ja = new JArray();

            DataTable source = DataSourceUtil.GetTreeDataTable();
            foreach (DataRow row in source.Rows)
            {
                JObject jo = new JObject();
                jo.Add("ParentId", (int)row["ParentId"]);
                jo.Add("Id", (int)row["Id"]);
                jo.Add("Name", row["Name"].ToString());
                jo.Add("Type", row["Type"].ToString());
                jo.Add("ModifyDate", (DateTime)row["ModifyDate"]);

                object fileSize = row["Size"];
                if (fileSize == DBNull.Value)
                {
                    jo.Add("Size", "");
                }
                else
                {
                    jo.Add("Size", (int)fileSize);
                }

                ja.Add(jo);
            }


            context.Response.ContentType = "text/plain";
            context.Response.Write(ja.ToString()); // Newtonsoft.Json.Formatting.None
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