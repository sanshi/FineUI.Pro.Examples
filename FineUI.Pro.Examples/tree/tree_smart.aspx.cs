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
    public partial class tree_smart : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Tree1.SelectedNodeID = "ustc";
                
                //AddTooltipToTreeNode(Tree1.Nodes);
            }
        }

        //private void AddTooltipToTreeNode(TreeNodeCollection nodes)
        //{
        //    foreach (TreeNode node in nodes)
        //    {
        //        node.ToolTip = node.Text;

        //        if (node.Nodes != null && node.Nodes.Count > 0)
        //        {
        //            AddTooltipToTreeNode(node.Nodes);
        //        }
        //    }
        //}

        protected void cbxHideHScrollbar_CheckedChanged(object sender, CheckedEventArgs e)
        {
            Tree1.HideHScrollbar = cbxHideHScrollbar.Checked;
        }

        protected void cbxHideVScrollbar_CheckedChanged(object sender, CheckedEventArgs e)
        {
            Tree1.HideVScrollbar = cbxHideVScrollbar.Checked;
        }

        protected void cbxExpanderToRight_CheckedChanged(object sender, CheckedEventArgs e)
        {
            Tree1.ExpanderToRight = cbxExpanderToRight.Checked;
        }

        protected void cbxHeaderStyle_CheckedChanged(object sender, CheckedEventArgs e)
        {
            Tree1.HeaderStyle = cbxHeaderStyle.Checked;
        }

        protected void cbxAllHeaderStyle_CheckedChanged(object sender, CheckedEventArgs e)
        {
            Tree1.AllHeaderStyle = cbxAllHeaderStyle.Checked;
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

                cbxHeaderStyle.Checked = true;
                cbxAllHeaderStyle.Checked = true;
                cbxExpanderToRight.Checked = true;
                cbxHideHScrollbar.Checked = true;
                cbxHideVScrollbar.Checked = true;

                cbxHeaderStyle.Enabled = false;
                cbxAllHeaderStyle.Enabled = false;
                cbxExpanderToRight.Enabled = false;
                cbxHideHScrollbar.Enabled = false;
                cbxHideVScrollbar.Enabled = false;
            }
            else
            {
                Tree1.Width = Unit.Pixel(300);

                cbxHeaderStyle.Enabled = true;
                cbxAllHeaderStyle.Enabled = true;
                cbxExpanderToRight.Enabled = true;
                cbxHideHScrollbar.Enabled = true;
                cbxHideVScrollbar.Enabled = true;
            }
        }

    }
}
