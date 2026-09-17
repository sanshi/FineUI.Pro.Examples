using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.tree
{
    public partial class tree_lazyload_smart : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Tree1_NodeLazyLoad(object sender, TreeNodeEventArgs e)
        {
            DynamicAppendNode(e.Node);
        }

        private void DynamicAppendNode(TreeNode parentNode)
        {
            // 防止浏览器端多次快速点击
            parentNode.Nodes.Clear();

            TreeNode node = null;
            switch (parentNode.NodeID)
            {
                case "zhumadian":
                    node = new TreeNode();
                    node.Text = "遂平县（延迟加载）";
                    node.Leaf = false;
                    node.NodeID = "suiping";
                    parentNode.Nodes.Add(node);

                    node = new TreeNode();
                    node.Text = "西平县";
                    node.Leaf = true;
                    node.NodeID = "xiping";
                    parentNode.Nodes.Add(node);
                    break;
                case "suiping":
                    node = new TreeNode();
                    node.Text = "槐树乡（延迟加载）";
                    node.Leaf = false;
                    node.NodeID = "huaishu";
                    parentNode.Nodes.Add(node);

                    node = new TreeNode();
                    node.Text = "嵖岈山乡";
                    node.Leaf = true;
                    node.NodeID = "chayashan";
                    parentNode.Nodes.Add(node);
                    break;
                case "huaishu":
                    node = new TreeNode();
                    node.Text = "陈庄村";
                    node.Leaf = true;
                    node.NodeID = "chenzhuang";
                    parentNode.Nodes.Add(node);

                    node = new TreeNode();
                    node.Text = "王老庄";
                    node.Leaf = true;
                    node.NodeID = "wanglaozhuang";
                    parentNode.Nodes.Add(node);
                    break;
            }
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


        protected void cbxMiniMode_CheckedChanged(object sender, CheckedEventArgs e)
        {
            Tree1.MiniMode = cbxMiniMode.Checked;

            // 如果启用微型模式，则强制启用其他属性（建议微型模式的最小宽度为60px）
            if (cbxMiniMode.Checked)
            {
                Tree1.Width = Unit.Pixel(60);

                Tree1.HideHScrollbar = true;
                Tree1.HideVScrollbar = true;
                Tree1.ExpanderToRight = true;
                Tree1.HeaderStyle = true;
                Tree1.AllHeaderStyle = true;
            }
            else
            {
                Tree1.Width = Unit.Pixel(300);

                Tree1.HideHScrollbar = false;
                Tree1.HideVScrollbar = false;
                Tree1.ExpanderToRight = false;
                Tree1.HeaderStyle = false;
                Tree1.AllHeaderStyle = false;
            }
        }
    }
}
