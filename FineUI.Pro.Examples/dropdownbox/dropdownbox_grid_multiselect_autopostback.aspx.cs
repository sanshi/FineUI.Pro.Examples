using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownbox
{
    public partial class dropdownbox_grid_multiselect_autopostback : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
            else
            {
                // 回发时先清空
                labResult.Text = String.Empty;
                labResult2.Text = String.Empty;
            }
        }

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }



        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(DropDownBox1.Text))
            {
                labResult.Text = String.Format("[btnGetSelection_Click]下拉框文本：{0}（值：{1}）", DropDownBox1.Text, String.Join(", ",  DropDownBox1.Values));
            }
            else
            {
                labResult.Text = "[btnGetSelection_Click]下拉框为空";
            }
        }


        protected void DropDownBox1_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(DropDownBox1.Text))
            {
                labResult2.Text = String.Format("[DropDownBox1_TextChanged]下拉框文本：{0}（值：{1}）", DropDownBox1.Text, String.Join(", ",  DropDownBox1.Values));
            }
            else
            {
                labResult2.Text = "[DropDownBox1_TextChanged]下拉框为空";
            }
        }



    }
}
