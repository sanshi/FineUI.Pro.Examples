using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_clearselectionbeforepaging_details : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region LoadData

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable2();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<object[]> selectedDataKeys = Grid1.GetSelectedDataKeys();

            StringBuilder sb = new StringBuilder();
            if (selectedDataKeys.Count > 0)
            {
                sb.AppendFormat("<p><strong>共选中了 {0} 行：</strong></p>", selectedDataKeys.Count);
                sb.Append("<table class=\"result\">");

                sb.Append("<tr>");
                sb.Append("<th>标识符</th>");
                sb.Append("<th>姓名</th>");
                sb.Append("<th>专业</th>");
                sb.Append("</tr>");

                foreach (object[] rowDataKey in selectedDataKeys)
                {
                    string rowId = rowDataKey[0].ToString();
                    string rowName = rowDataKey[1].ToString();
                    string rowMajor = rowDataKey[2].ToString();

                    sb.Append("<tr>");
                    sb.AppendFormat("<td>{0}</td>", rowId);
                    sb.AppendFormat("<td>{0}</td>", rowName);
                    sb.AppendFormat("<td>{0}</td>", rowMajor);
                    sb.Append("</tr>");
                }

                sb.Append("</table>");
            }
            else
            {
                sb.Append("<strong>没有选中任何一行！</strong>");
            }


            labResult.Text = sb.ToString();
        }

        #endregion
    }
}
