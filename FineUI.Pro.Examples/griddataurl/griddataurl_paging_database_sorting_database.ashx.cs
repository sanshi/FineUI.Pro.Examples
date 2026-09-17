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
    public class griddataurl_paging_database_sorting_database_data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string sortField = context.Request["sortField"];
            string sortDirection = context.Request["sortDirection"];
            int pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
            int pageSize = Convert.ToInt32(context.Request["pageSize"]);


            JObject result = new JObject();
            // 总记录数
            result.Add("recordCount", GetTotalCount());

            // 当前分页数据
            JArray ja = new JArray();
            DataTable source = GetSortedPagedDataTable(sortField, sortDirection, pageIndex, pageSize);
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

            result.Add("data", ja);

            context.Response.ContentType = "text/plain";
            context.Response.Write(result.ToString()); // Newtonsoft.Json.Formatting.None
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            return DataSourceUtil.GetDataTable2().Rows.Count;
        }

        /// <summary>
        /// 模拟数据库分页（实际项目中请直接使用SQL语句返回分页数据！）
        /// </summary>
        /// <returns></returns>
        private DataTable GetSortedPagedDataTable(string sortField, string sortDirection, int pageIndex, int pageSize)
        {
            DataTable source = DataSourceUtil.GetDataTable2();

            // 先排序
            DataView view1 = source.DefaultView;
            view1.Sort = String.Format("{0} {1}", sortField, sortDirection);
            DataTable sortedTable = view1.ToTable();

            // 再分页
            DataTable paged = sortedTable.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > sortedTable.Rows.Count)
            {
                rowend = sortedTable.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(sortedTable.Rows[i]);
            }

            return paged;
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