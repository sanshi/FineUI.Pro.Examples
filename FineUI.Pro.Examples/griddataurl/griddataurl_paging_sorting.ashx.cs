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
    public class griddataurl_paging_sorting_data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string sortField = context.Request["sortField"];
            string sortDirection = context.Request["sortDirection"];


            JArray ja = new JArray();

            DataTable source = DataSourceUtil.GetDataTable2();
            DataView view1 = source.DefaultView;
            view1.Sort = String.Format("{0} {1}", sortField, sortDirection);

            DataTable sortedTable = view1.ToTable();

            foreach (DataRow row in sortedTable.Rows)
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