using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.tree
{
    public partial class tree_reload : PageBase
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

        protected void btnUpdateNode_Click(object sender, EventArgs e)
        {
            var parentNode = Tree1.FindNode("zhumadian");

            parentNode.Nodes.Clear();

            var source = hfDataSource.Text;
            var nodes = source == "source1" ? GetSource2() : GetSource1();
            foreach(var node in nodes)
            {
                parentNode.Nodes.Add(node);
            }

            // 展开更新后的节点
            parentNode.Expanded = true;
            parentNode.Leaf = false;

            hfDataSource.Text = source == "source1" ? "source2" : "source1";

        }


        private List<TreeNode> GetSource2()
        {
            List<TreeNode> nodes = new List<TreeNode>();

            TreeNode node = null;

            node = new TreeNode();
            node.Text = "遂平县";
            node.Leaf = false;
            node.NodeID = "suiping";
            nodes.Add(node);

            var suipingNodes = node.Nodes;
            node = new TreeNode();
            node.Text = "槐树乡";
            node.Leaf = false;
            node.NodeID = "huaishu";
            suipingNodes.Add(node);

            var huaishuNodes = node.Nodes;
            node = new TreeNode();
            node.Text = "陈庄村";
            node.Leaf = true;
            node.NodeID = "chenzhuang";
            huaishuNodes.Add(node);

            node = new TreeNode();
            node.Text = "王老庄";
            node.Leaf = true;
            node.NodeID = "wanglaozhuang";
            huaishuNodes.Add(node);

            node = new TreeNode();
            node.Text = "嵖岈山乡";
            node.Leaf = true;
            node.NodeID = "chayashan";
            suipingNodes.Add(node);

            node = new TreeNode();
            node.Text = "西平县";
            node.Leaf = true;
            node.NodeID = "xiping";
            nodes.Add(node);

            return nodes;
        }

        private List<TreeNode> GetSource1()
        {
            List<TreeNode> nodes = new List<TreeNode>();

            TreeNode node = null;

            node = new TreeNode();
            node.Text = "平舆县";
            node.Leaf = true;
            node.NodeID = "pingyu";
            nodes.Add(node);

            node = new TreeNode();
            node.Text = "汝南县";
            node.Leaf = true;
            node.NodeID = "runan";
            nodes.Add(node);

            node = new TreeNode();
            node.Text = "新蔡县";
            node.Leaf = true;
            node.NodeID = "xincai";
            nodes.Add(node);

            return nodes;
        }

    }
}
