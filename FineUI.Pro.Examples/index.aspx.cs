using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

namespace FineUI.Pro.Examples
{
    public partial class index : PageBase
    {
        #region 变量

        // 左侧侧边栏宽度
        private int SIDEBAR_WIDTH_CONSTANT = 320;

        // 左侧侧边栏微型模式宽度
        private int SIDEBAR_MINIMODE_WIDTH_CONSTANT = 70;


        // 是否仅显示社区版示例
        private bool _showOnlyCommunity = false;
        // 搜索文件
        private string _searchText = "";
        // 主选项卡标签页
        private string _mainTabs = "multi";
        // 当前显示的示例数
        private int _examplesCount = 0;

        #endregion

        #region Page_Init

        protected void Page_Init(object sender, EventArgs e)
        {
            // 从Cookie中读取 - 是否仅显示社区版示例
            HttpCookie menuShowOnlyCommunity = Request.Cookies["ShowOnlyCommunity"];
            if (menuShowOnlyCommunity != null)
            {
                _showOnlyCommunity = Convert.ToBoolean(menuShowOnlyCommunity.Value);
            }

            // 从Cookie中读取 - 搜索文本
            HttpCookie searchText = Request.Cookies["SearchText"];
            if (searchText != null)
            {
                _searchText = HttpUtility.UrlDecode(searchText.Value);
            }

            // 从Cookie中读取 - 是否单标签页
            HttpCookie mainTabs = Request.Cookies["MainTabs"];
            if (mainTabs != null)
            {
                _mainTabs = mainTabs.Value;
            }

            InitTreeMenu();
        }

        #endregion

        #region InitTreeMenu

        private void InitTreeMenu()
        {
            XmlDocument doc = XmlDataSource1.GetXmlDocument();

            // 返回全部的叶子节点个数
            _examplesCount = ResolveXmlNodeList(treeMenu.Nodes, doc.DocumentElement.ChildNodes);

        }


        private int _nodeIndex = 0;

        private int ResolveXmlNodeList(IList<TreeNode> nodes, XmlNodeList xmlNodes)
        {
            // nodes 中渲染到页面上的节点个数
            int nodeVisibleCount = 0;

            foreach (XmlNode xmlNode in xmlNodes)
            {
                if (xmlNode.NodeType != XmlNodeType.Element)
                {
                    continue;
                }

                TreeNode node = new TreeNode();

                // 是否叶子节点
                bool isLeaf = xmlNode.ChildNodes.Count == 0;

                bool currentNodeIsVisible = true;

                string nodeText = "";
                bool nodeIsEnterprise = false;

                XmlAttribute textAttr = xmlNode.Attributes["Text"];
                if (textAttr != null)
                {
                    nodeText = textAttr.Value;
                }

                // 是否企业版
                XmlAttribute isEnterpriseAttr = xmlNode.Attributes["IsEnterprise"];
                if (isEnterpriseAttr != null)
                {
                    nodeIsEnterprise = isEnterpriseAttr.Value.ToLower() == "true";
                }

                string nodeVersion = "";
                // 示例关联的版本号
                XmlAttribute versionAttr = xmlNode.Attributes["Version"];
                if (versionAttr != null)
                {
                    nodeVersion = versionAttr.Value;
                }


                int childVisibleCount = 0;
                if (isLeaf)
                {
                    // 仅显示社区版示例
                    if (_showOnlyCommunity && nodeIsEnterprise)
                    {
                        currentNodeIsVisible = false;
                    }

                    // 存在搜索文本
                    if (!String.IsNullOrEmpty(_searchText))
                    {
                        if (!nodeText.Contains(_searchText))
                        {
                            currentNodeIsVisible = false;
                        }
                    }
                }
                else
                {
                    // 递归
                    childVisibleCount = ResolveXmlNodeList(node.Nodes, xmlNode.ChildNodes);

                    nodeVisibleCount += childVisibleCount;

                    if (childVisibleCount == 0)
                    {
                        currentNodeIsVisible = false;
                    }
                    else
                    {
                        // 存在搜索文本
                        if (!String.IsNullOrEmpty(_searchText))
                        {
                            // 展开节点
                            node.Expanded = true;
                        }
                    }

                    // 目录节点不可选择
                    node.Selectable = false;
                }

                if (currentNodeIsVisible)
                {
                    foreach (XmlAttribute attribute in xmlNode.Attributes)
                    {
                        string name = attribute.Name;
                        string value = attribute.Value;

                        if (name == "Text")
                        {
                            // Text需要特殊处理
                            if (isLeaf)
                            {
                                // 设置节点的提示信息
                                node.ToolTip = nodeText;
                            }

                            // 存在 IsEnterprise=True 属性，则改变 Text 的值
                            if (nodeIsEnterprise)
                            {
                                node.IconFont = IconFont._Enterprise;
                                //nodeText = nodeText + "&nbsp;<span class=\"iscorp\">Corp.</span>";
                            }

                            StringBuilder nodeTextBuilder = new StringBuilder();
                            nodeTextBuilder.AppendFormat("<span class=\"text\">{0}</span>", nodeText);

                            if (childVisibleCount > 0)
                            {
                                nodeTextBuilder.AppendFormat("<span class=\"menu-child-count\">{0}</span>", childVisibleCount);
                            }

                            if (!String.IsNullOrEmpty(nodeVersion))
                            {
                                nodeTextBuilder.AppendFormat("<span class=\"menu-version\">{0}</span>", nodeVersion);
                            }

                            // 节点文本是开发者拼接的可信 HTML，用 TextRawHtml 标记为原样输出（不转义）
                            node.TextRawHtml = new RawHtml(nodeTextBuilder.ToString());
                        }
                        else
                        {
                            node.SetPropertyValue(name, value);
                        }
                    }

                    // 为每个节点分配一个ID
                    node.NodeID = String.Format("tn_{0}", _nodeIndex++);

                    nodes.Add(node);



                    // 示例数只计算叶子节点
                    if (isLeaf)
                    {
                        nodeVisibleCount++;
                    }

                }

            }

            return nodeVisibleCount;
        }

