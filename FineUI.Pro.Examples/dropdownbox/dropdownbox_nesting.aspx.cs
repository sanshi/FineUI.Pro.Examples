using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownbox
{
    public partial class dropdownbox_nesting : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            DataView view = table.DefaultView;

            List<string> filters = new List<string>();

            // 性别过滤
            if (!String.IsNullOrEmpty(ddlGender.SelectedValue))
            {
                filters.Add(String.Format("Gender = {0}", ddlGender.SelectedValue));
            }

            // 专业过滤
            if (ddbMajor.Values != null && ddbMajor.Values.Length > 0)
            {
                List<string> majorFilters = new List<string>();
                foreach (string ddb in ddbMajor.Values)
                {
                    majorFilters.Add(String.Format("Major = '{0}'", ddb));
                }
                filters.Add("(" + String.Join(" OR ", majorFilters.ToArray()) + ")");
            }

            if (filters.Count > 0)
            {
                view.RowFilter = String.Join(" AND ", filters.ToArray());
            }

            Grid1.DataSource = table;
            Grid1.DataBind();
        }


        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(DropDownBox1.Text))
            {
                labResult.Text = String.Format("下拉框文本：{0}（值：{1}）", DropDownBox1.Text, DropDownBox1.Value);
            }
            else
            {
                labResult.Text = "下拉框为空";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void DropDownBox2_TextChanged(object sender, EventArgs e)
        {
            BindGrid();
        }



    }
}
