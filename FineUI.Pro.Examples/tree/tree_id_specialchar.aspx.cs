using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using System.Xml;

namespace FineUI.Pro.Examples.tree
{
    public partial class tree_id_specialchar : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Tree1.SelectedNodeID = "@#驻马店市 $!";
            }
        }


        protected void btnGetSelectedValues_Click(object sender, EventArgs e)
        {
            string[] nodeIds = Tree1.SelectedNodeIDArray;
            if (nodeIds.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<ul>");
                foreach (string nodeId in nodeIds)
                {
                    TreeNode node = Tree1.FindNode(nodeId);
                    sb.AppendFormat("<li>NodeID：{0}&nbsp;&nbsp;&nbsp;Text：{1}</li>", node.NodeID, node.Text);
                }
                sb.Append("</ul>");
                labResult.Text = "选中的节点：" + sb.ToString();
            }
            else
            {
                labResult.Text = "没有选中节点";
            }
        }
    }
}
