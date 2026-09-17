using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownlist
{
    public partial class dropdownlist_no_forceselection_empty : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 设置下拉列表的初始值为自定义文本
                DropDownList1.Text = "初始自定义值";
            }
        }

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(DropDownList1.SelectedValue))
            {
                labResult.Text = String.Format("选中项：{0}（值：{1}）", DropDownList1.Text, DropDownList1.SelectedValue);
            }
            else
            {
                labResult.Text = String.Format("用户输入值：{0}", DropDownList1.Text);
            }
        }

        protected void btnRebindData_Click(object sender, EventArgs e)
        {
            if (DropDownList1.Items.Count == 0)
            {
                List<string> strList = new List<string>();
                strList.Add("可选项1");
                strList.Add("可选项2");
                strList.Add("可选项3");
                strList.Add("可选项4");
                strList.Add("可选项5");
                strList.Add("可选项6");
                strList.Add("可选择项7");
                strList.Add("可选择项8");
                strList.Add("可选择项9");

                DropDownList1.DataSource = strList;
                DropDownList1.DataBind();
            }
            else
            {
                DropDownList1.DataSource = null;
                DropDownList1.DataBind();
            }
        }


        protected void btnSetText_Click(object sender, EventArgs e)
        {
            DropDownList1.Text = "用户输入值";
        }
    }
}
