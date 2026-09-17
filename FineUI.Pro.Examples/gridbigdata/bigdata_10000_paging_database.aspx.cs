using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.gridbigdata
{
    public partial class bigdata_10000_paging_database : PageBase
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
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = 10000;

            // 2.获取当前分页数据
            JArray source = BigDataUtil.GetBigData(10000, Grid1.PageIndex, Grid1.PageSize);

            // 3.绑定到Grid
            Grid1.DataSource = source;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = "选中的行ID：" + String.Join(", ", Grid1.SelectedRowIDArray);
        }

        protected void Grid1_PageIndexChanged(object sender, GridPageEventArgs e)
        {
            BindGrid();
        }

        #endregion


    }
}
