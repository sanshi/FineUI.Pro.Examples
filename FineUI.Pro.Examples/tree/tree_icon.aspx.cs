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
    public partial class tree_icon : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btnGetSelectedNode_Click(object sender, EventArgs e)
        {
            string selectedId = Tree1.SelectedNodeID;
            if (!String.IsNullOrEmpty(selectedId))
            {
                labResult.Text = "选中的节点：" + Tree1.FindNode(selectedId).Text;
            }
            else
            {
                labResult.Text = "没有选中节点";
            }
        }
    }
}
