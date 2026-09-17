using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.griddataurl
{
    public partial class griddataurl_selectrows_rowdata : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 网址数据源模式下也应按稳定行ID设置选中项。
                Grid1.SelectedRowIDArray = new string[] { "105", "110" };
            }
        }


        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<table class=\"result\"><tr><th>ID</th><th>姓名</th><th>性别</th><th>所学专业</th></tr>");
            foreach (string rowId in Grid1.SelectedRowIDArray)
            {
                JObject rowValue = GetDataUrlSelectedRowValue(rowId);
                if (rowValue != null)
                {
                    sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td></tr>",
                        rowId,
                        rowValue.Value<string>("Name"),
                        rowValue.Value<int>("Gender") == 0 ? "女" : "男",
                        rowValue.Value<string>("Major"));
                }
            }
            sb.Append("</table>");

            labResult.Text = "选中的行：<br/>" + sb.ToString();
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            // 网址数据源模式下也应按稳定行ID设置选中项。
            Grid1.SelectedRowIDArray = new string[] { "102", "106", "108" };
        }

        #endregion

    }
}
