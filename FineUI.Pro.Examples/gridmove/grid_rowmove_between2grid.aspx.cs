using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_rowmove_between2grid : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "CheckSelected_Click")
            {
                JArray content = e.EventArgumentsAsJObject.Value<JArray>("columnNames");

                StringBuilder sb = new StringBuilder();
                sb.Append("<ul>");
                foreach (JObject item in content)
                {
                    sb.AppendFormat("<li>ID:{0}&nbsp;&nbsp;&nbsp;&nbsp;Name:{1}</li>", item.Value<string>("id"), item.Value<string>("name"));
                }
                sb.Append("</ul>");

                ShowNotify(new RawHtml("已选择列表：" + sb.ToString()));
            }
        }


        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }



        #endregion


    }
}
