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
    public partial class tree_nodedatabound_attributes : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }


        private void LoadData()
        {

            Tree1.DataSource = XmlDataSource1;
            Tree1.DataBind();

        }

        protected void Tree1_NodeDataBound(object sender, TreeNodeEventArgs e)
        {
            // 启用节点的点击事件
            e.Node.EnableClickEvent = true;

            XmlAttribute attr = e.XmlNode.Attributes["Highlight"];
            if(attr != null && Convert.ToBoolean(attr.Value)) {
                e.Node.Attributes["data-highlight"] = true;
            }
            
        }

        protected void Tree1_NodeCommand(object sender, TreeCommandEventArgs e)
        {
            var highlightText = "";
            if (e.Node.Attributes.Count > 0 && e.Node.Attributes.Value<bool>("data-highlight"))
            {
                highlightText = "（高亮显示）";
            }

            labResult.Text = "你点击了树节点：" + e.Node.Text + highlightText;
        }


    }
}
