using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_empty_text_fewcolumns : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["EMPTY_DATA_SOURCE"] = true;

                Grid1.EmptyTextRawHtml = new RawHtml("<div class=\"grid-empty-text\">Oops...一条数据也没有找到！</div>");

            }
        }


        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable table;
            if (Convert.ToBoolean(ViewState["EMPTY_DATA_SOURCE"]))
            {
                ViewState["EMPTY_DATA_SOURCE"] = false;
                table = DataSourceUtil.GetDataTable();
            }
            else
            {
                ViewState["EMPTY_DATA_SOURCE"] = true;
                table = null;
            }

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

    }
}
