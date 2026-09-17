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
    public partial class tree_nodecommand_contextmenu : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Tree1_NodeCommand(object sender, TreeCommandEventArgs e)
        {
            labResult.Text = "你点击了树节点：" + e.Node.Text;
        }


    }
}
