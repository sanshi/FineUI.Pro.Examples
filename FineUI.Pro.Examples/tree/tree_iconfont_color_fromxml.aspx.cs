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
    public partial class tree_iconfont_color_fromxml : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        // 已经增加的CSS，放置重复增加相同的CSS
        private List<string> _addedCssNames;

        private void LoadData()
        {
            // 绑定树控件数据之前，先初始化变量
            _addedCssNames = new List<string>();

            Tree1.DataSource = XmlDataSource1;
            Tree1.DataBind();
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

        protected void Tree1_PreNodeDataBound(object sender, TreePreNodeEventArgs e)
        {
            XmlAttribute iconFontColorAttr = e.XmlNode.Attributes["IconFontColor"];
            if (iconFontColorAttr != null)
            {
                string iconFontColor = iconFontColorAttr.Value;

                // 规范化后的 CSS 名称
                string normalizedCssName = "tn_color_" + iconFontColor.Replace('#', '_');

                // 动态添加 CSS
                if (!_addedCssNames.Contains(normalizedCssName))
                {
                    _addedCssNames.Add(normalizedCssName);

                    string cssContent = String.Format(".{0} .f-tree-folder,.{0} .f-tree-cell-text{{color:{1};}}", normalizedCssName, iconFontColor);
                    PageContext.RegisterStartupScript(String.Format("F.addCSS('{0}','{1}');", normalizedCssName, cssContent));
                }

                // 更新节点的 CssClass 属性
                XmlAttribute cssClassAttr = e.XmlNode.Attributes["CssClass"];
                if (cssClassAttr != null)
                {
                    e.XmlNode.Attributes["CssClass"].Value = cssClassAttr.Value + " " + normalizedCssName;
                }
                else
                {
                    XmlAttribute newCssClassAttr = e.XmlNode.OwnerDocument.CreateAttribute("CssClass");
                    newCssClassAttr.Value = normalizedCssName;
                    e.XmlNode.Attributes.Append(newCssClassAttr);
                }
                

            }

        }
    }
}