        #endregion

        #region Page_Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitSearchBox();

                if (_showOnlyCommunity)
                {
                    btnUserAvatar.Badge = true;
                    btnUserAvatar.BadgeText = "仅社区版";
                    btnUserAvatar.BadgeType = BadgeType.Warning;
                }

                InitMenuFramePageStyleButton();
                InitMenuDisplayModeButton();
                InitLangMenuButton();
                InitMenuRegionButton();

                cbxShowOnlyCommunity.Checked = _showOnlyCommunity;

                menuTextCopyright.TextRawHtml = new RawHtml("<div class=\"copyright\">" +
                    "<div class=\"version\"><a target=\"_blank\" href=\"http://fineui.com/pro/\"><img src=\"./res/images/logo/fineui.png\" alt=\"logo\"/></a>" +
                    "<br/><span>FineUI.Pro v" + GlobalConfig.ProductVersion + "</span></div>" +
                    "<div class=\"actions\"><a target=\"_blank\" href=\"http://fineui.com/fans/\">免费社区</a>" +
                    "&nbsp;&nbsp;&nbsp;&nbsp;<a target=\"_blank\" href=\"http://fineui.com/versions/\">更新记录</a></div>" +
                    "</div>");

                hfExamplesCount.Text = _examplesCount.ToString();

                // 为CSS样式文件添加版本号，防止版本更新时客户端缓存
                linkIndexCSS.Href = PageContext.ResolveUrl("~/res/css/index.css?v" + GlobalConfig.ProductVersion);
                linkMobileViewCss.Href = PageContext.ResolveUrl("~/res/css/mobileview.css?v" + GlobalConfig.ProductVersion);
                //litScriptIndex.Text = String.Format("<script src=\"{0}\"></script>", PageContext.ResolveUrl("~/res/js/index.js?v" + GlobalConfig.ProductVersion));



                // 单标签页
                if (_mainTabs == "single")
                {
                    mainTabStrip.ShowTabHeader = false;
                }


                // 设置侧边栏宽度
                sidebarRegion.Width = SIDEBAR_WIDTH_CONSTANT;

                // 创建样式控件
                litDynamicCSS.Text = String.Format("<style type=\"text/css\">:root {{ --sidebar-width: {0}px; --sidebar-minimode-width: {1}px; }}</style>",
                    SIDEBAR_WIDTH_CONSTANT, 
                    SIDEBAR_MINIMODE_WIDTH_CONSTANT);

            }

        }


        private void InitSearchBox()
        {
            if (!String.IsNullOrEmpty(_searchText))
            {
                ttbxSearch.Text = _searchText;
                ttbxSearch.ShowTrigger1 = true;
                ttbxSearch.Width = 200;
                ttbxSearch.CssClass = "searchbox expanded";
            }
        }

        private void InitMenuFramePageStyleButton()
        {
            string framePageStyle = "f-dark-left";

            HttpCookie indexStyleCookie = Request.Cookies["FramePageStyle"];
            if (indexStyleCookie != null)
            {
                framePageStyle = indexStyleCookie.Value;
            }

            SetSelectedMenuItem(MenuFramePageStyle, framePageStyle);
        }

        private void InitMenuDisplayModeButton()
        {
            string displayMode = "normal";

            HttpCookie displayModeCookie = Request.Cookies["DisplayMode"];
            if (displayModeCookie != null)
            {
                displayMode = displayModeCookie.Value;
            }

            SetSelectedMenuItem(MenuDisplayMode, displayMode);
        }


        private void InitLangMenuButton()
        {
            string language = "zh_CN";

            HttpCookie languageCookie = Request.Cookies["Language"];
            if (languageCookie != null)
            {
                language = languageCookie.Value;
            }

            SetSelectedMenuItem(MenuLang, language);
        }

        private void InitMenuRegionButton()
        {
            string mainTabs = "multi";

            HttpCookie mainTabsCookie = Request.Cookies["MainTabs"];
            if (mainTabsCookie != null)
            {
                mainTabs = mainTabsCookie.Value;
            }

            SetSelectedMenuItem(MenuMainTabs, mainTabs);
        }

        private void SetSelectedMenuItem(MenuButton menuButton, string selectedDataTag)
        {
            foreach (MenuItem item in menuButton.Menu.Items)
            {
                MenuCheckBox checkbox = (item as MenuCheckBox);
                if (checkbox != null)
                {
                    checkbox.Checked = checkbox.AttributeDataTag == selectedDataTag;
                }
            }
        }

        #endregion

    }
}
