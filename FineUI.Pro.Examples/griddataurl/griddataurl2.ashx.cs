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
    public class griddataurl2_data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            JArray ja = new JArray();

            DataTable source = DataSourceUtil.GetDataTable2();
            foreach (DataRow row in source.Rows)
            {
                JObject jo = new JObject();
                jo.Add("Id", (int)row["Id"]);
                jo.Add("Name", row["Name"].ToString());
                jo.Add("Gender", (int)row["Gender"]);
                jo.Add("EntranceYear", (int)row["EntranceYear"]);
                jo.Add("AtSchool", (bool)row["AtSchool"]);
                jo.Add("Major", row["Major"].ToString());
                jo.Add("Group", (int)row["Group"]);

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