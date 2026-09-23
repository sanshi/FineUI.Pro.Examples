using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Xml;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.mobile
{
    public partial class main : MobilePageBase
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
            XmlDocument doc = XmlDataSource1.GetXmlDocument();
            XmlNode mobileRootNode = doc.SelectSingleNode("/Tree/TreeNode[@Text=\"移动\"]");

            JArray menuSource = new JArray();
            //int index = 0;
            foreach(XmlNode node in mobileRootNode.ChildNodes) {
                string menuText = node.Attributes["Text"].Value;

                if (menuText == "移动首页") {
                    continue; // 不添加本项
                }

                JObject menu = new JObject();
                menu.Add("text", menuText);

                ResolveXmlNode(node, menu);

                menuSource.Add(menu);

            }


            //// 顶层菜单绑定到数据列表
            //DataList1.DataSource = menuSource;
            //DataList1.DataBind();

            // 注册脚本 - 移动菜单数据源
            PageContext.RegisterStartupScript(String.Format("window.MENUSOURCE = {0};", menuSource.ToString()));
        }

        private void ResolveXmlNode(XmlNode node, JObject parentMenu)
        {
            // 二级菜单
            JArray subMenus = new JArray();
            foreach (XmlNode subnode in node.ChildNodes)
            {
                JObject subMenu = new JObject();
                string subMenuText = subnode.Attributes["Text"].Value;

                if (subnode.HasChildNodes)
                {
                    subMenu.Add("text", subMenuText);

                    ResolveXmlNode(subnode, subMenu);
                }
                else
                {
                    string subMenuNavigateUrl = subnode.Attributes["NavigateUrl"].Value;

                    subMenu.Add("text", subMenuText);
                    subMenu.Add("navigateUrl", ResolveClientUrl(subMenuNavigateUrl).Replace("/?file=", "/"));
                }

                subMenus.Add(subMenu);
            }

            parentMenu.Add("children", subMenus);
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            JObject topMenu = e.DataItem as JObject;
            string text = topMenu.Value<string>("text");

            e.Item.Text = String.Format("<div class=\"item-text\">{0}</div>", text);
            e.Item.NavigateUrl = "#";
            e.Item.ShowArrow = true;
            
        }

    }
}
