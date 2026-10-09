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


        protected void Button2_Click(object sender, EventArgs e)
        {
            RenderCheckField field1 = (RenderCheckField)Grid1.FindColumn("FollowFolder");

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

            for (int i = 0; i < Grid1.Rows.Count; i++)
            {
                bool followit = GridColumnUtil.GetCheckedState(Grid1, field1.ColumnID, i);

                if(followit) {
                sb.Append("<tr>");

                sb.AppendFormat("<td>{0}</td>", i + 1);

                object[] dataKeys = Grid1.DataKeys[i];
                for (int j = 0; j < dataKeys.Length; j++)
                {
                    sb.AppendFormat("<td>{0}</td>", dataKeys[j]);
                }

                sb.Append("</tr>");
                }
            }

            sb.Append("</table>");


            labResult.Text = sb.ToString();
        }

        #endregion

    }
}
