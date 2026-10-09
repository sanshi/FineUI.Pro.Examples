using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.gridtree
{
    public partial class gridtree_checkboxfield : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetTreeDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }



        #endregion

        #region Events

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            // e.DataItem  -> System.Data.DataRowView 或自定义类。
            // e.RowIndex -> 当前行索引。
            // e.Values -> 当前行各列的数据。

            DataRowView row = e.DataItem as DataRowView;

            // 类型
            string type = row["Type"].ToString();
            if (type != "文件夹")
            {
                e.SetCellCssClass("FollowFolder", "hidethis");
            }

            //RenderCheckField followFolderField = Grid1.FindColumn("FollowFolder") as RenderCheckField;
            //// 类型
            //string type = row["Type"].ToString();
            //if (type != "文件夹")
            //{
            //    e.CellCssClasses[followFolderField.ColumnIndex] = "hidethis";
            //}


        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = GridSelectionMessage.HowManyRowsAreSelected(Grid1);
        }


        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName != "ReadFollowFolders")
            {
                return;
            }
            JArray rows = e.EventArgumentsAsJObject["rows"] as JArray;
            if (rows == null)
            {
                throw new HttpException(400, "缺少目录关注状态。");
            }

            StringBuilder sb = new StringBuilder();

            sb.Append("关注的目录列表：");
            sb.Append("<table class=\"result\">");
            sb.Append("<tr>");
            sb.Append("<th>行号</th>");
            foreach (string datakey in Grid1.DataKeyNames)
            {
                sb.AppendFormat("<th>{0}</th>", datakey);
            }
            sb.Append("</tr>");

            foreach (JObject row in rows)
            {
                bool followit = row.Value<bool>("FollowFolder");

                if (!followit)
                {
                    continue;
                }
                sb.Append("<tr>");

                sb.AppendFormat("<td>{0}</td>", row.Value<int>("rowNumber"));
                sb.AppendFormat("<td>{0}</td>", HtmlEncode(row.Value<string>("id")));
                sb.AppendFormat("<td>{0}</td>", HtmlEncode(row.Value<string>("name")));
                sb.Append("</tr>");
            }

            sb.Append("</table>");


            labResult.Text = sb.ToString();
        }

        #endregion

    }
}
