using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using System.Xml;

namespace FineUI.Pro.Examples.multilang
{
    public partial class tree_checkbox : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetCheckedValues_Click(object sender, EventArgs e)
        {
            TreeNode[] nodes = Tree1.GetCheckedNodes();
            if (nodes.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                foreach (TreeNode node in nodes)
                {
                    sb.AppendFormat("{0} ", node.Text);
                }
                labResult.Text = GetLocalResourceObject("复选框选中的节点：") + sb.ToString();
            }
            else
            {
                labResult.Text = GetLocalResourceObject("没有复选框选中的节点").ToString();
            }
        }

    }
}
